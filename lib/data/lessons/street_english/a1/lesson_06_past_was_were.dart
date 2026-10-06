import '../../../../models/lesson.dart';

// STREET ENGLISH · L06 — Pasado simple: was / were
// Regla: was con I / he / she. Were con you / we / they.
//
// Palabras de REPASO (L01-L05): work · every · day · here
//
// Palabras NUEVAS L06: was · were · tired · happy · good · bad · yesterday
//                      (+ "at" como palabra gramatical)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson06PastWasWere = Lesson(
  id: 6,
  title: 'Past: Was / Were',
  description: 'Pasado simple: was / were',
  emoji: '⏪',
  level: Level.A1,
  descripcionEs:
      'El pasado del verbo "to be". Usa "was" con I, he y she '
      '("I was tired yesterday"). Usa "were" con you, we y they '
      '("They were tired every day").',
  motivacionEs:
      '¡Ya puedes hablar del pasado! Was para I/he/she, were para you/we/they. ⏪',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I was tired yesterday.',
      'respuesta_correcta': 'I was tired yesterday.',
      'fonetica': '[ ai uos TAI-erd IES-ter-dei ]',
      'traduccion_pregunta': 'Yo estaba cansado ayer.',
      'contexto_es': 'Con "I" se usa was',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She was happy at work.',
      'respuesta_correcta': 'She was happy at work.',
      'fonetica': '[ shi uos JA-pi at WORK ]',
      'traduccion_pregunta': 'Ella estaba feliz en el trabajo.',
      'contexto_es': 'Con "she" se usa was',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'You were good here yesterday.',
      'respuesta_correcta': 'You were good here yesterday.',
      'fonetica': '[ iu uer GUD jir IES-ter-dei ]',
      'traduccion_pregunta': 'Estuviste bien aquí ayer.',
      'contexto_es': 'Con "you" se usa were',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They were tired every day.',
      'respuesta_correcta': 'They were tired every day.',
      'fonetica': '[ dei uer TAI-erd E-vri DEI ]',
      'traduccion_pregunta': 'Ellos estaban cansados todos los días.',
      'contexto_es': 'Con "they" se usa were',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I was tired yesterday.',
      'traduccion_pregunta': 'Yo estaba cansado ayer.',
      'palabras': ['tired', 'I', 'was', 'yesterday'],
      'respuesta_correcta': 'I was tired yesterday',
      'contexto_es': 'I + was',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She was happy at work.',
      'traduccion_pregunta': 'Ella estaba feliz en el trabajo.',
      'palabras': ['happy', 'She', 'was', 'at', 'work'],
      'respuesta_correcta': 'She was happy at work',
      'contexto_es': 'She + was',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He was bad at work.',
      'respuesta_correcta': 'He was bad at work.',
      'fonetica': '[ ji uos BAD at WORK ]',
      'traduccion_pregunta': 'Él estaba mal en el trabajo.',
      'contexto_es': 'Con "he" se usa was',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We were happy here.',
      'respuesta_correcta': 'We were happy here.',
      'fonetica': '[ ui uer JA-pi JIR ]',
      'traduccion_pregunta': 'Nosotros éramos felices aquí.',
      'contexto_es': 'Con "we" se usa were',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I was tired yesterday.',
      'respuesta_correcta': 'I was tired yesterday.',
      'fonetica': '[ ai uos TAI-erd IES-ter-dei ]',
      'traduccion_pregunta': 'Yo estaba cansado ayer.',
      'contexto_es': 'Repaso: I + was',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She was happy every day.',
      'respuesta_correcta': 'She was happy every day.',
      'fonetica': '[ shi uos JA-pi E-vri DEI ]',
      'traduccion_pregunta': 'Ella estaba feliz todos los días.',
      'contexto_es': 'Repaso: she + was',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They were tired every day.',
      'traduccion_pregunta': 'Ellos estaban cansados todos los días.',
      'palabras': ['were', 'They', 'tired', 'every', 'day'],
      'respuesta_correcta': 'They were tired every day',
      'contexto_es': 'They + were',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'We were good here yesterday.',
      'traduccion_pregunta': 'Estuvimos bien aquí ayer.',
      'palabras': ['good', 'We', 'were', 'here', 'yesterday'],
      'respuesta_correcta': 'We were good here yesterday',
      'contexto_es': 'We + were',
    },

  ],
);
