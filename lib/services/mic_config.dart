// Configuración del micrófono de los ejercicios de pronunciación.
// Todos los valores de grabación viven aquí (web y Android/iOS).

/// Registros de tiempo de la grabación: console.log en web ("[mic] …") y
/// debugPrint en Android/iOS ("[mic] …"). Dejar en false al publicar.
const bool kMicDebug = false;

// ── Web (MediaRecorder + Web Audio) ─────────────────────────────────────────

/// Al empezar a grabar se mide el ruido de fondo durante este tiempo y los
/// umbrales de voz y silencio se calculan a partir de él.
const int kMicCalibracionMs = 300;

/// La calibración empieza con la primera señal real (RMS por encima de esto):
/// al abrir el micrófono el navegador entrega unos cientos de ms de ceros.
const double kMicSenalMinRms = 0.0005;

/// Si en este tiempo no llega ninguna señal (sala en silencio y supresión de
/// ruido del navegador), se usan los umbrales mínimos.
const int kMicEsperaSenalMs = 1000;

/// Cada cuánto se mide el volumen (RMS).
const int kMicIntervaloMs = 50;

/// Umbral de voz = ruido de fondo × este factor (nunca menos que el mínimo).
const double kMicFactorVoz = 3.0;
const double kMicUmbralVozMin = 0.015;

/// Umbral de silencio = ruido de fondo × este factor (nunca menos que el
/// mínimo, y siempre por debajo del 80 % del umbral de voz).
const double kMicFactorSilencio = 1.8;
const double kMicUmbralSilencioMin = 0.010;
const double kMicSilencioMaxRespectoVoz = 0.8;

/// Silencio seguido que da la frase por terminada.
const int kMicSilencioFraseMs = 650;

/// Silencio para listas de palabras sueltas ("Yes, No, Hair wash"): entre
/// palabra y palabra hay pausas más largas.
const int kMicSilencioListaMs = 1000;

/// Tope de grabación: base + por palabra de la frase objetivo, con máximo.
/// Cuenta desde que la grabación empieza de verdad.
const int kMicTopeBaseMs = 5000;
const int kMicTopePorPalabraMs = 600;
const int kMicTopeMaxMs = 12000;

/// No se para por silencio antes de este tiempo de grabación.
const int kMicMinAntesDePararMs = 500;

/// Sin voz detectada en este tiempo: se para, no se envía nada a Whisper y se
/// muestra "No te escuché, inténtalo de nuevo" (no cuenta como intento).
const int kMicSinVozMs = 4000;

/// Grabaciones más cortas que esto no se envían a Whisper: intento fallido
/// sin puntaje (igual que una transcripción vacía). Web y Android/iOS.
const int kMicGrabacionMinMs = 1000;

/// Reutilizar el permiso/stream del micrófono en los reintentos del mismo
/// ejercicio (se cierra al salir del ejercicio o de la pantalla).
const bool kMicReusarStream = true;

/// Formatos de grabación, en orden de preferencia (Safari/iOS usa mp4).
const List<String> kMicFormatos = [
  'audio/webm;codecs=opus',
  'audio/mp4',
  'audio/ogg;codecs=opus',
];

// ── Android/iOS (paquete record) ────────────────────────────────────────────

const int kMicNativoTopeMs = 5000;
const int kMicNativoSilencioMs = 500;
const double kMicNativoUmbralDb = -40.0;

// ── Cálculos ─────────────────────────────────────────────────────────────────

/// Número de palabras de la frase objetivo.
int micPalabras(String objetivo) => objetivo
    .split(RegExp(r'[\s,·]+'))
    .where((w) => w.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').isNotEmpty)
    .length;

/// Tope de grabación en ms para [objetivo]: 5 s + 0,6 s por palabra, máx. 12 s.
int micTopeMs(String objetivo) {
  final ms = kMicTopeBaseMs + kMicTopePorPalabraMs * micPalabras(objetivo);
  return ms > kMicTopeMaxMs ? kMicTopeMaxMs : ms;
}

/// Silencio que termina la grabación: más largo en listas de palabras.
int micSilencioMs({required bool listaDePalabras}) =>
    listaDePalabras ? kMicSilencioListaMs : kMicSilencioFraseMs;
