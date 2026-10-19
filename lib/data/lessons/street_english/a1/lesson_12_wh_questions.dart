import '../../../../models/lesson.dart';

// STREET ENGLISH · L12 — Where / What / When / Who
// Regla: estas palabras van al inicio de la pregunta para pedir información.
//        Where = dónde · What = qué · When = cuándo · Who = quién
//        Where / What / When + did + sujeto + verbo base.
//        Who como sujeto va sin did: Who came here?
//
// Palabras de REPASO (L01-L11): did · work · get · come · see · go · need
//                               came · here · her · last · week · year
//                               night · month
//
// Palabras NUEVAS L12: where · what · when · who
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson12WhQuestions = Lesson(
  id: 12,
  title: 'Wh- Questions',
  description: 'Where / What / When / Who para preguntar',
  emoji: '🔎',
  level: Level.A1,
  descripcionEs:
      'Where (dónde), What (qué), When (cuándo) y Who (quién) van al inicio '
      'de la pregunta para pedir información: "Where did you work last year?". '
      'Cuando Who es quien hace la acción, no lleva did y el verbo va en '
      'pasado: "Who came here?".',
  motivacionEs:
      '¡Ya no solo preguntas sí o no! Ahora pides información de verdad. 🔎',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Where did you work last year?',
      'respuesta_correcta': 'Where did you work last year?',
      'fonetica': '[ UER did iu work last IIR ]',
      'traduccion_pregunta': '¿Dónde trabajaste el año pasado?',
      'contexto_es': 'Where (dónde) + did + you + verbo base',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'What did she get last night?',
      'respuesta_correcta': 'What did she get last night?',
      'fonetica': '[ UAT did shi GUET last NAIT ]',
      'traduccion_pregunta': '¿Qué consiguió ella anoche?',
      'contexto_es': 'What (qué) + did + she + verbo base',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'When did they come here?',
      'respuesta_correcta': 'When did they come here?',
      'fonetica': '[ UEN did dei KAM JIR ]',
      'traduccion_pregunta': '¿Cuándo vinieron ellos aquí?',
      'contexto_es': 'When (cuándo) + did + they + verbo base',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Who did you see last week?',
      'respuesta_correcta': 'Who did you see last week?',
      'fonetica': '[ JUU did iu SII last UIIK ]',
      'traduccion_pregunta': '¿A quién viste la semana pasada?',
      'contexto_es': 'Who (a quién) + did + you + verbo base',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
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

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'What did she get last night?',
      'traduccion_pregunta': '¿Qué consiguió ella anoche?',
      'palabras': ['she', 'What', 'get', 'did', 'last', 'night'],
      'respuesta_correcta': 'What did she get last night',
      'contexto_es': 'What + did + sujeto + verbo base',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Where did he go last night?',
      'respuesta_correcta': 'Where did he go last night?',
      'fonetica': '[ UER did ji GOU last NAIT ]',
      'traduccion_pregunta': '¿Dónde fue él anoche?',
      'contexto_es': 'Where + did + he + go (no "went")',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'What did we need last week?',
      'respuesta_correcta': 'What did we need last week?',
      'fonetica': '[ UAT did ui NIID last UIIK ]',
      'traduccion_pregunta': '¿Qué necesitábamos la semana pasada?',
      'contexto_es': 'What + did + we + need (no "needed")',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'When did you see her last year?',
      'respuesta_correcta': 'When did you see her last year?',
      'fonetica': '[ UEN did iu SII jer last IIR ]',
      'traduccion_pregunta': '¿Cuándo la viste el año pasado?',
      'contexto_es': 'When + did + you + see (no "saw")',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Who came here last month?',
      'respuesta_correcta': 'Who came here last month?',
      'fonetica': '[ JUU KEIM jir last MANZ ]',
      'traduccion_pregunta': '¿Quién vino aquí el mes pasado?',
      'contexto_es': 'Who como sujeto: sin did, verbo en pasado (came)',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Where did he go last night?',
      'traduccion_pregunta': '¿Dónde fue él anoche?',
      'palabras': ['he', 'Where', 'go', 'did', 'last', 'night'],
      'respuesta_correcta': 'Where did he go last night',
      'contexto_es': 'Where + did + sujeto + verbo base',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Who came here last month?',
      'traduccion_pregunta': '¿Quién vino aquí el mes pasado?',
      'palabras': ['here', 'Who', 'came', 'last', 'month'],
      'respuesta_correcta': 'Who came here last month',
      'contexto_es': 'Who + verbo en pasado (sin did)',
    },

  ],
);
