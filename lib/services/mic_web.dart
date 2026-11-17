import 'dart:js_interop';

// Grabación web para Whisper (MediaRecorder + Web Audio), con:
// - calibración del ruido de fondo y umbrales de voz/silencio calculados,
// - parada por silencio, por tope, por toque o por falta de voz,
// - aviso al parar (para mostrar "Procesando…" mientras responde Whisper),
// - un solo permiso/stream por ejercicio (dueño = el widget del ejercicio),
// - formato según MediaRecorder.isTypeSupported (webm, mp4, ogg).
// Los valores llegan desde mic_config.dart.

@JS('eval')
external JSAny? _jsEval(JSString code);

@JS('__beMic.start')
external void _start(
  JSAny cfg,
  JSFunction onStopped,
  JSFunction onResult,
  JSFunction onNoVoice,
  JSFunction onCancelled,
  JSFunction onUnsupported,
  JSFunction onDone,
);

@JS('__beMic.finish')
external void _finish();

@JS('__beMic.cancel')
external void _cancel();

@JS('__beMic.release')
external void _release(JSString owner);

bool _instalado = false;

void _instalar() {
  if (_instalado) return;
  _jsEval(kMicJs.toJS);
  _instalado = true;
}

/// Empieza a grabar. [cfg] lleva la configuración de mic_config.dart, la
/// clave de Whisper y el dueño del stream.
void micStart({
  required Map<String, Object> cfg,
  required void Function() onStopped,
  required void Function(String text) onResult,
  required void Function() onNoVoice,
  required void Function() onCancelled,
  required void Function() onUnsupported,
  required void Function() onDone,
}) {
  _instalar();
  _start(
    cfg.jsify()!,
    onStopped.toJS,
    ((JSString t) => onResult(t.toDart)).toJS,
    onNoVoice.toJS,
    onCancelled.toJS,
    onUnsupported.toJS,
    onDone.toJS,
  );
}

/// Toque en el micrófono: envía si ya hubo voz; si no, cancela.
void micFinish() {
  if (_instalado) _finish();
}

/// Para sin enviar nada a Whisper.
void micCancel() {
  if (_instalado) _cancel();
}

/// Cierra el stream del micrófono si es de [owner].
void micRelease(String owner) {
  if (_instalado) _release(owner.toJS);
}

