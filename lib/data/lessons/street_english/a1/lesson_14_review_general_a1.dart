import '../../../../models/lesson.dart';

// STREET ENGLISH · L14 — Repaso general A1
// Regla: repaso completo de presente, pasado y preguntas WH mezcladas.
//
// Palabras de REPASO (L01-L13): where · what · who · do · don't · did · didn't
//                               work · worked · lived · need · come · here
//                               now · but · last · year · night · month
//
// Palabras NUEVAS L14: ninguna (solo repaso)
//                      (nota: "there" aparece por primera vez en EJ 03)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson14ReviewGeneralA1 = Lesson(
  id: 14,
  title: 'General Review A1',
  description: 'Repaso general: presente, pasado y preguntas WH',
  emoji: '🏁',
  level: Level.A1,
  descripcionEs:
      'Repaso de todo el nivel A1. Presente ("I work here now", '
      '"They don\'t work here now"), pasado ("I lived there last year", '
      '"They didn\'t work here last year") y preguntas con do / did '
      '("Where do you work now?", "Where did you work last year?").',
  motivacionEs:
      '¡Último repaso del A1! Presente, pasado y preguntas: ya lo tienes todo. 🏁',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Where do you work now?',
      'respuesta_correcta': 'Where do you work now?',
      'fonetica': '[ UER du iu work NAU ]',
      'traduccion_pregunta': '¿Dónde trabajas ahora?',
      'contexto_es': 'Presente: Where + do + you + verbo',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Where did you work last year?',
      'respuesta_correcta': 'Where did you work last year?',
      'fonetica': '[ UER did iu work last IIR ]',
      'traduccion_pregunta': '¿Dónde trabajaste el año pasado?',
      'contexto_es': 'Pasado: Where + did + you + verbo base',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I work here now but I lived there last year.',
      'respuesta_correcta': 'I work here now but I lived there last year.',
      'fonetica': '[ ai work JIR nau bat ai LIVD DER last IIR ]',
      'traduccion_pregunta': 'Trabajo aquí ahora pero viví allá el año pasado.',
      'contexto_es': 'Presente (work) + but + pasado (lived). There = allá',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did she come here last night?',
      'respuesta_correcta': 'Did she come here last night?',
      'fonetica': '[ DID shi KAM jir last NAIT ]',
      'traduccion_pregunta': '¿Ella vino aquí anoche?',
      'contexto_es': 'Pasado: Did + she + come (no "came")',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Where do you work now?',
      'traduccion_pregunta': '¿Dónde trabajas ahora?',
      'palabras': ['you', 'Where', 'work', 'do', 'now'],
      'respuesta_correcta': 'Where do you work now',
      'contexto_es': 'Where + do + sujeto + verbo',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Where did you work last year?',
      'traduccion_pregunta': '¿Dónde trabajaste el año pasado?',
      'palabras': ['you', 'Where', 'work', 'did', 'last', 'year'],
      'respuesta_correcta': 'Where did you work last year',
      'contexto_es': 'Where + did + sujeto + verbo base',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Who worked here last month?',
      'respuesta_correcta': 'Who worked here last month?',
      'fonetica': '[ JUU UORKT jir last MANZ ]',
      'traduccion_pregunta': '¿Quién trabajó aquí el mes pasado?',
      'contexto_es': 'Who como sujeto: sin did, verbo en pasado (worked)',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They don\'t work here now.',
      'respuesta_correcta': 'They don\'t work here now.',
      'fonetica': '[ dei DOUNT work jir NAU ]',
      'traduccion_pregunta': 'Ellos no trabajan aquí ahora.',
      'contexto_es': 'Negativo presente: don\'t + verbo',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They didn\'t work here last year.',
      'respuesta_correcta': 'They didn\'t work here last year.',
      'fonetica': '[ dei DI-dent work jir last IIR ]',
      'traduccion_pregunta': 'Ellos no trabajaron aquí el año pasado.',
      'contexto_es': 'Negativo pasado: didn\'t + verbo base',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'What do you need now?',
      'respuesta_correcta': 'What do you need now?',
      'fonetica': '[ UAT du iu niid NAU ]',
      'traduccion_pregunta': '¿Qué necesitas ahora?',
      'contexto_es': 'Presente: What + do + you + verbo',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They don\'t work here now.',
      'traduccion_pregunta': 'Ellos no trabajan aquí ahora.',
      'palabras': ['here', 'They', 'work', 'don\'t', 'now'],
      'respuesta_correcta': 'They don\'t work here now',
      'contexto_es': 'They + don\'t + verbo',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They didn\'t work here last year.',
      'traduccion_pregunta': 'Ellos no trabajaron aquí el año pasado.',
      'palabras': ['here', 'They', 'work', 'didn\'t', 'last', 'year'],
      'respuesta_correcta': 'They didn\'t work here last year',
      'contexto_es': 'They + didn\'t + verbo base',
    },

  ],
);
