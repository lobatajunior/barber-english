import '../../../../models/lesson.dart';

// STREET ENGLISH · L03 — Presente simple: preguntas con Do / Does
// Regla: para preguntar usas Do + I/you/we/they o Does + he/she.
//        El verbo no lleva s.
//
// Palabras de REPASO (L01-L02): work · live · like · want · every · day · here
//                               food · need · have · time · money · water · now
//
// Palabras NUEVAS L03: do · does (como auxiliares)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson03PresentQuestion = Lesson(
  id: 3,
  title: 'Present Questions',
  description: 'Preguntas con Do / Does',
  emoji: '❓',
  level: Level.A1,
  descripcionEs:
      'Para preguntar usas Do con I, you, we y they: "Do you work here?". '
      'Con he y she usas Does, y el verbo no lleva s: "Does he live here?".',
  motivacionEs:
      '¡Ahora puedes hacer preguntas en inglés! Preguntar es la clave para conversar. ❓',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do you work here?',
      'respuesta_correcta': 'Do you work here?',
      'fonetica': '[ DU iu work JIR ]',
      'traduccion_pregunta': '¿Trabajas aquí?',
      'contexto_es': 'Con "you" preguntas con Do + verbo',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does he live here?',
      'respuesta_correcta': 'Does he live here?',
      'fonetica': '[ DAS ji liv JIR ]',
      'traduccion_pregunta': '¿Él vive aquí?',
      'contexto_es': 'Con "he" usas Does y el verbo pierde la s: live',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do they need water?',
      'respuesta_correcta': 'Do they need water?',
      'fonetica': '[ DU dei niid WO-ter ]',
      'traduccion_pregunta': '¿Ellos necesitan agua?',
      'contexto_es': 'Con "they" preguntas con Do + verbo',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does she have money?',
      'respuesta_correcta': 'Does she have money?',
      'fonetica': '[ DAS shi jav MA-ni ]',
      'traduccion_pregunta': '¿Ella tiene dinero?',
      'contexto_es': 'Con "she" usas Does + verbo sin s: have',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Do you work here?',
      'traduccion_pregunta': '¿Trabajas aquí?',
      'palabras': ['you', 'Do', 'work', 'here'],
      'respuesta_correcta': 'Do you work here',
      'contexto_es': 'Do + you + verbo',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Does he live here?',
      'traduccion_pregunta': '¿Él vive aquí?',
      'palabras': ['he', 'Does', 'live', 'here'],
      'respuesta_correcta': 'Does he live here',
      'contexto_es': 'Does + he + verbo sin s',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do we want food now?',
      'respuesta_correcta': 'Do we want food now?',
      'fonetica': '[ DU wi wont FUUD NAU ]',
      'traduccion_pregunta': '¿Queremos comida ahora?',
      'contexto_es': 'Con "we" preguntas con Do + verbo',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does he like food?',
      'respuesta_correcta': 'Does he like food?',
      'fonetica': '[ DAS ji laik FUUD ]',
      'traduccion_pregunta': '¿A él le gusta la comida?',
      'contexto_es': 'Con "he" usas Does y el verbo pierde la s: like',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do you have time?',
      'respuesta_correcta': 'Do you have time?',
      'fonetica': '[ DU iu jav TAIM ]',
      'traduccion_pregunta': '¿Tienes tiempo?',
      'contexto_es': 'Con "you" preguntas con Do + verbo',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does she work every day?',
      'respuesta_correcta': 'Does she work every day?',
      'fonetica': '[ DAS shi work E-vri DEI ]',
      'traduccion_pregunta': '¿Ella trabaja todos los días?',
      'contexto_es': 'Con "she" usas Does y el verbo pierde la s: work',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Does she have money?',
      'traduccion_pregunta': '¿Ella tiene dinero?',
      'palabras': ['Does', 'she', 'have', 'money'],
      'respuesta_correcta': 'Does she have money',
      'contexto_es': 'Does + she + verbo sin s',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Do they need water?',
      'traduccion_pregunta': '¿Ellos necesitan agua?',
      'palabras': ['they', 'Do', 'need', 'water'],
      'respuesta_correcta': 'Do they need water',
      'contexto_es': 'Do + they + verbo',
    },

  ],
);
