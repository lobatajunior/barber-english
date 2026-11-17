import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'tts_web.dart' if (dart.library.io) 'tts_stub.dart';
import 'mic_web.dart' if (dart.library.io) 'mic_stub.dart';
import 'mic_config.dart';
import 'api_keys.dart';
import 'pronunciation_text.dart' show scorePronunciation, WordDiff;
import 'pronunciation_text.dart' as pt show wordDiffs;

class SpeechService {
  final AudioPlayer _player = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _listening = false;

  // Sesión nativa en curso (Android/iOS): graba con record y detecta el fin
  // del habla con un VAD propio basado en el nivel de amplitud (dBFS) que
  // reporta el propio grabador — sin depender de ningún reconocedor de voz.
  StreamSubscription<Amplitude>? _nativeAmpSub;
  Timer? _nativeMaxDurationTimer;
  bool _nativeStopped = true;
  bool _nativeHasSpeech = false;
  DateTime? _nativeSilenceStart;
  DateTime? _nativeRecordStart;

  // Callbacks de la escucha nativa en curso (para tocar y terminar).
  void Function(String words)? _nativeOnResult;
  void Function()? _nativeOnDone;
  void Function()? _nativeOnStopped;
  void Function()? _nativeOnCancelled;

  // Valores en mic_config.dart.
  static const _nativeListenMax = Duration(milliseconds: kMicNativoTopeMs);
  static const _nativeSilenceAfterSpeech =
      Duration(milliseconds: kMicNativoSilencioMs);
  static const _nativeSilenceThresholdDb = kMicNativoUmbralDb;

  // Grabaciones más cortas que esto no se envían a Whisper: son un intento
  // fallido (sin puntaje), igual que una transcripción vacía.
  static const _minRecording = Duration(milliseconds: kMicGrabacionMinMs);

  void _log(String msg) {
    if (!kMicDebug) return;
    final start = _nativeRecordStart;
    final ms = start == null ? 0 : DateTime.now().difference(start).inMilliseconds;
    debugPrint('[mic] +$ms ms · $msg');
  }

  final StreamController<void> _webCompleteController =
      StreamController<void>.broadcast();

  SpeechService() {
    if (kIsWeb) {
      setupWebTtsComplete(_webCompleteController);
    }
  }

  Stream<void> get onPlayComplete =>
      kIsWeb ? _webCompleteController.stream : _player.onPlayerComplete;

  Future<void> speak(String text) async {
    if (kIsWeb) {
      speakOnWeb(text);
    } else {
      await _player.stop();
      final encoded = Uri.encodeComponent(text);
      await _player.play(
        UrlSource(
          'https://translate.google.com/translate_tts'
          '?ie=UTF-8&q=$encoded&tl=en&client=tw-ob',
        ),
      );
    }
  }

  Future<void> stopSpeaking() async {
    if (kIsWeb) {
      stopSpeakingOnWeb();
    } else {
      await _player.stop();
    }
  }

  bool get isListening => _listening;

