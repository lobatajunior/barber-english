import '../../../../models/lesson.dart';

// STREET ENGLISH · L02 — Presente simple negativo
// Regla: con I/you/we/they usas don't + verbo.
//        Con he/she usas doesn't + verbo, sin s.
//
// Palabras de REPASO (L01): work · live · like · want · every · day · here · food
//
// Palabras NUEVAS L02 (de street_english_vocab.dart):
//   need · have · time · money · water · now
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson02PresentNegative = Lesson(
  id: 2,
  title: 'Present Negative',
  description: 'Presente simple negativo',
  emoji: '🚫',
  level: Level.A1,
  descripcionEs:
      'Con I, you, we y they usas don\'t + verbo: "I don\'t have time". '
      'Con he y she usas doesn\'t + verbo, sin s: "he doesn\'t live here".',
  motivacionEs:
      '¡Decir que no también es comunicarte! Ahora puedes negar en inglés. 🚫',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I don\'t have time.',
      'respuesta_correcta': 'I don\'t have time.',
      'fonetica': '[ ai DOUNT jav TAIM ]',
      'traduccion_pregunta': 'No tengo tiempo.',
      'contexto_es': 'Con "I" usas don\'t + verbo',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'You don\'t work here.',
      'respuesta_correcta': 'You don\'t work here.',
      'fonetica': '[ iu DOUNT work JIR ]',
      'traduccion_pregunta': 'Tú no trabajas aquí.',
      'contexto_es': 'Con "you" usas don\'t + verbo',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He doesn\'t live here.',
      'respuesta_correcta': 'He doesn\'t live here.',
      'fonetica': '[ ji DA-sent liv JIR ]',
      'traduccion_pregunta': 'Él no vive aquí.',
      'contexto_es': 'Con "he" usas doesn\'t y el verbo pierde la s: live',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She doesn\'t have money.',
      'respuesta_correcta': 'She doesn\'t have money.',
      'fonetica': '[ shi DA-sent jav MA-ni ]',
      'traduccion_pregunta': 'Ella no tiene dinero.',
      'contexto_es': 'Con "she" usas doesn\'t + verbo sin s: have',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I don\'t have time.',
      'traduccion_pregunta': 'No tengo tiempo.',
      'palabras': ['don\'t', 'I', 'time', 'have'],
      'respuesta_correcta': 'I don\'t have time',
      'contexto_es': 'I → don\'t + verbo',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'He doesn\'t live here.',
      'traduccion_pregunta': 'Él no vive aquí.',
      'palabras': ['doesn\'t', 'He', 'here', 'live'],
      'respuesta_correcta': 'He doesn\'t live here',
      'contexto_es': 'He → doesn\'t + verbo sin s',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We don\'t need water.',
      'respuesta_correcta': 'We don\'t need water.',
      'fonetica': '[ wi DOUNT niid WO-ter ]',
      'traduccion_pregunta': 'No necesitamos agua.',
      'contexto_es': 'Con "we" usas don\'t + verbo',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They don\'t like food here.',
      'respuesta_correcta': 'They don\'t like food here.',
      'fonetica': '[ dei DOUNT laik FUUD JIR ]',
      'traduccion_pregunta': 'A ellos no les gusta la comida de aquí.',
      'contexto_es': 'Con "they" usas don\'t + verbo',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I don\'t want food now.',
      'respuesta_correcta': 'I don\'t want food now.',
      'fonetica': '[ ai DOUNT wont FUUD NAU ]',
      'traduccion_pregunta': 'No quiero comida ahora.',
      'contexto_es': 'Con "I" usas don\'t + verbo',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She doesn\'t work every day.',
      'respuesta_correcta': 'She doesn\'t work every day.',
      'fonetica': '[ shi DA-sent work E-vri DEI ]',
      'traduccion_pregunta': 'Ella no trabaja todos los días.',
      'contexto_es': 'Con "she" usas doesn\'t y el verbo pierde la s: work',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'We don\'t need money.',
      'traduccion_pregunta': 'No necesitamos dinero.',
      'palabras': ['need', 'We', 'money', 'don\'t'],
      'respuesta_correcta': 'We don\'t need money',
      'contexto_es': 'We → don\'t + verbo',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She doesn\'t work every day.',
      'traduccion_pregunta': 'Ella no trabaja todos los días.',
      'palabras': ['every', 'She', 'work', 'day', 'doesn\'t'],
      'respuesta_correcta': 'She doesn\'t work every day',
      'contexto_es': 'She → doesn\'t + verbo sin s',
    },

  ],
);
