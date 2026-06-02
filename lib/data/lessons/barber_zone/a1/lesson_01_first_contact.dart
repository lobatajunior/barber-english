import '../../../../models/lesson.dart';

const lesson01FirstContact = Lesson(
  id: 1,
  title: 'First Contact',
  description: 'Saluda, confirma la cita y sienta al cliente',
  emoji: '🤝',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las frases que usas en los primeros 2 minutos con cada cliente: '
      'saludar, confirmar su cita y guiarlo a tu silla. '
      'Son las palabras que tu cliente escucha nada más cruzar la puerta.',
  motivacionEs:
      '¡Un buen saludo en inglés puede ser la diferencia entre un cliente nuevo y un cliente fijo! 💈',
  exercises: [
    // ── 1 · ESCUCHAR ─ "Good morning" ───────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo suena esta expresión',
      'quien_habla': 'Tú le dices al cliente',
      'frase': 'Good morning',
      'fonetica': '[ gud MOR-ning ]',
      'traduccion_pregunta': 'Buenos días',
      'contexto_es': 'Así saludas cuando entra tu primer cliente del día',
    },

    // ── 2 · PRONUNCIACIÓN ─ "Good morning" ──────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repite tú en voz alta',
      'quien_habla': 'Tú le dices al cliente',
      'frase': 'Good morning',
      'respuesta_correcta': 'Good morning',
      'fonetica': '[ gud MOR-ning ]',
      'traduccion_pregunta': 'Buenos días',
      'contexto_es': 'Repite hasta que suene natural',
    },

    // ── 3 · ESCUCHAR ─ "appointment" ────────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra clave',
      'quien_habla': 'El cliente dice',
      'frase': 'appointment',
      'fonetica': '[ a-POINT-ment ]',
      'traduccion_pregunta': 'cita',
      'contexto_es': 'La palabra más importante de tu barbería',
    },

    // ── 4 · PRONUNCIACIÓN ─ "appointment" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora pronúnciala tú',
      'quien_habla': 'El cliente dice',
      'frase': 'appointment',
      'respuesta_correcta': 'appointment',
      'fonetica': '[ a-POINT-ment ]',
      'traduccion_pregunta': 'cita',
      'contexto_es': 'Escúchala bien antes de pronunciarla',
    },

    // ── 5 · PAREJAS ─────────────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su significado',
      'quien_habla': 'Practica',
      'frase': 'Good morning · appointment · welcome',
      'traduccion_pregunta': 'Buenos días · cita · bienvenido',
      'parejas_ingles': ['Good morning', 'appointment', 'welcome'],
      'parejas_espanol': ['Buenos días', 'cita', 'bienvenido'],
      'contexto_es':
          'Estas tres palabras son la base del primer contacto con tu cliente',
    },

    // ── 6 · ESCUCHAR ─ "I have an appointment" ──────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la frase completa',
      'quien_habla': 'El cliente dice',
      'frase': 'I have an appointment',
      'fonetica': '[ ai JAV an a-POINT-ment ]',
      'traduccion_pregunta': 'Tengo una cita',
      'contexto_es': 'Lo primero que te dice tu cliente al entrar',
    },

    // ── 7 · PRONUNCIACIÓN ─ "I have an appointment" ─────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora pronuncia la frase completa',
      'quien_habla': 'El cliente dice',
      'frase': 'I have an appointment',
      'respuesta_correcta': 'I have an appointment',
      'fonetica': '[ ai JAV an a-POINT-ment ]',
      'traduccion_pregunta': 'Tengo una cita',
      'contexto_es': 'Practica hasta sentirte seguro',
    },

    // ── 8 · COMPLETAR ────────────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Good ___, I have an appointment with you.',
      'traduccion_pregunta': 'Buenos días, tengo una cita contigo.',
      'respuesta_correcta': 'morning',
      'opciones': ['morning', 'night', 'day', 'evening'],
      'contexto_es': 'El cliente entra y te dice esto',
    },

    // ── 9 · ORDENAR ──────────────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena las palabras para formar la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'I have an appointment with you.',
      'traduccion_pregunta': 'Tengo una cita contigo.',
      'palabras': ['I', 'have', 'an', 'appointment', 'with', 'you.'],
      'respuesta_correcta': 'I have an appointment with you.',
      'contexto_es': 'Forma la frase completa',
    },

    // ── 10 · DIÁLOGO FINAL ──────────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente entra — ¿qué le respondes?',
      'quien_habla': '¡Primer cliente real!',
      'frase': 'Good morning! I have an appointment.',
      'traduccion_pregunta': '¡Buenos días! Tengo una cita.',
      'cliente_dice': 'Good morning! I have an appointment.',
      'traduccion_cliente': '¡Buenos días! Tengo una cita.',
      'respuesta_correcta': 'Of course! Come in, please.',
      'traduccion_respuesta': '¡Claro! Pase, por favor.',
      'opciones_barbero': [
        'Of course! Come in, please.',
        'Sorry, I am busy right now.',
        'See you tomorrow, thanks!',
        'What do you want today?',
      ],
      'contexto_es':
          'Usa todo lo que aprendiste en esta lección para responder al cliente',
    },
  ],
);
