import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L06):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//   L05: Son · Move · Patient · Photo · Modern
//   L06: Number one · Short · Long · Same · Little
//
// Palabras NUEVAS L07 (en orden de enseñanza):
//   1. Water      [ WO-ter ]   → Agua
//   2. Coffee     [ KO-fi ]    → Café
//   3. Drink      [ DRINK ]    → Tomar algo / Bebida
//   4. While      [ WAIL ]     → Mientras
//   5. Something  [ SOM-zing ] → Algo

const lesson07WaitingTime = Lesson(
  id: 7,
  title: 'Waiting Time',
  description: 'Atiende al cliente que espera su turno',
  emoji: '☕',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a ofrecer algo de tomar al cliente mientras espera: '
      'agua, café y la frase perfecta para hacer la espera más agradable.',
  motivacionEs:
      '¡Un cliente cómodo mientras espera es un cliente que siempre vuelve! ☕',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L06 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L01 · L02 · L04 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Welcome · Take a seat · No problem',
      'traduccion_pregunta': 'Bienvenido · Tome asiento · No hay problema',
      'parejas_ingles': ['Welcome', 'Take a seat', 'No problem'],
      'parejas_espanol': ['Bienvenido', 'Tome asiento', 'No hay problema'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L06 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ on the sides, long on top',
      'traduccion_pregunta': 'Corto en los lados, largo arriba',
      'respuesta_correcta': 'short',
      'opciones': ['short', 'long', 'little', 'same'],
      'contexto_es': 'Repaso de L06 — el largo del corte',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L01+L02+L04 ─────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el saludo completo al cliente walk-in',
      'quien_habla': 'Tú le dices',
      'frase': 'Welcome! Come in, take a seat, no problem',
      'respuesta_correcta': 'Welcome! Come in, take a seat, no problem',
      'fonetica': '[ WEL-kom, kom IN, teik a SIIT, nou PROB-lem ]',
      'traduccion_pregunta': '¡Bienvenido! Pase, tome asiento, no hay problema',
      'contexto_es': 'Combinas L01, L02 y L04 — recibes al cliente walk-in',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L07 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Water" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha lo que puedes ofrecer al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Water',
      'fonetica': '[ WO-ter ]',
      'traduccion_pregunta': 'Agua',
      'contexto_es': 'Siempre ten agua lista para tus clientes',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Water" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Water',
      'respuesta_correcta': 'Water',
      'fonetica': '[ WO-ter ]',
      'traduccion_pregunta': 'Agua',
      'contexto_es': '"Water?" — dos sílabas que hacen sentir al cliente como en casa',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Coffee" ────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la segunda opción que puedes ofrecer',
      'quien_habla': 'Tú le dices',
      'frase': 'Coffee',
      'fonetica': '[ KO-fi ]',
      'traduccion_pregunta': 'Café',
      'contexto_es': 'Un café mientras espera = cliente satisfecho',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Coffee" ──────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Coffee',
      'respuesta_correcta': 'Coffee',
      'fonetica': '[ KO-fi ]',
      'traduccion_pregunta': 'Café',
      'contexto_es': '"Water or coffee?" — la pregunta que distingue a los mejores barberos',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Drink" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra general para cualquier bebida',
      'quien_habla': 'Tú le dices',
      'frase': 'Drink',
      'fonetica': '[ DRINK ]',
      'traduccion_pregunta': 'Tomar algo / Bebida',
      'contexto_es': '"Drink" se usa cuando ofreces cualquier tipo de bebida',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Drink" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Drink',
      'respuesta_correcta': 'Drink',
      'fonetica': '[ DRINK ]',
      'traduccion_pregunta': 'Tomar algo / Bebida',
      'contexto_es': '"Something to drink?" — la pregunta más amable de la barbería',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L07: Water · Coffee · Drink
    {
      'tipo': 'completar',
      'instruccion': 'Completa la oferta al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Water or ___, please?',
      'traduccion_pregunta': '¿Agua o café, por favor?',
      'respuesta_correcta': 'coffee',
      'opciones': ['coffee', 'water', 'drink', 'please'],
      'contexto_es': 'Ofreces las dos opciones al cliente que espera',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "While" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra que une la espera con la oferta',
      'quien_habla': 'Tú le dices',
      'frase': 'While',
      'fonetica': '[ WAIL ]',
      'traduccion_pregunta': 'Mientras',
      'contexto_es': '"While you wait" — mientras espera',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "While" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'While',
      'respuesta_correcta': 'While',
      'fonetica': '[ WAIL ]',
      'traduccion_pregunta': 'Mientras',
      'contexto_es': '"While you wait" — haces que la espera se sienta más corta',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Something" ────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra que engloba cualquier oferta',
      'quien_habla': 'Tú le dices',
      'frase': 'Something',
      'fonetica': '[ SOM-zing ]',
      'traduccion_pregunta': 'Algo',
      'contexto_es': '"Something to drink?" — ¿desea algo de tomar?',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Something" ──────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Something',
      'respuesta_correcta': 'Something',
      'fonetica': '[ SOM-zing ]',
      'traduccion_pregunta': 'Algo',
      'contexto_es': '"Something to drink while you wait?" — la frase del barbero que cuida a sus clientes',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L07 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Water · Coffee · Drink · While · Something',
      'traduccion_pregunta': 'Agua · Café · Bebida · Mientras · Algo',
      'parejas_ingles': ['Water', 'Coffee', 'Drink', 'While', 'Something'],
      'parejas_espanol': ['Agua', 'Café', 'Bebida', 'Mientras', 'Algo'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L07 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Something to ___ while you wait?',
      'traduccion_pregunta': '¿Algo de tomar mientras espera?',
      'respuesta_correcta': 'drink',
      'opciones': ['drink', 'water', 'coffee', 'while'],
      'contexto_es': 'La pregunta estrella del barbero amable',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Water · coffee · while · wait (L04+L07) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la oferta completa al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Water or coffee while you wait',
      'traduccion_pregunta': 'Agua o café mientras espera',
      'palabras': ['water', 'or', 'coffee', 'while', 'you', 'wait'],
      'respuesta_correcta': 'water or coffee while you wait',
      'contexto_es': 'Así le das opciones al cliente que espera',
    },

    // ── EJ 18 · ORDENAR REPASO L04+L07 ────────────────────────────────────
    // No problem (L04) + please wait (L04) + something to drink (L07) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la atención completa al cliente sin cita',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem, please wait, something to drink',
      'traduccion_pregunta': 'No hay problema, por favor espere, algo de tomar',
      'palabras': ['No', 'problem', 'please', 'wait', 'something', 'to', 'drink'],
      'respuesta_correcta': 'No problem please wait something to drink',
      'contexto_es': 'Combinas L04 y L07 — manejas al walk-in con hospitalidad',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L07 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la oferta perfecta al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Something to drink while you wait? Water or coffee?',
      'respuesta_correcta': 'Something to drink while you wait? Water or coffee?',
      'fonetica': '[ SOM-zing tu DRINK wail iu WEIT, WO-ter or KO-fi ]',
      'traduccion_pregunta': '¿Algo de tomar mientras espera? ¿Agua o café?',
      'contexto_es': 'La presentación perfecta para el cliente que llega a esperar',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente pregunta si tienen algo de tomar — opciones SOLO L01–L07 ✓
    // Respuesta correcta: Of course (L01) + Water or coffee while you wait (L07)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pregunta si tienen algo de tomar — ¿qué le dices?',
      'quien_habla': '¡Atiende al cliente que espera! 🏆',
      'frase': 'Do you have something to drink while I wait?',
      'traduccion_pregunta': '¿Tienen algo de tomar mientras espero?',
      'cliente_dice': 'Do you have something to drink while I wait?',
      'traduccion_cliente': '¿Tienen algo de tomar mientras espero?',
      'respuesta_correcta': 'Of course! Water or coffee while you wait',
      'traduccion_respuesta': '¡Claro! Agua o café mientras espera',
      'opciones_barbero': [
        'Of course! Water or coffee while you wait',
        'Do you have an appointment?',
        'Short on the sides, long on top?',
        'No problem, please wait',
      ],
      'contexto_es':
          'Of course (L01) + Water or coffee while you wait (L07) — '
          'hospitalidad de nivel profesional',
    },

  ],
);
