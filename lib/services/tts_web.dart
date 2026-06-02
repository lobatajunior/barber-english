// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:async';

void setupWebTtsComplete(StreamController<void> controller) {
  html.window.on['rvSpeechEnd'].listen((_) {
    controller.add(null);
  });
}

void speakOnWeb(String text) {
  final escaped = text
      .replaceAll('\\', '\\\\')
      .replaceAll("'", "\\'")
      .replaceAll('\n', ' ');
  // Usa ResponsiveVoice si está cargado; si no, cae en Web Speech API nativa
  js.context.callMethod('eval', ["""
    (function() {
      var onEnd = function() {
        window.dispatchEvent(new CustomEvent('rvSpeechEnd'));
      };
      if (typeof responsiveVoice !== 'undefined') {
        responsiveVoice.speak('$escaped', 'US English Female', {
          pitch: 1,
          rate: 0.85,
          volume: 1,
          onend: onEnd
        });
      } else {
        speechSynthesis.cancel();
        var u = new SpeechSynthesisUtterance('$escaped');
        u.lang = 'en-US';
        u.rate = 0.85;
        u.pitch = 1.0;
        u.onend = onEnd;
        var voices = speechSynthesis.getVoices();
        var preferred = voices.find(function(v) {
          return v.lang === 'en-US' && (
            v.name.indexOf('Google') >= 0 ||
            v.name.indexOf('Samantha') >= 0 ||
            v.name.indexOf('Daniel') >= 0
          );
        });
        if (preferred) u.voice = preferred;
        speechSynthesis.speak(u);
      }
    })();
  """]);
}

void stopSpeakingOnWeb() {
  js.context.callMethod('eval', ["""
    if (typeof responsiveVoice !== 'undefined') {
      responsiveVoice.cancel();
    } else {
      speechSynthesis.cancel();
    }
  """]);
}
