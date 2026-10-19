import '../../../../models/lesson.dart';

// STREET ENGLISH · L08 — Pasado simple: verbos irregulares
// Regla: estos verbos cambian en pasado, no añaden -ed.
//        go → went · get → got · see → saw · say → said · come → came
//
// Palabras de REPASO (L01-L07): work · here · food · money · yes · last
//                               week · year · night · month · home
//
// Palabras NUEVAS L08: went · got · saw · said · came
//                      (+ "to" como palabra gramatical, "her" como pronombre)
//
// Estructura Street English: 12 ejercicios, solo pronunciacion y ordenar.

const streetLesson08PastIrregularVerbs = Lesson(
  id: 8,
  title: 'Past: Irregular Verbs',
  description: 'Pasado simple: verbos irregulares',
  emoji: '🔀',
  level: Level.A1,
  descripcionEs:
      'Algunos verbos cambian en pasado y no añaden -ed: '
      'go → went, get → got, see → saw, say → said, come → came '
      '("I went to work last week").',
  motivacionEs:
      '¡Estos verbos son rebeldes! No llevan -ed, cambian por completo. 🔀',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I went to work last week.',
      'respuesta_correcta': 'I went to work last week.',
      'fonetica': '[ ai UENT tu work last UIIK ]',
      'traduccion_pregunta': 'Yo fui al trabajo la semana pasada.',
      'contexto_es': 'go → went',
    },

    // ── EJ 02 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'She got money last night.',
      'respuesta_correcta': 'She got money last night.',
      'fonetica': '[ shi GOT MA-ni last NAIT ]',
      'traduccion_pregunta': 'Ella consiguió dinero anoche.',
      'contexto_es': 'get → got',
    },

    // ── EJ 03 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They saw food here last year.',
      'respuesta_correcta': 'They saw food here last year.',
      'fonetica': '[ dei SOO fuud jir last IIR ]',
      'traduccion_pregunta': 'Ellos vieron comida aquí el año pasado.',
      'contexto_es': 'see → saw',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He said yes last week.',
      'respuesta_correcta': 'He said yes last week.',
      'fonetica': '[ ji SED ies last UIIK ]',
      'traduccion_pregunta': 'Él dijo que sí la semana pasada.',
      'contexto_es': 'say → said',
    },

    // ── EJ 05 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'I went to work last week.',
      'traduccion_pregunta': 'Yo fui al trabajo la semana pasada.',
      'palabras': ['work', 'I', 'went', 'to', 'last', 'week'],
      'respuesta_correcta': 'I went to work last week',
      'contexto_es': 'I + went',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'She got money last night.',
      'traduccion_pregunta': 'Ella consiguió dinero anoche.',
      'palabras': ['got', 'She', 'money', 'last', 'night'],
      'respuesta_correcta': 'She got money last night',
      'contexto_es': 'She + got',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'We came here last year.',
      'respuesta_correcta': 'We came here last year.',
      'fonetica': '[ ui KEIM jir last IIR ]',
      'traduccion_pregunta': 'Nosotros vinimos aquí el año pasado.',
      'contexto_es': 'come → came',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'I saw her last night.',
      'respuesta_correcta': 'I saw her last night.',
      'fonetica': '[ ai SOO jer last NAIT ]',
      'traduccion_pregunta': 'Yo la vi anoche.',
      'contexto_es': 'Repaso: see → saw',
    },

    // ── EJ 09 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'They went home last week.',
      'respuesta_correcta': 'They went home last week.',
      'fonetica': '[ dei UENT JOUM last UIIK ]',
      'traduccion_pregunta': 'Ellos fueron a casa la semana pasada.',
      'contexto_es': 'Repaso: go → went',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'He came here last month.',
      'respuesta_correcta': 'He came here last month.',
      'fonetica': '[ ji KEIM jir last MANZ ]',
      'traduccion_pregunta': 'Él vino aquí el mes pasado.',
      'contexto_es': 'Repaso: come → came',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'We came here last year.',
      'traduccion_pregunta': 'Nosotros vinimos aquí el año pasado.',
      'palabras': ['here', 'We', 'came', 'last', 'year'],
      'respuesta_correcta': 'We came here last year',
      'contexto_es': 'We + came',
    },

    // ── EJ 12 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras',
      'quien_habla': 'Tú dices',
      'frase': 'They went home last week.',
      'traduccion_pregunta': 'Ellos fueron a casa la semana pasada.',
      'palabras': ['home', 'They', 'went', 'last', 'week'],
      'respuesta_correcta': 'They went home last week',
      'contexto_es': 'They + went',
    },

  ],
);
