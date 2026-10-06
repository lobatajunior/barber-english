import '../../../../models/lesson.dart';

// STREET ENGLISH · L04 — Preguntas y respuestas completas
// Regla: para responder usas forma corta (Yes, I do / No, I don't)
//        o forma larga (Yes, I like food / No, I don't like food).
//
// Palabras de REPASO (L01-L03): work · live · like · want · every · day · here
//                               food · need · have · time · money · water · now
//                               do · does
//
// Palabras NUEVAS L04: yes · no (como respuestas)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson04QuestionsAnswers = Lesson(
  id: 4,
  title: 'Questions & Answers',
  description: 'Preguntas y respuestas completas',
  emoji: '💬',
  level: Level.A1,
  descripcionEs:
      'Para responder usas la forma corta: "Yes, I do" / "No, I don\'t". '
      'O la forma larga: "Yes, I like food" / "No, I don\'t like food". '
      'Con he y she: "Yes, she does" / "No, she doesn\'t".',
  motivacionEs:
      '¡Ya puedes preguntar y responder! Eso es una conversación de verdad. 💬',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do you like food? Yes, I do.',
      'respuesta_correcta': 'Do you like food? Yes, I do.',
      'fonetica': '[ DU iu laik FUUD · IES ai DU ]',
      'traduccion_pregunta': '¿Te gusta la comida? Sí, me gusta.',
      'contexto_es': 'Respuesta corta afirmativa: Yes, I do',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do you like food? No, I don\'t.',
      'respuesta_correcta': 'Do you like food? No, I don\'t.',
      'fonetica': '[ DU iu laik FUUD · NOU ai DOUNT ]',
      'traduccion_pregunta': '¿Te gusta la comida? No, no me gusta.',
      'contexto_es': 'Respuesta corta negativa: No, I don\'t',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does she work here? Yes, she does.',
      'respuesta_correcta': 'Does she work here? Yes, she does.',
      'fonetica': '[ DAS shi work JIR · IES shi DAS ]',
      'traduccion_pregunta': '¿Ella trabaja aquí? Sí.',
      'contexto_es': 'Con "she" respondes: Yes, she does',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does she work here? No, she doesn\'t.',
      'respuesta_correcta': 'Does she work here? No, she doesn\'t.',
      'fonetica': '[ DAS shi work JIR · NOU shi DA-sent ]',
      'traduccion_pregunta': '¿Ella trabaja aquí? No.',
      'contexto_es': 'Con "she" respondes: No, she doesn\'t',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Do you like food?',
      'traduccion_pregunta': '¿Te gusta la comida?',
      'palabras': ['you', 'Do', 'food', 'like'],
      'respuesta_correcta': 'Do you like food',
      'contexto_es': 'Do + you + verbo',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'No, I don\'t.',
      'traduccion_pregunta': 'No.',
      'palabras': ['don\'t', 'No,', 'I'],
      'respuesta_correcta': 'No, I don\'t',
      'contexto_es': 'No + I + don\'t',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do they need water? Yes, they do.',
      'respuesta_correcta': 'Do they need water? Yes, they do.',
      'fonetica': '[ DU dei niid WO-ter · IES dei DU ]',
      'traduccion_pregunta': '¿Ellos necesitan agua? Sí.',
      'contexto_es': 'Con "they" respondes: Yes, they do',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Do they need water? No, they don\'t.',
      'respuesta_correcta': 'Do they need water? No, they don\'t.',
      'fonetica': '[ DU dei niid WO-ter · NOU dei DOUNT ]',
      'traduccion_pregunta': '¿Ellos necesitan agua? No.',
      'contexto_es': 'Con "they" respondes: No, they don\'t',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does he have money? Yes, he does.',
      'respuesta_correcta': 'Does he have money? Yes, he does.',
      'fonetica': '[ DAS ji jav MA-ni · IES ji DAS ]',
      'traduccion_pregunta': '¿Él tiene dinero? Sí.',
      'contexto_es': 'Con "he" respondes: Yes, he does',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Does he have money? No, he doesn\'t.',
      'respuesta_correcta': 'Does he have money? No, he doesn\'t.',
      'fonetica': '[ DAS ji jav MA-ni · NOU ji DA-sent ]',
      'traduccion_pregunta': '¿Él tiene dinero? No.',
      'contexto_es': 'Con "he" respondes: No, he doesn\'t',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Does she work here?',
      'traduccion_pregunta': '¿Ella trabaja aquí?',
      'palabras': ['she', 'Does', 'here', 'work'],
      'respuesta_correcta': 'Does she work here',
      'contexto_es': 'Does + she + verbo sin s',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'No, she doesn\'t.',
      'traduccion_pregunta': 'No.',
      'palabras': ['doesn\'t', 'No,', 'she'],
      'respuesta_correcta': 'No, she doesn\'t',
      'contexto_es': 'No + she + doesn\'t',
    },

  ],
);
