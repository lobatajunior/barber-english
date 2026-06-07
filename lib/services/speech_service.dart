import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'tts_web.dart' if (dart.library.io) 'tts_stub.dart';

const _kWhisperApiKey = '';

class SpeechService {
  final AudioPlayer _player = AudioPlayer();
  bool _listening = false;
  Timer? _listenTimer;

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
    if (!kIsWeb) return false;

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
      _kWhisperApiKey,
    );

    _listenTimer = Timer(Duration(seconds: seconds), stopWebRecording);
    return true;
  }

  Future<void> stopListening() async {
    _listenTimer?.cancel();
    if (kIsWeb) stopWebRecording();
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
    _player.dispose();
    _webCompleteController.close();
  }
}
