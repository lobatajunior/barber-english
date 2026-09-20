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

  static const _nativeListenMax = Duration(seconds: 5);
  static const _nativeSilenceAfterSpeech = Duration(milliseconds: 500);
  static const _nativeSilenceThresholdDb = -40.0;

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

    try {
      final uri = Uri.parse('https://api.openai.com/v1/audio/transcriptions');
      final request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $kWhisperApiKey'
        ..fields['model'] = 'whisper-1'
        ..fields['language'] = 'en'
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

  /// Returns accuracy 0–100.
  double calculateScore(String spoken, String target) {
    final spokenWords =
        _normalize(spoken).split(' ').where((w) => w.isNotEmpty).toList();
    final targetWords =
        _normalize(target).split(' ').where((w) => w.isNotEmpty).toList();
    if (targetWords.isEmpty) return 0;
    int matches = 0;
    for (final tw in targetWords) {
      if (spokenWords.any((sw) =>
          sw == tw ||
          sw.contains(tw) ||
          tw.contains(sw) ||
          _levenshtein(sw, tw) <= 2)) {
        matches++;
      }
    }
    return (matches / targetWords.length * 100).clamp(0.0, 100.0);
  }

  int _levenshtein(String a, String b) {
    if (a == b) return 0;
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;
    final matrix =
        List.generate(a.length + 1, (i) => List.filled(b.length + 1, 0));
    for (int i = 0; i <= a.length; i++) matrix[i][0] = i;
    for (int j = 0; j <= b.length; j++) matrix[0][j] = j;
    for (int i = 1; i <= a.length; i++) {
      for (int j = 1; j <= b.length; j++) {
        final cost = a[i - 1] == b[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost
        ].reduce((a, b) => a < b ? a : b);
      }
    }
    return matrix[a.length][b.length];
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
