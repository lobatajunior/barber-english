import '../../../../models/lesson.dart';

// STREET ENGLISH · L11 — Repaso Bloque 2
// Regla: repaso de was/were, verbos regulares, irregulares,
//        negativo e interrogativo en pasado.
//
// Palabras de REPASO (L06-L10): was · were · happy · worked · went · didn't
//                               did · work · go · here · home · yes · no
//                               last · week · year · night
//
// Palabras NUEVAS L11: ninguna (solo repaso)
//                      (nota: "weren't" aparece por primera vez en EJ 12)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson11ReviewBlock2 = Lesson(
  id: 11,
  title: 'Review Block 2',
  description: 'Repaso: was/were, regulares, irregulares, negativo y pregunta',
  emoji: '🔁',
  level: Level.A1,
  descripcionEs:
      'Repaso de todo el pasado: was/were ("Were they happy?"), '
      'regulares ("I worked here"), irregulares ("she went home"), '
      'negativo ("I didn\'t work here") y pregunta ("Did you work here?").',
  motivacionEs:
      '¡Ya dominas el pasado! Preguntar, afirmar y negar lo que pasó. 🔁',
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
      'contexto_es': 'Pregunta en pasado: Did + you + verbo base',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, I worked here last week.',
      'respuesta_correcta': 'Yes, I worked here last week.',
      'fonetica': '[ IES ai UORKT jir last UIIK ]',
      'traduccion_pregunta': 'Sí, trabajé aquí la semana pasada.',
      'contexto_es': 'Respuesta afirmativa: verbo regular + ed',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'No, I didn\'t work here last week.',
      'respuesta_correcta': 'No, I didn\'t work here last week.',
      'fonetica': '[ NOU ai DI-dent work jir last UIIK ]',
      'traduccion_pregunta': 'No, no trabajé aquí la semana pasada.',
      'contexto_es': 'Respuesta negativa: didn\'t + verbo base',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Did she go home last night?',
      'respuesta_correcta': 'Did she go home last night?',
      'fonetica': '[ DID shi gou JOUM last NAIT ]',
      'traduccion_pregunta': '¿Ella fue a casa anoche?',
      'contexto_es': 'Pregunta en pasado: Did + she + verbo base',
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
      'frase': 'I didn\'t work here last week.',
      'traduccion_pregunta': 'No trabajé aquí la semana pasada.',
      'palabras': ['didn\'t', 'I', 'work', 'here', 'last', 'week'],
      'respuesta_correcta': 'I didn\'t work here last week',
      'contexto_es': 'I + didn\'t + verbo base',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, she went home last night.',
      'respuesta_correcta': 'Yes, she went home last night.',
      'fonetica': '[ IES shi UENT JOUM last NAIT ]',
      'traduccion_pregunta': 'Sí, ella fue a casa anoche.',
      'contexto_es': 'Respuesta afirmativa: verbo irregular (go → went)',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'No, she didn\'t go home last night.',
      'respuesta_correcta': 'No, she didn\'t go home last night.',
      'fonetica': '[ NOU shi DI-dent gou JOUM last NAIT ]',
      'traduccion_pregunta': 'No, ella no fue a casa anoche.',
      'contexto_es': 'Respuesta negativa: didn\'t + go (no "went")',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Were they happy last year?',
      'respuesta_correcta': 'Were they happy last year?',
      'fonetica': '[ UER dei JA-pi last IIR ]',
      'traduccion_pregunta': '¿Estaban ellos felices el año pasado?',
      'contexto_es': 'Pregunta con were: Were + they (sin did)',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, they were happy last year.',
      'respuesta_correcta': 'Yes, they were happy last year.',
      'fonetica': '[ IES dei uer JA-pi last IIR ]',
      'traduccion_pregunta': 'Sí, estaban felices el año pasado.',
      'contexto_es': 'Respuesta afirmativa: they + were',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Were they happy last year?',
      'traduccion_pregunta': '¿Estaban ellos felices el año pasado?',
      'palabras': ['happy', 'Were', 'they', 'last', 'year'],
      'respuesta_correcta': 'Were they happy last year',
      'contexto_es': 'Were + they + adjetivo',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They weren\'t happy last year.',
      'traduccion_pregunta': 'Ellos no estaban felices el año pasado.',
      'palabras': ['weren\'t', 'They', 'happy', 'last', 'year'],
      'respuesta_correcta': 'They weren\'t happy last year',
      'contexto_es': 'They + weren\'t (were + not)',
    },

  ],
);
