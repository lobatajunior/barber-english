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

  /// Returns accuracy 0–100, estricto palabra por palabra: solo cuenta una
  /// palabra si coincide EXACTA (sin tolerar terminaciones: want ≠ wanted,
  /// side ≠ sides), en el mismo orden que la frase objetivo. Ignora
  /// mayúsculas, puntuación y apóstrofes. 100 solo si coinciden todas; si
  /// falta alguna, máximo 89.
  double calculateScore(String spoken, String target) {
    final spokenWords =
        _normalize(spoken).split(' ').where((w) => w.isNotEmpty).toList();
    final targetWords =
        _normalize(target).split(' ').where((w) => w.isNotEmpty).toList();
    if (targetWords.isEmpty) return 0;
    final matches = _orderedExactMatches(spokenWords, targetWords).length;
    final score = matches / targetWords.length * 100;
    if (matches < targetWords.length) return score.clamp(0.0, 89.0);
    return 100;
  }

  /// Si lo dicho difiere de la frase objetivo en UNA sola palabra sustituida
  /// (p. ej. "want" en lugar de "wanted"), devuelve (dicha, esperada) para el
  /// mensaje "Casi". Con varias palabras distintas, una omitida o algo
  /// totalmente diferente devuelve null.
  (String said, String expected)? nearMiss(String spoken, String target) {
    final spokenWords =
        _normalize(spoken).split(' ').where((w) => w.isNotEmpty).toList();
    final targetWords =
        _normalize(target).split(' ').where((w) => w.isNotEmpty).toList();
    final pairs = _orderedExactMatches(spokenWords, targetWords);
    if (targetWords.length < 2 || pairs.length != targetWords.length - 1) {
      return null;
    }
    final matchedTarget = {for (final (t, _) in pairs) t};
    final missing =
        List.generate(targetWords.length, (i) => i).firstWhere(
            (i) => !matchedTarget.contains(i));
    // Hueco en lo dicho entre las palabras acertadas vecinas a la que falta.
    var lower = -1;
    var upper = spokenWords.length;
    for (final (t, s) in pairs) {
      if (t == missing - 1) lower = s;
      if (t == missing + 1) upper = s;
    }
    final gap = spokenWords.sublist(lower + 1, upper);
    if (gap.length != 1) return null;
    return (gap.single, targetWords[missing]);
  }

  /// Parejas (índice objetivo, índice dicho) de palabras que coinciden exactas
  /// y en orden (subsecuencia común más larga): una palabra dicha cuenta una
  /// sola vez, y palabras extra dichas por el alumno no restan.
  List<(int, int)> _orderedExactMatches(
      List<String> spoken, List<String> target) {
    final t = target.length;
    final s = spoken.length;
    final lcs = List.generate(t + 1, (_) => List.filled(s + 1, 0));
    for (int i = t - 1; i >= 0; i--) {
      for (int j = s - 1; j >= 0; j--) {
        lcs[i][j] = target[i] == spoken[j]
            ? lcs[i + 1][j + 1] + 1
            : (lcs[i + 1][j] > lcs[i][j + 1] ? lcs[i + 1][j] : lcs[i][j + 1]);
      }
    }
    final pairs = <(int, int)>[];
    var i = 0;
    var j = 0;
    while (i < t && j < s) {
      if (target[i] == spoken[j]) {
        pairs.add((i, j));
        i++;
        j++;
      } else if (lcs[i + 1][j] >= lcs[i][j + 1]) {
        i++;
      } else {
        j++;
      }
    }
    return pairs;
  }

  String _normalize(String text) => text
      .toLowerCase()
      .replaceAll(RegExp(r"[''`]"), "'")
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  void dispose() {
    _listenTimer?.cancel();
    _nativeMaxDurationTimer?.cancel();
    _nativeAmpSub?.cancel();
    _player.dispose();
    _webCompleteController.close();
    if (!kIsWeb) _recorder.dispose();
  }
}
