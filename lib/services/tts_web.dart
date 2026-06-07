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

bool isSafariBrowser() {
  final ua = html.window.navigator.userAgent.toLowerCase();
  final isIOS = ua.contains('iphone') || ua.contains('ipad') || ua.contains('ipod');
  final isSafari = ua.contains('safari') && !ua.contains('chrome') && !ua.contains('crios');
  return isIOS || isSafari;
}

void startWebRecording(
  void Function(String) onResult,
  void Function() onDone,
  String apiKey,
) {
  js.context['_whisperOnResult'] = js.allowInterop(onResult);
  js.context['_whisperOnDone'] = js.allowInterop(onDone);
  js.context['_whisperApiKey'] = apiKey;
  js.context.callMethod('eval', [r"""
    (function() {
      navigator.mediaDevices.getUserMedia({ audio: true, video: false })
        .then(function(stream) {
          var chunks = [];
          var mime = MediaRecorder.isTypeSupported('audio/webm;codecs=opus')
            ? 'audio/webm;codecs=opus'
            : MediaRecorder.isTypeSupported('audio/webm')
              ? 'audio/webm' : 'audio/ogg';
          var rec = new MediaRecorder(stream, { mimeType: mime });
          window._mediaRecorder = rec;

          // Silence detection via Web Audio API
          var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
          var src = audioCtx.createMediaStreamSource(stream);
          var analyser = audioCtx.createAnalyser();
          analyser.fftSize = 512;
          src.connect(analyser);
          var timeBuf = new Float32Array(analyser.fftSize);
          var hasSpeech = false;
          var silenceStart = null;
          var SPEECH_THRESH = 0.015;
          var SILENCE_THRESH = 0.012;
          var SILENCE_MS = 1000;

          var silenceInterval = setInterval(function() {
            if (rec.state === 'inactive') { clearInterval(silenceInterval); return; }
            analyser.getFloatTimeDomainData(timeBuf);
            var sum = 0;
            for (var i = 0; i < timeBuf.length; i++) sum += timeBuf[i] * timeBuf[i];
            var rms = Math.sqrt(sum / timeBuf.length);
            if (rms >= SPEECH_THRESH) {
              hasSpeech = true;
              silenceStart = null;
            } else if (hasSpeech) {
              if (!silenceStart) silenceStart = Date.now();
              else if (Date.now() - silenceStart >= SILENCE_MS) {
                clearInterval(silenceInterval);
                if (rec.state !== 'inactive') rec.stop();
              }
            }
          }, 100);

          rec.ondataavailable = function(e) {
            if (e.data && e.data.size > 0) chunks.push(e.data);
          };
          rec.onstop = function() {
            clearInterval(silenceInterval);
            try { audioCtx.close(); } catch(e) {}
            stream.getTracks().forEach(function(t) { t.stop(); });
            var blob = new Blob(chunks, { type: mime });
            var fd = new FormData();
            fd.append('file', blob, 'audio.webm');
            fd.append('model', 'whisper-1');
            fd.append('language', 'en');
            fetch('https://api.openai.com/v1/audio/transcriptions', {
              method: 'POST',
              headers: { 'Authorization': 'Bearer ' + window._whisperApiKey },
              body: fd
            })
            .then(function(r) { return r.json(); })
            .then(function(d) {
              var t = (d.text || '').trim();
              if (window._whisperOnResult) window._whisperOnResult(t);
              if (window._whisperOnDone) window._whisperOnDone();
            })
            .catch(function(err) {
              console.error('Whisper API error:', err);
              if (window._whisperOnResult) window._whisperOnResult('');
              if (window._whisperOnDone) window._whisperOnDone();
            });
          };
          rec.start();
        })
        .catch(function(err) {
          console.error('Mic access denied:', err);
          if (window._whisperOnDone) window._whisperOnDone();
        });
    })();
  """]);
}

void stopWebRecording() {
  js.context.callMethod('eval', [r"""
    (function() {
      if (window._mediaRecorder && window._mediaRecorder.state !== 'inactive') {
        window._mediaRecorder.stop();
      }
    })();
  """]);
}
