import '../../../../models/lesson.dart';

// STREET ENGLISH · L09 — Pasado negativo: didn't
// Regla: para negar en pasado usas didn't + verbo base (sin -ed).
//        I didn't work. / She didn't go.
//
// Palabras de REPASO (L01-L08): work · go · see · get · come · say · here
//                               home · money · yes · her · last · week
//                               year · night · month
//
// Palabras NUEVAS L09: didn't
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson09PastNegative = Lesson(
  id: 9,
  title: 'Past Negative',
  description: 'Pasado negativo: didn\'t + verbo base',
  emoji: '🚫',
  level: Level.A1,
  descripcionEs:
      'Para negar en pasado usas didn\'t + verbo base, sin -ed y sin '
      'forma irregular: "I didn\'t work" (no "I didn\'t worked"), '
      '"She didn\'t go" (no "She didn\'t went").',
  motivacionEs:
      '¡Con didn\'t el verbo vuelve a su forma base! Más fácil imposible. 🚫',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I didn\'t work last week.',
      'respuesta_correcta': 'I didn\'t work last week.',
      'fonetica': '[ ai DI-dent work last UIIK ]',
      'traduccion_pregunta': 'Yo no trabajé la semana pasada.',
      'contexto_es': 'didn\'t + work (sin -ed)',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She didn\'t go home last night.',
      'respuesta_correcta': 'She didn\'t go home last night.',
      'fonetica': '[ shi DI-dent gou JOUM last NAIT ]',
      'traduccion_pregunta': 'Ella no fue a casa anoche.',
      'contexto_es': 'didn\'t + go (no "went")',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They didn\'t see her last year.',
      'respuesta_correcta': 'They didn\'t see her last year.',
      'fonetica': '[ dei DI-dent SII jer last IIR ]',
      'traduccion_pregunta': 'Ellos no la vieron el año pasado.',
      'contexto_es': 'didn\'t + see (no "saw")',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He didn\'t get money last week.',
      'respuesta_correcta': 'He didn\'t get money last week.',
      'fonetica': '[ ji DI-dent GUET MA-ni last UIIK ]',
      'traduccion_pregunta': 'Él no consiguió dinero la semana pasada.',
      'contexto_es': 'didn\'t + get (no "got")',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I didn\'t work last week.',
      'traduccion_pregunta': 'Yo no trabajé la semana pasada.',
      'palabras': ['work', 'I', 'didn\'t', 'last', 'week'],
      'respuesta_correcta': 'I didn\'t work last week',
      'contexto_es': 'I + didn\'t + verbo base',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She didn\'t go home last night.',
      'traduccion_pregunta': 'Ella no fue a casa anoche.',
      'palabras': ['go', 'She', 'didn\'t', 'home', 'last', 'night'],
      'respuesta_correcta': 'She didn\'t go home last night',
      'contexto_es': 'She + didn\'t + verbo base',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We didn\'t come here last year.',
      'respuesta_correcta': 'We didn\'t come here last year.',
      'fonetica': '[ ui DI-dent KAM jir last IIR ]',
      'traduccion_pregunta': 'Nosotros no vinimos aquí el año pasado.',
      'contexto_es': 'didn\'t + come (no "came")',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I didn\'t say yes last night.',
      'respuesta_correcta': 'I didn\'t say yes last night.',
      'fonetica': '[ ai DI-dent SEI ies last NAIT ]',
      'traduccion_pregunta': 'Yo no dije que sí anoche.',
      'contexto_es': 'didn\'t + say (no "said")',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They didn\'t work here last month.',
      'respuesta_correcta': 'They didn\'t work here last month.',
      'fonetica': '[ dei DI-dent work jir last MANZ ]',
      'traduccion_pregunta': 'Ellos no trabajaron aquí el mes pasado.',
      'contexto_es': 'Repaso: didn\'t + work',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He didn\'t come here last year.',
      'respuesta_correcta': 'He didn\'t come here last year.',
      'fonetica': '[ ji DI-dent KAM jir last IIR ]',
      'traduccion_pregunta': 'Él no vino aquí el año pasado.',
      'contexto_es': 'Repaso: con "he" también didn\'t + verbo base',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'We didn\'t come here last year.',
      'traduccion_pregunta': 'Nosotros no vinimos aquí el año pasado.',
      'palabras': ['here', 'We', 'didn\'t', 'come', 'last', 'year'],
      'respuesta_correcta': 'We didn\'t come here last year',
      'contexto_es': 'We + didn\'t + verbo base',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They didn\'t work here last month.',
      'traduccion_pregunta': 'Ellos no trabajaron aquí el mes pasado.',
      'palabras': ['here', 'They', 'didn\'t', 'work', 'last', 'month'],
      'respuesta_correcta': 'They didn\'t work here last month',
      'contexto_es': 'They + didn\'t + verbo base',
    },

  ],
);