  /// Graba y transcribe con Whisper.
  ///
  /// - [onStopped]: la grabación paró y se está enviando a Whisper
  ///   (la interfaz pasa a "Procesando…").
  /// - [onResult]: texto de Whisper ('' = intento fallido sin puntaje).
  /// - [onNoVoice]: no se oyó voz (web, [kMicSinVozMs]); no se envió nada.
  /// - [onCancelled]: se tocó el micrófono sin haber hablado; no se envió nada.
  /// - [onUnsupported]: el navegador no puede grabar en ningún formato.
  /// - [onDone]: siempre al final (también si se negó el micrófono).
  ///
  /// [owner] identifica al ejercicio: el permiso del micrófono se reutiliza en
  /// sus reintentos y se cierra con [releaseMic]. [listaDePalabras] alarga el
  /// silencio que da la grabación por terminada.
  Future<bool> startListening({
    required void Function(String words) onResult,
    required void Function() onDone,
    void Function(double level)? onSoundLevel,
    void Function()? onStopped,
    void Function()? onNoVoice,
    void Function()? onCancelled,
    void Function()? onUnsupported,
    String target = '',
    bool listaDePalabras = false,
    String owner = '',
  }) async {
    if (_listening) return false;

    if (kIsWeb) {
      _listening = true;
      micStart(
        cfg: {
          'debug': kMicDebug,
          'owner': owner,
          'reuse': kMicReusarStream,
          'formatos': kMicFormatos,
          'calibrationMs': kMicCalibracionMs,
          'signalMin': kMicSenalMinRms,
          'signalWaitMs': kMicEsperaSenalMs,
          'intervalMs': kMicIntervaloMs,
          'speechFactor': kMicFactorVoz,
          'speechMin': kMicUmbralVozMin,
          'silenceFactor': kMicFactorSilencio,
          'silenceMin': kMicUmbralSilencioMin,
          'silenceMaxRatio': kMicSilencioMaxRespectoVoz,
          'silenceMs': micSilencioMs(listaDePalabras: listaDePalabras),
          'maxMs': micTopeMs(target),
          'minBeforeStopMs': kMicMinAntesDePararMs,
          'noVoiceMs': kMicSinVozMs,
          'minRecordingMs': kMicGrabacionMinMs,
          'endpoint': 'https://api.openai.com/v1/audio/transcriptions',
          'apiKey': kWhisperApiKey,
        },
        onStopped: () => onStopped?.call(),
        onResult: onResult,
        onNoVoice: () => onNoVoice?.call(),
        onCancelled: () => onCancelled?.call(),
        onUnsupported: () => onUnsupported?.call(),
        onDone: () {
          _listening = false;
          onDone();
        },
      );
      return true;
    }

    return _startNativeListening(
      onResult: onResult,
      onDone: onDone,
      onSoundLevel: onSoundLevel,
      onStopped: onStopped,
      onCancelled: onCancelled,
    );
  }

  /// Toque en el micrófono mientras graba: envía ya si hubo voz; si no,
  /// cancela sin enviar ([onCancelled]).
  Future<void> finishListening() async {
    if (!_listening) return;
    if (kIsWeb) {
      micFinish();
      return;
    }
    if (_nativeStopped) return;
    final onResult = _nativeOnResult, onDone = _nativeOnDone;
    if (_nativeHasSpeech && onResult != null && onDone != null) {
      _log('parada (toque)');
      await _finishNativeRecording(onResult, onDone);
    } else {
      _log('parada (toque sin voz): cancelada');
      final onCancelled = _nativeOnCancelled;
      await stopListening();
      onCancelled?.call();
      onDone?.call();
    }
  }

  /// Cierra el micrófono del ejercicio [owner] (al salir del ejercicio).
  void releaseMic(String owner) {
    if (kIsWeb) micRelease(owner);
  }

  // ── STT nativo (Android/iOS): graba con record y transcribe vía Whisper.
  // Sin speech_to_text: el fin del habla se detecta con un VAD propio sobre
  // el nivel de amplitud (dBFS) que reporta record.onAmplitudeChanged.
  Future<bool> _startNativeListening({
    required void Function(String words) onResult,
    required void Function() onDone,
    void Function(double level)? onSoundLevel,
    void Function()? onStopped,
    void Function()? onCancelled,
  }) async {
    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) return false;

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/pronunciation_${DateTime.now().millisecondsSinceEpoch}.m4a';

    _listening = true;
    _nativeStopped = false;
    _nativeHasSpeech = false;
    _nativeSilenceStart = null;
    _nativeOnResult = onResult;
    _nativeOnDone = onDone;
    _nativeOnStopped = onStopped;
    _nativeOnCancelled = onCancelled;

    await _recorder.start(const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path);
    _nativeRecordStart = DateTime.now();
    _log('inicio de grabación');

