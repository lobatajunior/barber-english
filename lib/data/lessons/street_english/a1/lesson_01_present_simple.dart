import '../../../../models/lesson.dart';

// STREET ENGLISH · L01 — Presente simple afirmativo
// Regla: con I/you/we/they el verbo no cambia. Con he/she el verbo lleva s.
//
// Palabras NUEVAS L01 (de street_english_vocab.dart):
//   work · live · like · want · every · day · here · food
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson01PresentSimple = Lesson(
  id: 1,
  title: 'Present Simple',
  description: 'Presente simple afirmativo',
  emoji: '🗣️',
  level: Level.A1,
  descripcionEs:
      'Con I, you, we y they el verbo no cambia: "I work", "they live". '
      'Con he y she el verbo lleva s: "he works", "she lives".',
  motivacionEs:
      '¡Con esta regla ya puedes hablar de tu vida diaria en inglés! 🗣️',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I work here.',
      'respuesta_correcta': 'I work here.',
      'fonetica': '[ ai WORK JIR ]',
      'traduccion_pregunta': 'Yo trabajo aquí.',
      'contexto_es': 'Con "I" el verbo no cambia: work',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'You live here.',
      'respuesta_correcta': 'You live here.',
      'fonetica': '[ iu LIV JIR ]',
      'traduccion_pregunta': 'Tú vives aquí.',
      'contexto_es': 'Con "you" el verbo no cambia: live',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He likes food.',
      'respuesta_correcta': 'He likes food.',
      'fonetica': '[ ji LAIKS FUUD ]',
      'traduccion_pregunta': 'A él le gusta la comida.',
      'contexto_es': 'Con "he" el verbo lleva s: like → likes',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She works every day.',
      'respuesta_correcta': 'She works every day.',
      'fonetica': '[ shi WORKS E-vri DEI ]',
      'traduccion_pregunta': 'Ella trabaja todos los días.',
      'contexto_es': 'Con "she" el verbo lleva s: work → works',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'He likes food.',
      'traduccion_pregunta': 'A él le gusta la comida.',
      'palabras': ['likes', 'He', 'food'],
      'respuesta_correcta': 'He likes food',
      'contexto_es': 'He → verbo con s',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They live here.',
      'traduccion_pregunta': 'Ellos viven aquí.',
      'palabras': ['live', 'They', 'here'],
      'respuesta_correcta': 'They live here',
      'contexto_es': 'They → el verbo no cambia',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We want food.',
      'respuesta_correcta': 'We want food.',
      'fonetica': '[ wi WONT FUUD ]',
      'traduccion_pregunta': 'Nosotros queremos comida.',
      'contexto_es': 'Con "we" el verbo no cambia: want',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They live here.',
      'respuesta_correcta': 'They live here.',
      'fonetica': '[ dei LIV JIR ]',
      'traduccion_pregunta': 'Ellos viven aquí.',
      'contexto_es': 'Con "they" el verbo no cambia: live',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I like food every day.',
      'respuesta_correcta': 'I like food every day.',
      'fonetica': '[ ai LAIK FUUD E-vri DEI ]',
      'traduccion_pregunta': 'Me gusta la comida todos los días.',
      'contexto_es': 'Con "I" el verbo no cambia: like',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She lives here.',
      'respuesta_correcta': 'She lives here.',
      'fonetica': '[ shi LIVS JIR ]',
      'traduccion_pregunta': 'Ella vive aquí.',
      'contexto_es': 'Con "she" el verbo lleva s: live → lives',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She wants food.',
      'traduccion_pregunta': 'Ella quiere comida.',
      'palabras': ['wants', 'She', 'food'],
      'respuesta_correcta': 'She wants food',
      'contexto_es': 'She → verbo con s',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I work every day.',
      'traduccion_pregunta': 'Yo trabajo todos los días.',
      'palabras': ['every', 'I', 'day', 'work'],
      'respuesta_correcta': 'I work every day',
      'contexto_es': 'I → el verbo no cambia',
    },

  ],
);
