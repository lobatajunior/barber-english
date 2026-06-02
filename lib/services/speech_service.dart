import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:speech_to_text/speech_to_text.dart';
import 'tts_web.dart' if (dart.library.io) 'tts_stub.dart';

class SpeechService {
  final AudioPlayer _player = AudioPlayer();
  final SpeechToText _stt = SpeechToText();
  bool _sttAvailable = false;
  bool _sttInitialized = false;

  final StreamController<void> _webCompleteController =
      StreamController<void>.broadcast();

  SpeechService() {
    if (kIsWeb) {
      setupWebTtsComplete(_webCompleteController);
    }
  }

  /// Fires once when audio finishes naturally (not on stop/skip).
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

  bool get isListening => _stt.isListening;

  Future<bool> _ensureSttReady() async {
    if (_sttInitialized) return _sttAvailable;
    _sttAvailable = await _stt.initialize(
      onError: (_) {},
      onStatus: (_) {},
    );
    _sttInitialized = true;
    return _sttAvailable;
  }

  Future<bool> startListening({
    required void Function(String words) onResult,
    required void Function() onDone,
  }) async {
    final ready = await _ensureSttReady();
    if (!ready) return false;

    await _stt.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
          onDone();
        }
      },
      localeId: 'en-US',
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 3),
      listenOptions: SpeechListenOptions(partialResults: false),
    );
    return true;
  }

  Future<void> stopListening() async => _stt.stop();

  /// Returns accuracy 0–100.
  double calculateScore(String spoken, String target) {
    final spokenWords =
        _normalize(spoken).split(' ').where((w) => w.isNotEmpty).toList();
    final targetWords =
        _normalize(target).split(' ').where((w) => w.isNotEmpty).toList();
    if (targetWords.isEmpty) return 0;
    int matches = 0;
    for (final tw in targetWords) {
      if (spokenWords
          .any((sw) => sw == tw || sw.contains(tw) || tw.contains(sw))) {
        matches++;
      }
    }
    return (matches / targetWords.length * 100).clamp(0.0, 100.0);
  }

  String _normalize(String text) => text
      .toLowerCase()
      .replaceAll(RegExp(r"[''`]"), "'")
      .replaceAll(RegExp(r'[^\w\s]'), '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  void dispose() {
    _player.dispose();
    _stt.stop();
    _webCompleteController.close();
  }
}
