import '../../../../models/lesson.dart';

// STREET ENGLISH · L13 — Repaso Bloque 3
// Regla: repaso de preguntas con Where, What, When y Who
//        mezcladas con pasado y presente.
//
// Palabras de REPASO (L01-L12): where · what · when · who · do · did
//                               work · need · get · come · see · here
//                               now · last · week · year · night
//
// Palabras NUEVAS L13: ninguna (solo repaso)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson13ReviewBlock3 = Lesson(
  id: 13,
  title: 'Review Block 3',
  description: 'Repaso: Where / What / When / Who en presente y pasado',
  emoji: '🔁',
  level: Level.A1,
  descripcionEs:
      'Repaso de las preguntas con Where, What, When y Who. En presente usas '
      'do ("Where do you work?") y en pasado did ("Where did you work last '
      'year?"). Cuando Who es quien hace la acción, no lleva do ni did: '
      '"Who works here now?".',
  motivacionEs:
      '¡Presente o pasado, ya sabes preguntar lo que quieras! 🔁',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Where do you work?',
      'respuesta_correcta': 'Where do you work?',
      'fonetica': '[ UER du iu WORK ]',
      'traduccion_pregunta': '¿Dónde trabajas?',
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
      'frase': 'What do you need now?',
      'respuesta_correcta': 'What do you need now?',
      'fonetica': '[ UAT du iu niid NAU ]',
      'traduccion_pregunta': '¿Qué necesitas ahora?',
      'contexto_es': 'Presente: What + do + you + verbo',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'What did she get last night?',
      'respuesta_correcta': 'What did she get last night?',
      'fonetica': '[ UAT did shi GUET last NAIT ]',
      'traduccion_pregunta': '¿Qué consiguió ella anoche?',
      'contexto_es': 'Pasado: What + did + she + verbo base',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Where do you work?',
      'traduccion_pregunta': '¿Dónde trabajas?',
      'palabras': ['you', 'Where', 'work', 'do'],
      'respuesta_correcta': 'Where do you work',
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
      'frase': 'When did they come here?',
      'respuesta_correcta': 'When did they come here?',
      'fonetica': '[ UEN did dei KAM JIR ]',
      'traduccion_pregunta': '¿Cuándo vinieron ellos aquí?',
      'contexto_es': 'Pasado: When + did + they + verbo base',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Who did you see last week?',
      'respuesta_correcta': 'Who did you see last week?',
      'fonetica': '[ JUU did iu SII last UIIK ]',
      'traduccion_pregunta': '¿A quién viste la semana pasada?',
      'contexto_es': 'Pasado: Who (a quién) + did + you + verbo base',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Who works here now?',
      'respuesta_correcta': 'Who works here now?',
      'fonetica': '[ JUU WORKS jir NAU ]',
      'traduccion_pregunta': '¿Quién trabaja aquí ahora?',
      'contexto_es': 'Who como sujeto: sin do, el verbo lleva s (works)',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'When do you work?',
      'respuesta_correcta': 'When do you work?',
      'fonetica': '[ UEN du iu WORK ]',
      'traduccion_pregunta': '¿Cuándo trabajas?',
      'contexto_es': 'Presente: When + do + you + verbo',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Who works here now?',
      'traduccion_pregunta': '¿Quién trabaja aquí ahora?',
      'palabras': ['here', 'Who', 'works', 'now'],
      'respuesta_correcta': 'Who works here now',
      'contexto_es': 'Who + verbo con s (sin do)',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'When did they come here?',
      'traduccion_pregunta': '¿Cuándo vinieron ellos aquí?',
      'palabras': ['they', 'When', 'come', 'did', 'here'],
      'respuesta_correcta': 'When did they come here',
      'contexto_es': 'When + did + sujeto + verbo base',
    },

  ],
);