// MIC-JS-BEGIN
const kMicJs = r'''
(function () {
  if (window.__beMic) return;
  var M = { stream: null, owner: null, cur: null };

  function now() { return performance.now(); }
  function log(cfg, t0, msg) {
    if (cfg.debug) console.log('[mic] +' + Math.round(now() - t0) + ' ms · ' + msg);
  }
  function pickMime(formatos) {
    if (typeof MediaRecorder === 'undefined' || !MediaRecorder.isTypeSupported) return null;
    for (var i = 0; i < formatos.length; i++) {
      if (MediaRecorder.isTypeSupported(formatos[i])) return formatos[i];
    }
    return null;
  }
  function ext(mime) {
    if (mime.indexOf('mp4') >= 0) return 'mp4';
    if (mime.indexOf('ogg') >= 0) return 'ogg';
    return 'webm';
  }
  function live(s) {
    return !!s && s.getAudioTracks().some(function (t) { return t.readyState === 'live'; });
  }
  function stopTracks(s) {
    if (s) s.getTracks().forEach(function (t) { t.stop(); });
  }
  function release(owner) {
    if (owner !== undefined && owner !== null && owner !== M.owner) return;
    if (M.cur) M.cur.cancel();
    stopTracks(M.stream);
    M.stream = null;
    M.owner = null;
  }
  function getStream(cfg) {
    if (cfg.reuse && live(M.stream) && M.owner === cfg.owner) {
      return Promise.resolve({ stream: M.stream, nuevo: false });
    }
    release();
    return navigator.mediaDevices.getUserMedia({ audio: true, video: false })
      .then(function (s) {
        M.stream = s;
        M.owner = cfg.owner;
        return { stream: s, nuevo: true };
      });
  }

  M.start = function (cfg, onStopped, onResult, onNoVoice, onCancelled, onUnsupported, onDone) {
    var t0 = now();
    var mime = pickMime(cfg.formatos);
    if (!mime) {
      log(cfg, t0, 'ningún formato de grabación soportado');
      onUnsupported();
      onDone();
      return;
    }
    getStream(cfg).then(function (g) {
      var stream = g.stream;
      log(cfg, t0, (g.nuevo ? 'micrófono abierto' : 'micrófono reutilizado') + ' · ' + mime);
      var Ctx = window.AudioContext || window.webkitAudioContext;
      var ctx = new Ctx();
      // Puede nacer suspendido (sobre todo en Safari): sin esto el analizador
      // solo ve ceros y nunca detecta voz ni silencio.
      if (ctx.state === 'suspended' && ctx.resume) ctx.resume();
      var src = ctx.createMediaStreamSource(stream);
      var an = ctx.createAnalyser();
      an.fftSize = 1024;
      src.connect(an);
      var buf = new Float32Array(an.fftSize);
      var chunks = [];
      var rec = new MediaRecorder(stream, { mimeType: mime });
      var S = {
        hasSpeech: false, silenceStart: null, calib: [], calibrated: false,
        calibStart: null, maxRms: 0,
        speechTh: cfg.speechMin, silenceTh: cfg.silenceMin,
        stopped: false, mode: null, start: 0, iv: null
      };

      function rms() {
        an.getFloatTimeDomainData(buf);
        var s = 0;
        for (var i = 0; i < buf.length; i++) s += buf[i] * buf[i];
        return Math.sqrt(s / buf.length);
      }
      function calibrate() {
        var c = S.calib.slice().sort(function (a, b) { return a - b; });
        // Percentil 25: si la persona empieza a hablar muy pronto, no infla
        // el ruido de fondo.
        var noise = c.length ? c[Math.floor((c.length - 1) * 0.25)] : 0;
        S.speechTh = Math.max(cfg.speechMin, noise * cfg.speechFactor);
        S.silenceTh = Math.min(
          Math.max(cfg.silenceMin, noise * cfg.silenceFactor),
          S.speechTh * cfg.silenceMaxRatio);
        S.calibrated = true;
        log(cfg, t0, 'calibrado (' + S.calib.length + ' muestras, audio ' + ctx.state + '): ruido=' + noise.toFixed(4) +
          ' voz≥' + S.speechTh.toFixed(4) + ' silencio<' + S.silenceTh.toFixed(4));
      }
      function stop(mode, reason) {
        if (S.stopped) return;
        S.stopped = true;
        S.mode = mode;
        clearInterval(S.iv);
        M.cur = null;
        log(cfg, t0, 'parada (' + reason + ') tras ' + Math.round(now() - S.start) + ' ms grabados');
        if (mode === 'send') onStopped();
        if (rec.state !== 'inactive') rec.stop(); else finalize();
      }
      function finalize() {
        try { ctx.close(); } catch (e) {}
        if (!cfg.reuse) release(cfg.owner);
        if (S.mode === 'novoice') { onNoVoice(); onDone(); return; }
        if (S.mode === 'cancel') { onCancelled(); onDone(); return; }
        // Menos del mínimo grabado: intento fallido, no se envía a Whisper.
        if (now() - S.start < cfg.minRecordingMs) { onResult(''); onDone(); return; }
        var type = mime.split(';')[0];
        var blob = new Blob(chunks, { type: type });
        var fd = new FormData();
        fd.append('file', blob, 'audio.' + ext(mime));
        fd.append('model', 'whisper-1');
        fd.append('language', 'en');
        // Temperatura 0: Whisper no inventa palabras.
        fd.append('temperature', '0');
        var tSend = now();
        log(cfg, t0, 'envío a Whisper: ' + blob.size + ' bytes (' + type + ')');
        fetch(cfg.endpoint, {
          method: 'POST',
          headers: { 'Authorization': 'Bearer ' + cfg.apiKey },
          body: fd
        })
          .then(function (r) { return r.json(); })
          .then(function (d) {
            log(cfg, t0, 'respuesta de Whisper en ' + Math.round(now() - tSend) + ' ms');
            onResult(((d && d.text) || '').trim());
            onDone();
          })
          .catch(function (err) {
            console.error('Whisper API error:', err);
            onResult('');
            onDone();
          });
      }

      rec.ondataavailable = function (e) { if (e.data && e.data.size > 0) chunks.push(e.data); };
      rec.onstop = finalize;
      rec.start();
      S.start = now();
      log(cfg, t0, 'inicio de grabación');
      M.cur = {
        finish: function () {
          // Cuenta como voz aunque la calibración no haya terminado: quien
          // habla rápido y toca enseguida no pierde el intento.
          if (S.hasSpeech || S.maxRms >= cfg.speechMin) stop('send', 'toque');
          else stop('cancel', 'toque sin voz');
        },
        cancel: function () { stop('cancel', 'cancelada'); }
      };

      S.iv = setInterval(function () {
        if (S.stopped) return;
        var t = now();
        var el = t - S.start;
        var r = rms();
        if (r > S.maxRms) S.maxRms = r;
        if (!S.calibrated) {
          // La ventana de calibración empieza con la primera señal real: al
          // abrir el micrófono llegan unos cientos de ms de ceros.
          if (S.calibStart === null) {
            if (r > cfg.signalMin) S.calibStart = t;
            else if (el >= cfg.signalWaitMs) calibrate(); // silencio total
          }
          if (S.calibStart !== null) {
            if (t - S.calibStart < cfg.calibrationMs) {
              S.calib.push(r);
              if (!S.hasSpeech && el >= cfg.noVoiceMs) { stop('novoice', 'sin voz'); }
              return;
            }
            calibrate();
          }
        }
        if (r >= S.speechTh) {
          if (!S.hasSpeech) log(cfg, t0, 'voz detectada (rms=' + r.toFixed(4) + ')');
          S.hasSpeech = true;
          S.silenceStart = null;
        } else if (S.hasSpeech && r < S.silenceTh) {
          if (S.silenceStart === null) {
            S.silenceStart = t;
            log(cfg, t0, 'silencio detectado');
          } else if (t - S.silenceStart >= cfg.silenceMs && el >= cfg.minBeforeStopMs) {
            stop('send', 'silencio');
            return;
          }
        }
        if (!S.hasSpeech && el >= cfg.noVoiceMs) { stop('novoice', 'sin voz'); return; }
        if (el >= cfg.maxMs) stop(S.hasSpeech ? 'send' : 'novoice', 'tope');
      }, cfg.intervalMs);
    }).catch(function (err) {
      console.error('Mic access denied:', err);
      onDone();
    });
  };

  M.finish = function () { if (M.cur) M.cur.finish(); };
  M.cancel = function () { if (M.cur) M.cur.cancel(); };
  M.release = function (owner) { release(owner); };
  window.__beMic = M;
})();
''';
// MIC-JS-END
