import '../../../../models/lesson.dart';

// Palabras de REPASO (L01 + L02 + L03):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//
// Palabras NUEVAS L04 (en orden de enseñanza):
//   1. Do you have   [ du iu JAV ]      → ¿Tiene usted?
//   2. Wait          [ WEIT ]           → Esperar
//   3. Minutes       [ MI-nets ]        → Minutos
//   4. No problem    [ nou PROB-lem ]   → No hay problema
//   5. Please wait   [ pliis WEIT ]     → Por favor espere

const lesson04NoAppointment = Lesson(
  id: 4,
  title: 'No Appointment',
  description: 'Atiende clientes sin cita',
  emoji: '🚶',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a manejar a los clientes que llegan sin cita: '
      'preguntarles si tienen reserva, pedirles que esperen '
      'y hacerlos sentir bienvenidos de todas formas.',
  motivacionEs:
      '¡Manejar un walk-in en inglés con calma te hace ver '
      'como el barbero más profesional del barrio! 💪',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01 + L02 + L03 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // Una palabra de cada lección anterior ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Appointment · Take a seat · Haircut',
      'traduccion_pregunta': 'Cita · Tome asiento · Corte de cabello',
      'parejas_ingles': ['Appointment', 'Take a seat', 'Haircut'],
      'parejas_espanol': ['Cita', 'Tome asiento', 'Corte de cabello'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L03 ──────────────────────────────────────
    // Frase y opciones SOLO L03 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del corte',
      'quien_habla': 'El cliente dice',
      'frase': '___ on the sides, longer on top',
      'traduccion_pregunta': 'Degradado en los lados, más largo arriba',
      'respuesta_correcta': 'Fade',
      'opciones': ['Fade', 'Haircut', 'Top', 'Sides'],
      'contexto_es': 'Repaso del corte — L03',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L01+L02 ─────────────────────────────
    // Of course (L01) + Take a seat (L02) + What's your name (L02) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia completa del cliente con cita',
      'quien_habla': 'Tú le dices',
      'frase': "Of course! Take a seat, what's your name?",
      'respuesta_correcta': "Of course! Take a seat, what's your name?",
      'fonetica': '[ of KORS, teik a SIIT, wots ior NEIM ]',
      'traduccion_pregunta': '¡Claro! Tome asiento, ¿cómo se llama?',
      'contexto_es': 'La secuencia perfecta cuando el cliente tiene cita',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L04 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Do you have" ──────────────────────────────
    // Palabras nuevas: Do you have
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo preguntas si tiene cita',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have',
      'fonetica': '[ du iu JAV ]',
      'traduccion_pregunta': '¿Tiene usted?',
      'contexto_es': 'Preguntas si el cliente tiene cita reservada',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Do you have" ────────────────────────────
    // Disponibles L04: Do you have
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have',
      'respuesta_correcta': 'Do you have',
      'fonetica': '[ du iu JAV ]',
      'traduccion_pregunta': '¿Tiene usted?',
      'contexto_es': 'La pregunta clave para organizar tu agenda',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Wait" ──────────────────────────────────────
    // Palabras nuevas: Wait
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra importante',
      'quien_habla': 'Tú le dices',
      'frase': 'Wait',
      'fonetica': '[ WEIT ]',
      'traduccion_pregunta': 'Esperar',
      'contexto_es': 'Pides al cliente que espere su turno',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Wait" ────────────────────────────────────
    // Disponibles L04: Do you have · Wait
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Wait',
      'respuesta_correcta': 'Wait',
      'fonetica': '[ WEIT ]',
      'traduccion_pregunta': 'Esperar',
      'contexto_es': 'Suena amable, no como una orden',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Minutes" ───────────────────────────────────
    // Palabras nuevas: Minutes
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo dices el tiempo de espera',
      'quien_habla': 'Tú le dices',
      'frase': 'Minutes',
      'fonetica': '[ MI-nets ]',
      'traduccion_pregunta': 'Minutos',
      'contexto_es': 'Dices cuánto tiempo tiene que esperar el cliente',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Minutes" ─────────────────────────────────
    // Disponibles L04: Do you have · Wait · Minutes
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Minutes',
      'respuesta_correcta': 'Minutes',
      'fonetica': '[ MI-nets ]',
      'traduccion_pregunta': 'Minutos',
      'contexto_es': 'Siempre va con un número: "30 minutes"',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L04: Do you have · Wait · Minutes
    // Opciones: partes de las expresiones L04 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Pregunta si tiene cita',
      'quien_habla': 'Tú le dices',
      'frase': '___ you have an appointment?',
      'traduccion_pregunta': '¿Tiene usted una cita?',
      'respuesta_correcta': 'Do',
      'opciones': ['Do', 'Wait', 'No', 'Please'],
      'contexto_es': 'La primera pregunta a cualquier cliente que entra',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "No problem" ───────────────────────────────
    // Palabras nuevas: No problem
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta respuesta profesional',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem',
      'fonetica': '[ nou PROB-lem ]',
      'traduccion_pregunta': 'No hay problema',
      'contexto_es': 'Tranquilizas al cliente que llega sin cita',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "No problem" ─────────────────────────────
    // Disponibles L04: Do you have · Wait · Minutes · No problem
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem',
      'respuesta_correcta': 'No problem',
      'fonetica': '[ nou PROB-lem ]',
      'traduccion_pregunta': 'No hay problema',
      'contexto_es': 'Suena relajado — el cliente se siente mejor al escucharlo',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Please wait" ──────────────────────────────
    // Palabras nuevas: Please wait
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo pides que espere con cortesía',
      'quien_habla': 'Tú le dices',
      'frase': 'Please wait',
      'fonetica': '[ pliis WEIT ]',
      'traduccion_pregunta': 'Por favor espere',
      'contexto_es': 'Invitas al cliente a esperar de forma educada',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Please wait" ────────────────────────────
    // Disponibles L04: las 5 nuevas
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Please wait',
      'respuesta_correcta': 'Please wait',
      'fonetica': '[ pliis WEIT ]',
      'traduccion_pregunta': 'Por favor espere',
      'contexto_es': 'Más educado que solo decir "wait"',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L04 ───────────────────────────────
    // Las 5 palabras nuevas de L04 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Do you have · Wait · Minutes · No problem · Please wait',
      'traduccion_pregunta':
          '¿Tiene usted? · Esperar · Minutos · No hay problema · Por favor espere',
      'parejas_ingles': [
        'Do you have',
        'Wait',
        'Minutes',
        'No problem',
        'Please wait',
      ],
      'parejas_espanol': [
        '¿Tiene usted?',
        'Esperar',
        'Minutos',
        'No hay problema',
        'Por favor espere',
      ],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Frase y opciones usan SOLO palabras de L04 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la respuesta al cliente sin cita',
      'quien_habla': 'Tú le dices',
      'frase': 'Please ___, no problem',
      'traduccion_pregunta': 'Por favor espere, no hay problema',
      'respuesta_correcta': 'wait',
      'opciones': ['wait', 'do', 'minutes', 'have'],
      'contexto_es': 'Gestionas al cliente sin cita con calma',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // "Do" → L04 / "appointment" → L01 / "you","have","an" → apoyo ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la pregunta sobre la cita',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment?',
      'traduccion_pregunta': '¿Tiene usted una cita?',
      'palabras': ['Do', 'you', 'have', 'an', 'appointment', '?'],
      'respuesta_correcta': 'Do you have an appointment ?',
      'contexto_es': 'La pregunta que más usarás en tu silla',
    },

    // ── EJ 18 · ORDENAR REPASO L01+L04 ────────────────────────────────────
    // Of · course → L01 / no · problem · please · wait → L04 ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la respuesta profesional completa',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course, no problem, please wait',
      'traduccion_pregunta': 'Claro, no hay problema, por favor espere',
      'palabras': ['Of', 'course', 'no', 'problem', 'please', 'wait'],
      'respuesta_correcta': 'Of course no problem please wait',
      'contexto_es': 'Combinas L01 y L04 — la respuesta profesional completa',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa ────────────────────────────
    // Do you have (L04) + appointment (L01) + No problem (L04) + Please wait (L04) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia completa del walk-in',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment? No problem, please wait',
      'respuesta_correcta': 'Do you have an appointment? No problem, please wait',
      'fonetica': '[ du iu JAV an a-POINT-ment, nou PROB-lem, pliis WEIT ]',
      'traduccion_pregunta': '¿Tiene una cita? No hay problema, por favor espere',
      'contexto_es': 'Todo lo que necesitas para manejar un walk-in',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente llega sin cita — opciones SOLO L01+L02+L03+L04 ✓
    // Respuesta correcta: No problem (L04) + Please wait (L04)
    {
      'tipo': 'dialogo',
      'instruccion': 'Un cliente entra sin cita — ¿qué le dices?',
      'quien_habla': '¡Cliente sin cita! 🏆',
      'frase': 'Good morning! Haircut?',
      'traduccion_pregunta': '¡Buenos días! ¿Corte?',
      'cliente_dice': 'Good morning! Haircut?',
      'traduccion_cliente': '¡Buenos días! ¿Corte?',
      'respuesta_correcta': 'No problem! Please wait',
      'traduccion_respuesta': '¡No hay problema! Por favor espere',
      'opciones_barbero': [
        'No problem! Please wait',
        'Of course! Come in, take a seat',
        'Fade on the sides, longer on top',
        'Do you have an appointment?',
      ],
      'contexto_es':
          'No problem (L04) + Please wait (L04) — '
          'manejo profesional de walk-ins',
    },

  ],
);
