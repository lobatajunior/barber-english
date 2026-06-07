import '../../../../models/lesson.dart';

// Palabras de REPASO (L01):
//   Good morning · Appointment · Welcome · Come in · Of course
//
// Palabras NUEVAS L02 (en orden de enseñanza):
//   1. Sit down        [ SIT daun ]
//   2. My name is      [ mai NEIM is ]
//   3. What's your name[ wots ior NEIM ]
//   4. Nice to meet you[ nais tu miit IU ]
//   5. Take a seat     [ teik a SIIT ]

const lesson02TakeASeat = Lesson(
  id: 2,
  title: 'Take a Seat',
  description: 'Preséntate y sienta a tu cliente',
  emoji: '💈',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las frases que usas justo después del saludo: '
      'invitar al cliente a sentarse, presentarte y preguntar su nombre. '
      'Así rompes el hielo y empiezas con el pie derecho.',
  motivacionEs:
      '¡Un barbero que se presenta en inglés genera más confianza '
      'y más propinas! 💵',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso rápido L01 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO L01 ────────────────────────────────────────
    // Repasa 3 palabras de L01 antes de introducir las nuevas
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Good morning · Appointment · Welcome',
      'traduccion_pregunta': 'Buenos días · Cita · Bienvenido',
      'parejas_ingles': ['Good morning', 'Appointment', 'Welcome'],
      'parejas_espanol': ['Buenos días', 'Cita', 'Bienvenido'],
      'contexto_es': '¿Recuerdas la lección anterior?',
    },

    // ── EJ 02 · COMPLETAR REPASO L01 ──────────────────────────────────────
    // Opciones: SOLO partes de las 5 palabras de L01 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ morning, I have an appointment',
      'traduccion_pregunta': 'Buenos días, tengo una cita',
      'respuesta_correcta': 'Good',
      'opciones': ['Good', 'Come', 'Of', 'Welcome'],
      'contexto_es': 'El saludo que ya conoces de L01',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L01 ──────────────────────────────────
    // Frase completa de L01 — solo palabras enseñadas ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia tu respuesta de L01 — calienta la voz',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Come in, welcome',
      'respuesta_correcta': 'Of course! Come in, welcome',
      'fonetica': '[ of KORS, kom IN, WEL-kom ]',
      'traduccion_pregunta': '¡Claro! Pase, bienvenido',
      'contexto_es': 'La frase que ya dominaste en L01',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L02 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Sit down" ─────────────────────────────────
    // Palabras nuevas: Sit down
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta expresión',
      'quien_habla': 'Tú le dices',
      'frase': 'Sit down',
      'fonetica': '[ SIT daun ]',
      'traduccion_pregunta': 'Siéntate',
      'contexto_es': 'Invitas al cliente a sentarse en tu silla',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Sit down" ───────────────────────────────
    // Disponibles L02: Sit down
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Sit down',
      'respuesta_correcta': 'Sit down',
      'fonetica': '[ SIT daun ]',
      'traduccion_pregunta': 'Siéntate',
      'contexto_es': 'Pronuncia con energía y seguridad',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "My name is" ───────────────────────────────
    // Palabras nuevas: My name is
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo te presentas',
      'quien_habla': 'Tú le dices',
      'frase': 'My name is',
      'fonetica': '[ mai NEIM is ]',
      'traduccion_pregunta': 'Me llamo',
      'contexto_es': 'Te presentas con tu cliente por primera vez',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "My name is" ─────────────────────────────
    // Disponibles L02: Sit down · My name is
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'My name is',
      'respuesta_correcta': 'My name is',
      'fonetica': '[ mai NEIM is ]',
      'traduccion_pregunta': 'Me llamo',
      'contexto_es': 'Di tu nombre después — "My name is Junior"',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "What's your name" ─────────────────────────
    // Palabras nuevas: What's your name
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo preguntas el nombre',
      'quien_habla': 'Tú le dices',
      'frase': "What's your name",
      'fonetica': '[ wots ior NEIM ]',
      'traduccion_pregunta': '¿Cómo te llamas?',
      'contexto_es': 'Preguntas el nombre de tu cliente',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "What's your name" ───────────────────────
    // Disponibles L02: Sit down · My name is · What's your name
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': "What's your name",
      'respuesta_correcta': "What's your name",
      'fonetica': '[ wots ior NEIM ]',
      'traduccion_pregunta': '¿Cómo te llamas?',
      'contexto_es': 'Hazlo sonar amigable, no formal',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L02: Sit down · My name is · What's your name
    // Opciones: partes de las 4 expresiones L02 ya enseñadas ✓
    {
      'tipo': 'completar',
      'instruccion': 'Pregunta el nombre al cliente',
      'quien_habla': 'Tú le dices',
      'frase': "___ your name?",
      'traduccion_pregunta': '¿Cuál es tu nombre?',
      'respuesta_correcta': "What's",
      'opciones': ["What's", 'My', 'Sit', 'Nice'],
      'contexto_es': 'Preguntas el nombre al cliente',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Nice to meet you" ─────────────────────────
    // Palabras nuevas: Nice to meet you
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta frase de cortesía',
      'quien_habla': 'Tú le dices',
      'frase': 'Nice to meet you',
      'fonetica': '[ nais tu miit IU ]',
      'traduccion_pregunta': 'Mucho gusto',
      'contexto_es': 'Cuando el cliente te dice su nombre',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Nice to meet you" ───────────────────────
    // Disponibles L02: Sit down · My name is · What's your name · Nice to meet you
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Nice to meet you',
      'respuesta_correcta': 'Nice to meet you',
      'fonetica': '[ nais tu miit IU ]',
      'traduccion_pregunta': 'Mucho gusto',
      'contexto_es': 'Suena cálido — le hace sentir especial al cliente',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Take a seat" ──────────────────────────────
    // Palabras nuevas: Take a seat
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta invitación',
      'quien_habla': 'Tú le dices',
      'frase': 'Take a seat',
      'fonetica': '[ teik a SIIT ]',
      'traduccion_pregunta': 'Tome asiento',
      'contexto_es': 'Le indicas la silla al cliente',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Take a seat" ────────────────────────────
    // Disponibles L02: las 5 nuevas
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Take a seat',
      'respuesta_correcta': 'Take a seat',
      'fonetica': '[ teik a SIIT ]',
      'traduccion_pregunta': 'Tome asiento',
      'contexto_es': 'Señala la silla mientras lo dices — eso ayuda',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L02 ───────────────────────────────
    // Las 5 palabras nuevas de L02 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase':
          'Sit down · My name is · What\'s your name · Nice to meet you · Take a seat',
      'traduccion_pregunta':
          'Siéntate · Me llamo · ¿Cómo te llamas? · Mucho gusto · Tome asiento',
      'parejas_ingles': [
        'Sit down',
        'My name is',
        "What's your name",
        'Nice to meet you',
        'Take a seat',
      ],
      'parejas_espanol': [
        'Siéntate',
        'Me llamo',
        '¿Cómo te llamas?',
        'Mucho gusto',
        'Tome asiento',
      ],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Frase y opciones usan SOLO palabras de L02 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa tu presentación',
      'quien_habla': 'Tú le dices',
      'frase': 'My name is Junior, ___ a seat',
      'traduccion_pregunta': 'Me llamo Junior, toma asiento',
      'respuesta_correcta': 'take',
      'opciones': ['take', 'sit', 'nice', "what's"],
      'contexto_es': 'Te presentas e invitas al cliente a sentarse',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Chips: partes de "What's your name" (L02) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la pregunta para tu cliente',
      'quien_habla': 'Tú le dices',
      'frase': "What's your name?",
      'traduccion_pregunta': '¿Cómo te llamas?',
      'palabras': ["What's", 'your', 'name', '?'],
      'respuesta_correcta': "What's your name ?",
      'contexto_es': 'Así preguntas el nombre',
    },

    // ── EJ 18 · ORDENAR con REPASO L01 ────────────────────────────────────
    // Combina L01 (Good morning · come in) + L02 (take a seat) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena el saludo completo con lo nuevo de hoy',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning, come in, take a seat',
      'traduccion_pregunta': 'Buenos días, pase, tome asiento',
      'palabras': ['Good', 'morning', 'come', 'in', 'take', 'a', 'seat'],
      'respuesta_correcta': 'Good morning come in take a seat',
      'contexto_es': 'Combinas L01 y L02 — así hablas ya como un pro',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase larga ──────────────────────────────
    // L02: My name is + What's your name
    // "Junior" es el nombre propio del barbero — no es vocabulario nuevo
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia tu presentación completa',
      'quien_habla': 'Tú le dices',
      'frase': "My name is Junior, what's your name?",
      'respuesta_correcta': "My name is Junior, what's your name?",
      'fonetica': '[ mai NEIM is Junior, wots ior NEIM ]',
      'traduccion_pregunta': 'Me llamo Junior, ¿cómo te llamas?',
      'contexto_es': 'La frase más importante para conectar con tu cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Integra L01 + L02 — opciones usan SOLO palabras de L01 y L02 ✓
    // Respuesta correcta: Of course (L01) + Come in (L01) + Take a seat (L02)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente entra — recíbelo con todo lo que aprendiste',
      'quien_habla': '¡Ya puedes presentarte! 🏆',
      'frase': 'Good morning! Appointment, please',
      'traduccion_pregunta': 'Buenos días, cita, por favor',
      'cliente_dice': 'Good morning! Appointment, please',
      'traduccion_cliente': 'Buenos días, cita, por favor',
      'respuesta_correcta': 'Of course! Come in, take a seat',
      'traduccion_respuesta': '¡Claro! Pase, tome asiento',
      'opciones_barbero': [
        'Of course! Come in, take a seat',
        'My name is, sit down',
        'Welcome, what\'s your name',
        'Nice to meet you, appointment',
      ],
      'contexto_es':
          'Of course (L01) + Come in (L01) + Take a seat (L02) — '
          '¡ya combinas las dos lecciones!',
    },

  ],
);
