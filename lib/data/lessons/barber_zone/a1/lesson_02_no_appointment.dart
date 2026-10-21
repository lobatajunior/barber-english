import '../../../../models/lesson.dart';

// BARBER ZONE · L02 — No Appointment (Bloque 1 · Conversación 2, corte clásico)
//
// Palabras NUEVAS L02 (8):
//   1. Let me check    [ let mi CHEK ]
//   2. Minutes         [ MI-nets ]
//   3. Have a seat     [ jav a SIIT ]
//   4. Would you like  [ wud iu LAIK ]
//   5. Water           [ WO-ter ]
//   6. Coffee          [ KO-fi ]
//   7. Thank you       [ ZANK iu ]
//   8. Of course       [ of KORS ]
//
// Repaso L01: Hello · Welcome · Come in · Appointment · Do you have
//             No problem · Please wait · Right now
// Repaso obligatorio: las 8 palabras nuevas deben aparecer en L03, L04 y L05.
// Sin cifras ("30 minutos" de la Conv. 2 → "Please wait.").

const lesson02NoAppointment = Lesson(
  id: 2,
  title: 'No Appointment',
  description: 'Atiende al cliente que llega sin cita',
  emoji: '⏳',
  level: Level.A1,
  descripcionEs:
      'Un cliente llega sin cita. Aprenderás a revisar la agenda, pedirle '
      'que espere, ofrecerle asiento y algo de tomar mientras tanto.',
  motivacionEs:
      '¡Un cliente sin cita también es un cliente! Trátalo como en casa. ☕',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Let me check · Minutes · Have a seat
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Let me check, Minutes, Have a seat',
      'respuesta_correcta': 'Let me check, Minutes, Have a seat',
      'fonetica': '[ let mi CHEK · MI-nets · jav a SIIT ]',
      'traduccion_pregunta': 'Déjame revisar · Minutos · Toma asiento',
      'contexto_es': 'Cuando el cliente llega sin cita',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Would you like · Water · Coffee
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Would you like, Water, Coffee',
      'respuesta_correcta': 'Would you like, Water, Coffee',
      'fonetica': '[ wud iu LAIK · WO-ter · KO-fi ]',
      'traduccion_pregunta': '¿Te gustaría? · Agua · Café',
      'contexto_es': 'Para ofrecerle algo mientras espera',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: Let me check · Minutes · Have a seat · Would you like · Water · Coffee
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Let me check', 'Minutes', 'Have a seat', 'Would you like'],
      'parejas_espanol': ['Déjame revisar', 'Minutos', 'Toma asiento', '¿Te gustaría?'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Thank you · Of course
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Thank you, Of course',
      'respuesta_correcta': 'Thank you, Of course',
      'fonetica': '[ ZANK iu · of KORS ]',
      'traduccion_pregunta': 'Gracias · Por supuesto',
      'contexto_es': 'Para agradecer y responder con amabilidad',
    },

    // ── EJ 05 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 8 palabras
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Water', 'Coffee', 'Thank you', 'Of course'],
      'parejas_espanol': ['Agua', 'Café', 'Gracias', 'Por supuesto'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 06 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'Un cliente espera. ¿Qué le ofreces?',
      'respuesta_correcta': 'Would you like water or coffee?',
      'opciones': [
        'Would you like water or coffee?',
        'Do you have an appointment?',
        'Hello! Come in.',
      ],
      'contexto_es': 'Ofrécele algo de tomar mientras espera',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Let me check. Please wait.',
      'respuesta_correcta': 'Let me check. Please wait.',
      'fonetica': '[ let mi CHEK · plis UEIT ]',
      'traduccion_pregunta': 'Déjame revisar. Por favor espera.',
      'contexto_es': 'Revisas la agenda antes de responder',
    },

    // ── EJ 08 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like water or coffee?',
      'respuesta_correcta': 'Would you like water or coffee?',
      'fonetica': '[ wud iu LAIK WO-ter or KO-fi ]',
      'traduccion_pregunta': '¿Te gustaría agua o café?',
      'contexto_es': 'Would you like = ¿Te gustaría?',
    },

    // ── EJ 09 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Toma asiento"?',
      'traduccion_pregunta': 'Toma asiento',
      'respuesta_correcta': 'Have a seat',
      'opciones': ['Have a seat', 'Let me check', 'Thank you'],
      'contexto_es': 'Lo dices cuando el cliente va a esperar',
    },

    // ── EJ 10 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Let me check.',
      'traduccion_pregunta': 'Déjame revisar.',
      'palabras': ['check', 'Let', 'me'],
      'respuesta_correcta': 'Let me check',
      'contexto_es': 'Let me + check',
    },

    // ── EJ 11 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Have a seat. Would you like coffee?',
      'respuesta_correcta': 'Have a seat. Would you like coffee?',
      'fonetica': '[ jav a SIIT · wud iu LAIK KO-fi ]',
      'traduccion_pregunta': 'Toma asiento. ¿Te gustaría café?',
      'contexto_es': 'Lo sientas y le ofreces algo',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente acepta esperar. ¿Qué le dices?',
      'respuesta_correcta': 'Have a seat. Would you like water or coffee?',
      'opciones': [
        'Have a seat. Would you like water or coffee?',
        'No problem! Come in right now.',
        'Do you have an appointment?',
      ],
      'contexto_es': 'Asiento + algo de tomar',
    },

    // ── EJ 13 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Have a seat.',
      'traduccion_pregunta': 'Toma asiento.',
      'palabras': ['seat', 'Have', 'a'],
      'respuesta_correcta': 'Have a seat',
      'contexto_es': 'Have + a + seat',
    },

    // ── EJ 14 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Thank you! Of course.',
      'respuesta_correcta': 'Thank you! Of course.',
      'fonetica': '[ ZANK iu · of KORS ]',
      'traduccion_pregunta': '¡Gracias! Por supuesto.',
      'contexto_es': 'Agradeces y confirmas con amabilidad',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Por supuesto"?',
      'traduccion_pregunta': 'Por supuesto',
      'respuesta_correcta': 'Of course',
      'opciones': ['Of course', 'Thank you', 'Let me check'],
      'contexto_es': 'Para responder que sí con seguridad',
    },

    // ── EJ 16 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like coffee?',
      'traduccion_pregunta': '¿Te gustaría café?',
      'palabras': ['you', 'like', 'Would', 'coffee'],
      'respuesta_correcta': 'Would you like coffee',
      'contexto_es': 'Would you like + coffee',
    },

    // ── EJ 17 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia todo seguido',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Let me check. Please wait. Have a seat.',
      'respuesta_correcta': 'No problem! Let me check. Please wait. Have a seat.',
      'fonetica': '[ nou PROB-lem · let mi CHEK · plis UEIT · jav a SIIT ]',
      'traduccion_pregunta':
          'No hay problema. Déjame revisar. Por favor espera. Toma asiento.',
      'contexto_es': 'Tu respuesta completa al cliente sin cita',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige el orden correcto',
      'quien_habla': 'Practica',
      'pregunta': '¿Cuál es la secuencia correcta?',
      'respuesta_correcta': 'Let me check → Please wait → Have a seat',
      'opciones': [
        'Let me check → Please wait → Have a seat',
        'Have a seat → Let me check → Come in',
        'Would you like → No problem → Minutes',
      ],
      'contexto_es': 'Primero revisas, luego pides que espere y lo sientas',
    },

    // ── EJ 19 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like water or coffee?',
      'traduccion_pregunta': '¿Te gustaría agua o café?',
      'palabras': ['like', 'you', 'water', 'Would', 'or', 'coffee'],
      'respuesta_correcta': 'Would you like water or coffee',
      'contexto_es': 'Would you like + water or coffee',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente no tiene cita — ¿qué le respondes?',
      'quien_habla': '¡Cliente sin cita! 🏆',
      'frase': 'I do not have an appointment.',
      'traduccion_pregunta': 'No tengo cita.',
      'cliente_dice': 'I do not have an appointment.',
      'traduccion_cliente': 'No tengo cita.',
      'respuesta_correcta': 'No problem! Let me check. Please wait.',
      'traduccion_respuesta': '¡No hay problema! Déjame revisar. Por favor espera.',
      'opciones_barbero': [
        'No problem! Let me check. Please wait.',
        'Hello! Welcome. Come in.',
        'Thank you! Of course.',
      ],
      'contexto_es': 'No problem + Let me check + Please wait',
    },

  ],
);