    _nativeAmpSub = _recorder
        .onAmplitudeChanged(const Duration(milliseconds: 100))
        .listen((amp) {
      onSoundLevel?.call(amp.current);
      if (amp.current > _nativeSilenceThresholdDb) {
        if (!_nativeHasSpeech) _log('voz detectada (${amp.current} dB)');
        _nativeHasSpeech = true;
        _nativeSilenceStart = null;
      } else if (_nativeHasSpeech) {
        if (_nativeSilenceStart == null) _log('silencio detectado');
        final silenceStart = _nativeSilenceStart ??= DateTime.now();
        if (DateTime.now().difference(silenceStart) >=
            _nativeSilenceAfterSpeech) {
          _finishNativeRecording(onResult, onDone);
        }
      }
    });

    _nativeMaxDurationTimer = Timer(_nativeListenMax, () {
      _log('tope de grabación');
      _finishNativeRecording(onResult, onDone);
    });

    return true;
  }

  Future<void> _finishNativeRecording(
    void Function(String words) onResult,
    void Function() onDone,
  ) async {
    if (_nativeStopped) return;
    _nativeStopped = true;
    _nativeMaxDurationTimer?.cancel();
    _log('parada');
    _nativeOnStopped?.call();
    await _nativeAmpSub?.cancel();
    _nativeAmpSub = null;
    _listening = false;

    final path = await _recorder.stop();
    if (path == null) {
      debugPrint('[DEBUG record] path nulo, no se grabó nada');
      onResult('');
      onDone();
      return;
    }

    final fileSize = await File(path).length();
    debugPrint('[DEBUG record] archivo="$path" tamaño=${fileSize}B');

    final start = _nativeRecordStart;
    if (start == null || DateTime.now().difference(start) < _minRecording) {
      debugPrint('[DEBUG record] grabación < 1 s, intento fallido');
      onResult('');
      onDone();
      return;
    }

    try {
      final uri = Uri.parse('https://api.openai.com/v1/audio/transcriptions');
      final request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $kWhisperApiKey'
        ..fields['model'] = 'whisper-1'
        ..fields['language'] = 'en'
        // Temperatura 0: Whisper no inventa palabras.
        ..fields['temperature'] = '0'
        ..files.add(
          await http.MultipartFile.fromPath('file', path, filename: 'audio.m4a'),
        );
      _log('envío a Whisper: ${fileSize}B');
      final sent = DateTime.now();
      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);
      _log('respuesta de Whisper en '
          '${DateTime.now().difference(sent).inMilliseconds} ms');
      debugPrint(
          '[DEBUG whisper] status=${response.statusCode} body=${response.body}');
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final text = (data['text'] as String? ?? '').trim();
      onResult(text);
    } catch (e) {
      debugPrint('Whisper API error: $e');
      onResult('');
    }
    onDone();
  }

  /// Cancela una escucha nativa en curso sin transcribir (a diferencia de
  /// [_finishNativeRecording], que sí sube el audio a Whisper).
  Future<void> stopListening() async {
    if (kIsWeb) {
      micCancel();
    } else {
      _nativeMaxDurationTimer?.cancel();
      await _nativeAmpSub?.cancel();
      _nativeAmpSub = null;
      if (!_nativeStopped) {
        _nativeStopped = true;
        await _recorder.stop();
      }
    }
    _listening = false;
  }

  /// Puntaje 0–100 estricto palabra por palabra (ver [scorePronunciation]
  /// en pronunciation_text.dart, donde vive la normalización compartida).
  double calculateScore(String spoken, String target) =>
      scorePronunciation(spoken, target);

  /// Diferencias palabra por palabra entre lo esperado y lo escuchado.
  List<WordDiff> wordDiffs(String spoken, String target) =>
      pt.wordDiffs(spoken, target);

  void dispose() {
    _nativeMaxDurationTimer?.cancel();
    _nativeAmpSub?.cancel();
    _player.dispose();
    _webCompleteController.close();
    if (!kIsWeb) _recorder.dispose();
  }
}
