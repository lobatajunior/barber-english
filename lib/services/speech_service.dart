import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'tts_web.dart' if (dart.library.io) 'tts_stub.dart';
import 'api_keys.dart';
import 'pronunciation_text.dart' show scorePronunciation, WordDiff;
import 'pronunciation_text.dart' as pt show wordDiffs;

class SpeechService {
  final AudioPlayer _player = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _listening = false;
  Timer? _listenTimer;

  // Sesión nativa en curso (Android/iOS): graba con record y detecta el fin
  // del habla con un VAD propio basado en el nivel de amplitud (dBFS) que
  // reporta el propio grabador — sin depender de ningún reconocedor de voz.
  StreamSubscription<Amplitude>? _nativeAmpSub;
  Timer? _nativeMaxDurationTimer;
  bool _nativeStopped = true;
  bool _nativeHasSpeech = false;
  DateTime? _nativeSilenceStart;
  DateTime? _nativeRecordStart;

  static const _nativeListenMax = Duration(seconds: 5);
  static const _nativeSilenceAfterSpeech = Duration(milliseconds: 500);
  static const _nativeSilenceThresholdDb = -40.0;

  // Grabaciones más cortas que esto no se envían a Whisper: son un intento
  // fallido (sin puntaje), igual que una transcripción vacía.
  static const _minRecording = Duration(seconds: 1);

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

  Future<bool> startListening({
    required void Function(String words) onResult,
    required void Function() onDone,
    void Function(double level)? onSoundLevel,
    String target = '',
  }) async {
    if (_listening) return false;

    if (kIsWeb) {
      _listening = true;
      const seconds = 5;

      var resultDelivered = false;

      startWebRecording(
        (String text) {
          if (resultDelivered) return;
          resultDelivered = true;
          _listenTimer?.cancel();
          _listening = false;
          onResult(text);
          // onDone will be fired immediately after by the JS side
        },
        () {
          // Always called by JS after onResult (or alone on mic-denied)
          if (!resultDelivered) {
            _listenTimer?.cancel();
            _listening = false;
          }
          onDone();
        },
        kWhisperApiKey,
      );

      _listenTimer = Timer(Duration(seconds: seconds), stopWebRecording);
      return true;
    }

    return _startNativeListening(
      onResult: onResult,
      onDone: onDone,
      onSoundLevel: onSoundLevel,
    );
  }

  // ── STT nativo (Android/iOS): graba con record y transcribe vía Whisper.
  // Sin speech_to_text: el fin del habla se detecta con un VAD propio sobre
  // el nivel de amplitud (dBFS) que reporta record.onAmplitudeChanged.
  Future<bool> _startNativeListening({
    required void Function(String words) onResult,
    required void Function() onDone,
    void Function(double level)? onSoundLevel,
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

    await _recorder.start(const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path);
    _nativeRecordStart = DateTime.now();

    _nativeAmpSub = _recorder
        .onAmplitudeChanged(const Duration(milliseconds: 100))
        .listen((amp) {
      onSoundLevel?.call(amp.current);
      if (amp.current > _nativeSilenceThresholdDb) {
        _nativeHasSpeech = true;
        _nativeSilenceStart = null;
      } else if (_nativeHasSpeech) {
        final silenceStart = _nativeSilenceStart ??= DateTime.now();
        if (DateTime.now().difference(silenceStart) >=
            _nativeSilenceAfterSpeech) {
          _finishNativeRecording(onResult, onDone);
        }
      }
    });

    _nativeMaxDurationTimer = Timer(_nativeListenMax, () {
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
      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);
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
    _listenTimer?.cancel();
    if (kIsWeb) {
      stopWebRecording();
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
    _listenTimer?.cancel();
    _nativeMaxDurationTimer?.cancel();
    _nativeAmpSub?.cancel();
    _player.dispose();
    _webCompleteController.close();
    if (!kIsWeb) _recorder.dispose();
  }
}
