import '../../../../models/lesson.dart';

// STREET ENGLISH · L07 — Pasado simple: verbos regulares
// Regla: los verbos regulares en pasado añaden -ed
//        (work → worked, live → lived, like → liked).
//
// Palabras de REPASO (L01-L06): here · food · money · water · last
//                               week · year · night · month
//
// Palabras NUEVAS L07: worked · lived · liked · wanted · needed
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson07PastRegularVerbs = Lesson(
  id: 7,
  title: 'Past: Regular Verbs',
  description: 'Pasado simple: verbos regulares (-ed)',
  emoji: '🕰️',
  level: Level.A1,
  descripcionEs:
      'Los verbos regulares en pasado añaden -ed: work → worked, '
      'live → lived, like → liked. Es igual para todas las personas '
      '("I worked here", "She lived here").',
  motivacionEs:
      '¡Solo añade -ed y ya hablas en pasado! Igual para todos. 🕰️',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I worked here last week.',
      'respuesta_correcta': 'I worked here last week.',
      'fonetica': '[ ai UORKT jir last UIIK ]',
      'traduccion_pregunta': 'Yo trabajé aquí la semana pasada.',
      'contexto_es': 'work + ed → worked',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She lived here last year.',
      'respuesta_correcta': 'She lived here last year.',
      'fonetica': '[ shi LIVD jir last IIR ]',
      'traduccion_pregunta': 'Ella vivió aquí el año pasado.',
      'contexto_es': 'live + d → lived',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They liked food last night.',
      'respuesta_correcta': 'They liked food last night.',
      'fonetica': '[ dei LAIKT fuud last NAIT ]',
      'traduccion_pregunta': 'A ellos les gustó la comida anoche.',
      'contexto_es': 'like + d → liked',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He worked here last year.',
      'respuesta_correcta': 'He worked here last year.',
      'fonetica': '[ ji UORKT jir last IIR ]',
      'traduccion_pregunta': 'Él trabajó aquí el año pasado.',
      'contexto_es': 'En pasado, con "he" el verbo no lleva s: worked',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I worked here last week.',
      'traduccion_pregunta': 'Yo trabajé aquí la semana pasada.',
      'palabras': ['here', 'I', 'worked', 'last', 'week'],
      'respuesta_correcta': 'I worked here last week',
      'contexto_es': 'I + worked',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She lived here last year.',
      'traduccion_pregunta': 'Ella vivió aquí el año pasado.',
      'palabras': ['lived', 'She', 'here', 'last', 'year'],
      'respuesta_correcta': 'She lived here last year',
      'contexto_es': 'She + lived',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We needed money last week.',
      'respuesta_correcta': 'We needed money last week.',
      'fonetica': '[ ui NII-ded MA-ni last UIIK ]',
      'traduccion_pregunta': 'Nosotros necesitamos dinero la semana pasada.',
      'contexto_es': 'need + ed → needed',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She wanted water last night.',
      'respuesta_correcta': 'She wanted water last night.',
      'fonetica': '[ shi UON-ted UO-ter last NAIT ]',
      'traduccion_pregunta': 'Ella quería agua anoche.',
      'contexto_es': 'want + ed → wanted',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I liked food here last year.',
      'respuesta_correcta': 'I liked food here last year.',
      'fonetica': '[ ai LAIKT fuud jir last IIR ]',
      'traduccion_pregunta': 'Me gustó la comida aquí el año pasado.',
      'contexto_es': 'Repaso: like → liked',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They worked here last month.',
      'respuesta_correcta': 'They worked here last month.',
      'fonetica': '[ dei UORKT jir last MANZ ]',
      'traduccion_pregunta': 'Ellos trabajaron aquí el mes pasado.',
      'contexto_es': 'Repaso: work → worked',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They liked food last night.',
      'traduccion_pregunta': 'A ellos les gustó la comida anoche.',
      'palabras': ['food', 'They', 'liked', 'last', 'night'],
      'respuesta_correcta': 'They liked food last night',
      'contexto_es': 'They + liked',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'We needed money last week.',
      'traduccion_pregunta': 'Nosotros necesitamos dinero la semana pasada.',
      'palabras': ['money', 'We', 'needed', 'last', 'week'],
      'respuesta_correcta': 'We needed money last week',
      'contexto_es': 'We + needed',
    },

  ],
);
