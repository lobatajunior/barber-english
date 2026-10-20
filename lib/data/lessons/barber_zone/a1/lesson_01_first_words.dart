import '../../../../models/lesson.dart';

// BARBER ZONE · L01 — First Words (Bloque 1 · Conversación 2, corte clásico)
//
// Palabras NUEVAS L01 (8):
//   1. Hello        [ je-LOU ]
//   2. Welcome      [ WEL-kom ]
//   3. Come in      [ kom IN ]
//   4. Appointment  [ a-POINT-ment ]
//   5. Do you have  [ du iu jav ]
//   6. No problem   [ nou PROB-lem ]
//   7. Please wait  [ plis UEIT ]
//   8. Right now    [ rrait NAU ]
//
// Repaso obligatorio: estas 8 palabras deben aparecer en L02, L03 y L04.
// Sin completar (empieza en L03). Opciones siempre con 3 alternativas.

const lesson01FirstWords = Lesson(
  id: 1,
  title: 'First Words',
  description: 'Recibe al cliente y pregúntale por su cita',
  emoji: '👋',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las 8 palabras que usas cuando un cliente entra a tu '
      'barbería: saludarlo, darle la bienvenida, preguntarle si tiene cita '
      'y pedirle que espere si no la tiene.',
  motivacionEs:
      '¡Con estas 8 palabras ya puedes recibir a tu primer cliente en inglés! 💈',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Hello · Welcome · Come in
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Hello, Welcome, Come in',
      'respuesta_correcta': 'Hello, Welcome, Come in',
      'fonetica': '[ je-LOU · WEL-kom · kom IN ]',
      'traduccion_pregunta': 'Hola · Bienvenido · Entra / Pasa',
      'contexto_es': 'Lo primero que dices cuando entra un cliente',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Appointment · Do you have · No problem
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Appointment, Do you have, No problem',
      'respuesta_correcta': 'Appointment, Do you have, No problem',
      'fonetica': '[ a-POINT-ment · du iu jav · nou PROB-lem ]',
      'traduccion_pregunta': 'Cita · ¿Tiene usted? · No hay problema',
      'contexto_es': 'Para preguntar por la cita del cliente',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: Hello · Welcome · Come in · Appointment · Do you have · No problem
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Hello', 'Welcome', 'Come in', 'Appointment'],
      'parejas_espanol': ['Hola', 'Bienvenido', 'Entra', 'Cita'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Please wait · Right now
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Please wait, Right now',
      'respuesta_correcta': 'Please wait, Right now',
      'fonetica': '[ plis UEIT · rrait NAU ]',
      'traduccion_pregunta': 'Por favor espera · Ahora mismo',
      'contexto_es': 'Cuando el cliente tiene que esperar su turno',
    },

    // ── EJ 05 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 8 palabras
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Appointment', 'Do you have', 'No problem', 'Please wait'],
      'parejas_espanol': ['Cita', '¿Tiene usted?', 'No hay problema', 'Por favor espera'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 06 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la traducción correcta',
      'quien_habla': 'Practica',
      'pregunta': '¿Qué significa "No problem"?',
      'respuesta_correcta': 'No hay problema',
      'opciones': ['No hay problema', 'Por favor espera', 'Ahora mismo'],
      'contexto_es': 'Lo dices para tranquilizar al cliente',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Hello! Welcome. Come in.',
      'respuesta_correcta': 'Hello! Welcome. Come in.',
      'fonetica': '[ je-LOU · WEL-kom · kom IN ]',
      'traduccion_pregunta': 'Hola, bienvenido, entra.',
      'contexto_es': 'Así recibes al cliente en la puerta',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment?',
      'respuesta_correcta': 'Do you have an appointment?',
      'fonetica': '[ du iu jav an a-POINT-ment ]',
      'traduccion_pregunta': '¿Tiene usted una cita?',
      'contexto_es': 'La pregunta clave cuando entra un cliente',
    },

    // ── EJ 09 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'Un cliente entra. ¿Qué le dices?',
      'respuesta_correcta': 'Hello! Welcome. Come in.',
      'opciones': [
        'Hello! Welcome. Come in.',
        'Please wait right now.',
        'Do you have no problem?',
      ],
      'contexto_es': 'El saludo completo para recibir al cliente',
    },

    // ── EJ 10 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena el saludo',
      'quien_habla': 'Tú le dices',
      'frase': 'Hello! Welcome. Come in.',
      'traduccion_pregunta': 'Hola, bienvenido, entra.',
      'palabras': ['Welcome', 'Hello', 'in', 'Come'],
      'respuesta_correcta': 'Hello Welcome Come in',
      'contexto_es': 'Primero saludas, luego das la bienvenida',
    },

    // ── EJ 11 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Please wait.',
      'respuesta_correcta': 'No problem! Please wait.',
      'fonetica': '[ nou PROB-lem · plis UEIT ]',
      'traduccion_pregunta': 'No hay problema, por favor espera.',
      'contexto_es': 'Cuando el cliente no tiene cita',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente no tiene cita. ¿Qué respondes?',
      'respuesta_correcta': 'No problem! Please wait.',
      'opciones': [
        'No problem! Please wait.',
        'Hello! Come in right now.',
        'Do you have an appointment?',
      ],
      'contexto_es': 'Tranquilízalo y pídele que espere',
    },

    // ── EJ 13 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment?',
      'traduccion_pregunta': '¿Tiene usted una cita?',
      'palabras': ['have', 'Do', 'appointment', 'you', 'an'],
      'respuesta_correcta': 'Do you have an appointment',
      'contexto_es': 'Do you have + an appointment',
    },

    // ── EJ 14 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment right now?',
      'respuesta_correcta': 'Do you have an appointment right now?',
      'fonetica': '[ du iu jav an a-POINT-ment rrait NAU ]',
      'traduccion_pregunta': '¿Tiene cita ahora mismo?',
      'contexto_es': 'Right now = ahora mismo',
    },

    // ── EJ 15 · OPCIONES (antes completar: completar empieza en L03) ──────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la traducción correcta',
      'quien_habla': 'Practica',
      'pregunta': '¿Qué significa "Please wait"?',
      'respuesta_correcta': 'Por favor espera',
      'opciones': ['Por favor espera', 'Ahora mismo', 'No hay problema'],
      'contexto_es': 'Lo dices cuando el cliente tiene que esperar',
    },

    // ── EJ 16 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo preguntas si el cliente tiene cita?',
      'respuesta_correcta': 'Do you have an appointment?',
      'opciones': [
        'Do you have an appointment?',
        'Please wait right now.',
        'Hello! Come in!',
      ],
      'contexto_es': 'Do you have = ¿Tiene usted?',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Please wait right now.',
      'traduccion_pregunta': 'Por favor espera ahora mismo.',
      'palabras': ['now', 'right', 'wait', 'Please'],
      'respuesta_correcta': 'Please wait right now',
      'contexto_es': 'Please wait + right now',
    },

    // ── EJ 18 · OPCIONES (antes completar: completar empieza en L03) ──────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la frase correcta',
      'quien_habla': 'Practica',
      'pregunta': '¿Cuál es la pregunta correcta?',
      'respuesta_correcta': 'Do you have an appointment?',
      'opciones': [
        'Do you have an appointment?',
        'Do you have right now?',
        'Please wait an appointment?',
      ],
      'contexto_es': 'Do you have + an appointment',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el diálogo completo',
      'quien_habla': 'Tú le dices',
      'frase': 'Hello! Do you have an appointment right now? No problem! Please wait.',
      'respuesta_correcta':
          'Hello! Do you have an appointment right now? No problem! Please wait.',
      'fonetica': '[ je-LOU · du iu jav · nou PROB-lem · plis UEIT ]',
      'traduccion_pregunta':
          'Hola, ¿tiene cita ahora mismo? No hay problema, espere.',
      'contexto_es': 'Todo lo que aprendiste hoy en una sola conversación',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente entra — ¿qué le respondes?',
      'quien_habla': '¡Tu primer cliente! 🏆',
      'frase': 'Hello!',
      'traduccion_pregunta': '¡Hola!',
      'cliente_dice': 'Hello!',
      'traduccion_cliente': '¡Hola!',
      'respuesta_correcta': 'Welcome! Come in.',
      'traduccion_respuesta': '¡Bienvenido! Pasa.',
      'opciones_barbero': [
        'Welcome! Come in.',
        'No problem, please wait.',
        'Do you have right now?',
      ],
      'contexto_es': 'Welcome + Come in — la bienvenida perfecta',
    },

  ],
);
