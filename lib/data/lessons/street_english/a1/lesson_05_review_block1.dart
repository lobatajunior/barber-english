import '../../../../models/lesson.dart';

// STREET ENGLISH · L05 — Repaso Bloque 1
// Regla: mezcla afirmativo, negativo, pregunta y respuesta
//        con frases más completas.
//
// Palabras de REPASO (L01-L04): work · live · like · want · every · day · here
//                               food · need · have · time · money · water · now
//                               do · does · yes · no
//
// Palabras NUEVAS L05: ninguna (solo repaso)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson05ReviewBlock1 = Lesson(
  id: 5,
  title: 'Review Block 1',
  description: 'Repaso: afirmativo, negativo, pregunta y respuesta',
  emoji: '🔁',
  level: Level.A1,
  descripcionEs:
      'Repaso de todo el bloque: afirmativo ("he likes food"), '
      'negativo ("I don\'t work here"), pregunta ("Do you work here?") '
      'y respuesta ("Yes, she needs money now"). Frases más completas.',
  motivacionEs:
      '¡Ya juntas todas las piezas! Afirmar, negar, preguntar y responder. 🔁',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do you work here every day?',
      'respuesta_correcta': 'Do you work here every day?',
      'fonetica': '[ DU iu work JIR E-vri DEI ]',
      'traduccion_pregunta': '¿Trabajas aquí todos los días?',
      'contexto_es': 'Pregunta con Do + you + verbo',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'No, I don\'t work here every day.',
      'respuesta_correcta': 'No, I don\'t work here every day.',
      'fonetica': '[ NOU ai DOUNT work JIR E-vri DEI ]',
      'traduccion_pregunta': 'No, no trabajo aquí todos los días.',
      'contexto_es': 'Respuesta larga negativa: No, I don\'t + verbo',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does she need money now?',
      'respuesta_correcta': 'Does she need money now?',
      'fonetica': '[ DAS shi niid MA-ni NAU ]',
      'traduccion_pregunta': '¿Ella necesita dinero ahora?',
      'contexto_es': 'Pregunta con Does + she + verbo sin s',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, she needs money now.',
      'respuesta_correcta': 'Yes, she needs money now.',
      'fonetica': '[ IES shi NIIDS MA-ni NAU ]',
      'traduccion_pregunta': 'Sí, ella necesita dinero ahora.',
      'contexto_es': 'Respuesta larga afirmativa: con "she" el verbo lleva s',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Do you work here every day?',
      'traduccion_pregunta': '¿Trabajas aquí todos los días?',
      'palabras': ['every', 'you', 'Do', 'work', 'day', 'here'],
      'respuesta_correcta': 'Do you work here every day',
      'contexto_es': 'Do + you + verbo',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'No, I don\'t work here every day.',
      'traduccion_pregunta': 'No, no trabajo aquí todos los días.',
      'palabras': ['don\'t', 'here', 'I', 'every', 'work', 'day', 'No,'],
      'respuesta_correcta': 'No, I don\'t work here every day',
      'contexto_es': 'No + I + don\'t + verbo',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do they live here?',
      'respuesta_correcta': 'Do they live here?',
      'fonetica': '[ DU dei liv JIR ]',
      'traduccion_pregunta': '¿Ellos viven aquí?',
      'contexto_es': 'Pregunta con Do + they + verbo',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'No, they don\'t live here.',
      'respuesta_correcta': 'No, they don\'t live here.',
      'fonetica': '[ NOU dei DOUNT liv JIR ]',
      'traduccion_pregunta': 'No, ellos no viven aquí.',
      'contexto_es': 'Respuesta larga negativa: No, they don\'t + verbo',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does he like food every day?',
      'respuesta_correcta': 'Does he like food every day?',
      'fonetica': '[ DAS ji laik FUUD E-vri DEI ]',
      'traduccion_pregunta': '¿A él le gusta la comida todos los días?',
      'contexto_es': 'Pregunta con Does + he + verbo sin s',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, he likes food every day.',
      'respuesta_correcta': 'Yes, he likes food every day.',
      'fonetica': '[ IES ji LAIKS FUUD E-vri DEI ]',
      'traduccion_pregunta': 'Sí, a él le gusta la comida todos los días.',
      'contexto_es': 'Respuesta larga afirmativa: con "he" el verbo lleva s',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Does she need money now?',
      'traduccion_pregunta': '¿Ella necesita dinero ahora?',
      'palabras': ['she', 'Does', 'money', 'need', 'now'],
      'respuesta_correcta': 'Does she need money now',
      'contexto_es': 'Does + she + verbo sin s',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, he likes food every day.',
      'traduccion_pregunta': 'Sí, a él le gusta la comida todos los días.',
      'palabras': ['likes', 'he', 'Yes,', 'food', 'every', 'day'],
      'respuesta_correcta': 'Yes, he likes food every day',
      'contexto_es': 'Yes + he + verbo con s',
    },

  ],
);
