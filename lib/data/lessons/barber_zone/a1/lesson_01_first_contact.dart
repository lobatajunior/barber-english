import '../../../../models/lesson.dart';

// Palabras enseñadas en esta lección (en orden):
//   1. Good morning  [ gud MOR-ning ]
//   2. Appointment   [ a-POINT-ment ]
//   3. Welcome       [ WEL-kom ]
//   4. Come in       [ kom IN ]
//   5. Of course     [ of KORS ]

const lesson01FirstContact = Lesson(
  id: 1,
  title: 'First Contact',
  description: 'Saluda y recibe a tu primer cliente',
  emoji: '🤝',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las 5 frases que usas en los primeros 30 segundos '
      'con cada cliente: saludar, confirmar la cita y darle la bienvenida. '
      'Son las palabras que tu cliente escucha nada más cruzar la puerta.',
  motivacionEs:
      '¡Un buen saludo en inglés puede ser la diferencia '
      'entre un cliente nuevo y un cliente fijo! 💈',
  exercises: [

    // ── EJ 01 · ESCUCHAR ─ "Good morning" ────────────────────────────────────
    // Palabras nuevas: Good morning
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo suena esta expresión',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning',
      'fonetica': '[ gud MOR-ning ]',
      'traduccion_pregunta': 'Buenos días',
      'contexto_es': 'Así saludas cuando entra tu primer cliente del día',
      'es_palabra_nueva': true,
    },

    // ── EJ 02 · PRONUNCIACIÓN ─ "Good morning" ───────────────────────────────
    // Disponibles: Good morning
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repite tú en voz alta',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning',
      'respuesta_correcta': 'Good morning',
      'fonetica': '[ gud MOR-ning ]',
      'traduccion_pregunta': 'Buenos días',
      'contexto_es': 'Repite hasta que suene natural',
    },

    // ── EJ 03 · ESCUCHAR ─ "Appointment" ─────────────────────────────────────
    // Palabras nuevas: Appointment
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra clave',
      'quien_habla': 'El cliente dice',
      'frase': 'Appointment',
      'fonetica': '[ a-POINT-ment ]',
      'traduccion_pregunta': 'Cita',
      'contexto_es': 'Lo que tiene el cliente cuando reservó contigo',
      'es_palabra_nueva': true,
    },

    // ── EJ 04 · PRONUNCIACIÓN ─ "Appointment" ────────────────────────────────
    // Disponibles: Good morning · Appointment
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora pronúnciala tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Appointment',
      'respuesta_correcta': 'Appointment',
      'fonetica': '[ a-POINT-ment ]',
      'traduccion_pregunta': 'Cita',
      'contexto_es': 'La palabra más importante de tu barbería',
    },

    // ── EJ 05 · PAREJAS ───────────────────────────────────────────────────────
    // Disponibles: Good morning · Appointment
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Good morning · Appointment',
      'traduccion_pregunta': 'Buenos días · Cita',
      'parejas_ingles': ['Good morning', 'Appointment'],
      'parejas_espanol': ['Buenos días', 'Cita'],
      'contexto_es': '¿Ya las recuerdas?',
    },

    // ── EJ 06 · ESCUCHAR ─ "Welcome" ─────────────────────────────────────────
    // Palabras nuevas: Welcome
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra de bienvenida',
      'quien_habla': 'Tú le dices',
      'frase': 'Welcome',
      'fonetica': '[ WEL-kom ]',
      'traduccion_pregunta': 'Bienvenido',
      'contexto_es': 'Lo primero que siente tu cliente al entrar',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Welcome" ────────────────────────────────────
    // Disponibles: Good morning · Appointment · Welcome
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Welcome',
      'respuesta_correcta': 'Welcome',
      'fonetica': '[ WEL-kom ]',
      'traduccion_pregunta': 'Bienvenido',
      'contexto_es': 'Hazlo sonar cálido y profesional',
    },

    // ── EJ 08 · ESCUCHAR ─ "Come in" ─────────────────────────────────────────
    // Palabras nuevas: Come in
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo invitas al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Come in',
      'fonetica': '[ kom IN ]',
      'traduccion_pregunta': 'Pase / Entra',
      'contexto_es': 'Invitas al cliente a entrar a tu barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Come in" ────────────────────────────────────
    // Disponibles: Good morning · Appointment · Welcome · Come in
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Come in',
      'respuesta_correcta': 'Come in',
      'fonetica': '[ kom IN ]',
      'traduccion_pregunta': 'Pase / Entra',
      'contexto_es': 'Muy usada cuando abres la puerta',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────────
    // Disponibles: Good morning · Appointment · Welcome · Come in
    // Todas las opciones son partes de las 5 palabras enseñadas ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Good ___, I have an appointment',
      'traduccion_pregunta': 'Buenos días, tengo una cita',
      'respuesta_correcta': 'morning',
      'opciones': ['morning', 'appointment', 'welcome', 'course'],
      'contexto_es': 'El cliente entra y te dice esto',
    },

    // ── EJ 11 · ESCUCHAR ─ "Of course" ───────────────────────────────────────
    // Palabras nuevas: Of course
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta frase de confirmación',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course',
      'fonetica': '[ of KORS ]',
      'traduccion_pregunta': 'Claro / Por supuesto',
      'contexto_es': 'Confirmas que tienes la cita del cliente',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Of course" ──────────────────────────────────
    // Disponibles: Good morning · Appointment · Welcome · Come in · Of course
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course',
      'respuesta_correcta': 'Of course',
      'fonetica': '[ of KORS ]',
      'traduccion_pregunta': 'Claro / Por supuesto',
      'contexto_es': 'Suena seguro y profesional',
    },

    // ── EJ 13 · COMPLETAR ─────────────────────────────────────────────────────
    // Disponibles: Good morning · Appointment · Welcome · Come in · Of course
    // Todas las opciones son palabras enseñadas ✓
    {
      'tipo': 'completar',
      'instruccion': 'Elige la respuesta correcta del barbero',
      'quien_habla': 'Tú le dices',
      'frase': '___ ! Come in, welcome',
      'traduccion_pregunta': '¡Claro! Pase, bienvenido',
      'respuesta_correcta': 'Of course',
      'opciones': ['Of course', 'Good morning', 'Appointment', 'Come in'],
      'contexto_es': 'Así respondes cuando confirmas la cita',
    },

    // ── EJ 14 · PAREJAS (repaso total) ────────────────────────────────────────
    // Las 5 palabras de la lección
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Good morning · Appointment · Welcome · Come in · Of course',
      'traduccion_pregunta': 'Buenos días · Cita · Bienvenido · Pase · Claro',
      'parejas_ingles': [
        'Good morning',
        'Appointment',
        'Welcome',
        'Come in',
        'Of course',
      ],
      'parejas_espanol': [
        'Buenos días',
        'Cita',
        'Bienvenido',
        'Pase',
        'Claro',
      ],
      'contexto_es': 'Repaso de todo lo aprendido',
    },

    // ── EJ 15 · ORDENAR ───────────────────────────────────────────────────────
    // Solo palabras enseñadas: Good morning · Come in · Welcome ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena el saludo completo del barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning, come in, welcome',
      'traduccion_pregunta': 'Buenos días, pase, bienvenido',
      'palabras': ['Good', 'morning', 'come', 'in', 'welcome'],
      'respuesta_correcta': 'Good morning come in welcome',
      'contexto_es': 'Tres de las cinco palabras de hoy en una sola frase',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─ frase completa ───────────────────────────────
    // Of course · Come in · Welcome — solo palabras enseñadas ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia tu respuesta completa al confirmar la cita',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course, come in, welcome',
      'respuesta_correcta': 'Of course, come in, welcome',
      'fonetica': '[ of KORS, kom IN, WEL-kom ]',
      'traduccion_pregunta': 'Claro, pase, bienvenido',
      'contexto_es': 'Las tres palabras clave de tu respuesta al cliente',
    },

    // ── EJ 17 · PRONUNCIACIÓN ─ frase profesional ────────────────────────────
    // Of course + Welcome (enseñadas) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia esta respuesta profesional',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Welcome!',
      'respuesta_correcta': 'Of course! Welcome!',
      'fonetica': '[ of KORS, WEL-kom ]',
      'traduccion_pregunta': '¡Claro! ¡Bienvenido!',
      'contexto_es': 'Así suenas profesional y cálido a la vez',
    },

    // ── EJ 18 · COMPLETAR ─────────────────────────────────────────────────────
    // Testa "welcome" — frase y opciones usan SOLO palabras enseñadas ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa el saludo del barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Of course, come in, ___!',
      'traduccion_pregunta': '¡Buenos días! ¡Claro, pase, bienvenido!',
      'respuesta_correcta': 'welcome',
      'opciones': ['welcome', 'appointment', 'Of course', 'morning'],
      'contexto_es': 'Tu respuesta completa — las 5 palabras de hoy en acción',
    },

    // ── EJ 19 · ORDENAR ───────────────────────────────────────────────────────
    // Of course + Come in + Welcome — las 3 palabras de la respuesta del barbero
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma tu respuesta como barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course come in welcome',
      'traduccion_pregunta': 'Claro, pase, bienvenido',
      'palabras': ['Of', 'course', 'come', 'in', 'welcome'],
      'respuesta_correcta': 'Of course come in welcome',
      'contexto_es': 'Tu respuesta completa al cliente',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────────
    // Todas las opciones usan SOLO palabras enseñadas en esta lección ✓
    {
      'tipo': 'dialogo',
      'instruccion': 'Completa la conversación usando todo lo que aprendiste hoy',
      'quien_habla': '¡Tu primer cliente real! 🏆',
      'frase': 'Good morning! Appointment, please',
      'traduccion_pregunta': 'Buenos días, cita, por favor',
      'cliente_dice': 'Good morning! Appointment, please',
      'traduccion_cliente': 'Buenos días, cita, por favor',
      'respuesta_correcta': 'Of course! Come in, welcome',
      'traduccion_respuesta': '¡Claro! Pase, bienvenido',
      'opciones_barbero': [
        'Of course! Come in, welcome',
        'Good morning, appointment',
        'Welcome, of course',
        'Come in, good morning',
      ],
      'contexto_es':
          'Of course + Come in + Welcome — '
          'las 3 palabras perfectas para recibir a tu cliente',
    },

  ],
);
