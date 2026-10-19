import '../../../../models/lesson.dart';

// STREET ENGLISH · L10 — Pasado interrogativo: Did
// Regla: para preguntar en pasado usas Did + sujeto + verbo base.
//        Did you work? / Did she go?
//
// Palabras de REPASO (L01-L09): work · go · see · get · come · say · here
//                               home · money · yes · her · last · week
//                               year · night · month
//
// Palabras NUEVAS L10: did (como auxiliar)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson10PastQuestion = Lesson(
  id: 10,
  title: 'Past Questions',
  description: 'Pasado interrogativo: Did + sujeto + verbo base',
  emoji: '❓',
  level: Level.A1,
  descripcionEs:
      'Para preguntar en pasado usas Did + sujeto + verbo base, '
      'sin -ed y sin forma irregular: "Did you work?" (no "Did you worked?"), '
      '"Did she go?" (no "Did she went?").',
  motivacionEs:
      '¡Con Did ya puedes preguntar por el pasado! El verbo queda en base. ❓',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did you work here last week?',
      'respuesta_correcta': 'Did you work here last week?',
      'fonetica': '[ DID iu work jir last UIIK ]',
      'traduccion_pregunta': '¿Trabajaste aquí la semana pasada?',
      'contexto_es': 'Did + you + work (sin -ed)',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did she go home last night?',
      'respuesta_correcta': 'Did she go home last night?',
      'fonetica': '[ DID shi gou JOUM last NAIT ]',
      'traduccion_pregunta': '¿Ella fue a casa anoche?',
      'contexto_es': 'Did + she + go (no "went")',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did they see her last year?',
      'respuesta_correcta': 'Did they see her last year?',
      'fonetica': '[ DID dei SII jer last IIR ]',
      'traduccion_pregunta': '¿Ellos la vieron el año pasado?',
      'contexto_es': 'Did + they + see (no "saw")',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did he get money last week?',
      'respuesta_correcta': 'Did he get money last week?',
      'fonetica': '[ DID ji GUET MA-ni last UIIK ]',
      'traduccion_pregunta': '¿Él consiguió dinero la semana pasada?',
      'contexto_es': 'Did + he + get (no "got")',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Did you work here last week?',
      'traduccion_pregunta': '¿Trabajaste aquí la semana pasada?',
      'palabras': ['you', 'Did', 'work', 'here', 'last', 'week'],
      'respuesta_correcta': 'Did you work here last week',
      'contexto_es': 'Did + you + verbo base',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Did she go home last night?',
      'traduccion_pregunta': '¿Ella fue a casa anoche?',
      'palabras': ['go', 'Did', 'she', 'home', 'last', 'night'],
      'respuesta_correcta': 'Did she go home last night',
      'contexto_es': 'Did + she + verbo base',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did we come here last year?',
      'respuesta_correcta': 'Did we come here last year?',
      'fonetica': '[ DID ui KAM jir last IIR ]',
      'traduccion_pregunta': '¿Vinimos aquí el año pasado?',
      'contexto_es': 'Did + we + come (no "came")',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did you say yes last night?',
      'respuesta_correcta': 'Did you say yes last night?',
      'fonetica': '[ DID iu SEI ies last NAIT ]',
      'traduccion_pregunta': '¿Dijiste que sí anoche?',
      'contexto_es': 'Did + you + say (no "said")',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did they work here last month?',
      'respuesta_correcta': 'Did they work here last month?',
      'fonetica': '[ DID dei work jir last MANZ ]',
      'traduccion_pregunta': '¿Ellos trabajaron aquí el mes pasado?',
      'contexto_es': 'Repaso: Did + they + work',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did he come here last year?',
      'respuesta_correcta': 'Did he come here last year?',
      'fonetica': '[ DID ji KAM jir last IIR ]',
      'traduccion_pregunta': '¿Él vino aquí el año pasado?',
      'contexto_es': 'Repaso: con "he" también Did + verbo base',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Did we come here last year?',
      'traduccion_pregunta': '¿Vinimos aquí el año pasado?',
      'palabras': ['here', 'Did', 'we', 'come', 'last', 'year'],
      'respuesta_correcta': 'Did we come here last year',
      'contexto_es': 'Did + we + verbo base',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Did they work here last month?',
      'traduccion_pregunta': '¿Ellos trabajaron aquí el mes pasado?',
      'palabras': ['here', 'Did', 'they', 'work', 'last', 'month'],
      'respuesta_correcta': 'Did they work here last month',
      'contexto_es': 'Did + they + verbo base',
    },

  ],
);
