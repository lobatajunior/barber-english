import '../../../../models/lesson.dart';

// BARBER ZONE · L03 — The Haircut (Bloque 1 · Conversación 2, corte clásico)
//
// Unidades NUEVAS L03 (5):
//   1. How           [ JAU ]
//   2. Your haircut  [ ior JER-kat ]
//   3. Short         [ SHORT ]
//   4. Longer        [ LONG-er ]
//   5. On the sides  [ on de SAIDS ]
//
// Repaso L01: Appointment · Do you have · Welcome · Come in
// Repaso L02: Have a seat · Would you like · Water · Coffee · Thank you
//             Of course · Let me check
// Primer uso de completar (permitido desde L03). Sin "it" ni "What".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L04, L05 y L06.

const lesson03TheHaircut = Lesson(
  id: 3,
  title: 'The Haircut',
  description: 'Pregunta cómo quiere el corte',
  emoji: '✂️',
  level: Level.A1,
  descripcionEs:
      'El cliente ya está en la silla. Aprenderás a preguntarle cómo quiere '
      'su corte y a entender si lo quiere corto, más largo o corto en los lados.',
  motivacionEs:
      '¡Entender lo que pide el cliente es la mitad de un buen corte! ✂️',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: How · Your haircut · Short
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'How, Your haircut, Short',
      'respuesta_correcta': 'How, Your haircut, Short',
      'fonetica': '[ JAU · ior JER-kat · SHORT ]',
      'traduccion_pregunta': 'Cómo · Su corte · Corto',
      'contexto_es': 'Para hablar del corte con el cliente',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Longer · On the sides
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Longer, On the sides',
      'respuesta_correcta': 'Longer, On the sides',
      'fonetica': '[ LONG-er · on de SAIDS ]',
      'traduccion_pregunta': 'Más largo · En los lados',
      'contexto_es': 'Lo que el cliente te pide para su corte',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 5 unidades nuevas
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['How', 'Your haircut', 'Short', 'On the sides'],
      'parejas_espanol': ['Cómo', 'Su corte', 'Corto', 'En los lados'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Have a seat. How would you like your haircut?',
      'respuesta_correcta': 'Have a seat. How would you like your haircut?',
      'fonetica': '[ jav a SIIT · JAU wud iu LAIK ior JER-kat ]',
      'traduccion_pregunta': 'Toma asiento. ¿Cómo le gustaría su corte?',
      'contexto_es': 'How + would you like + your haircut',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente ya está sentado. ¿Qué le preguntas?',
      'respuesta_correcta': 'How would you like your haircut?',
      'opciones': [
        'How would you like your haircut?',
        'Do you have an appointment?',
        'Would you like water or coffee?',
      ],
      'contexto_es': 'Ya está en la silla: pregúntale por su corte',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you like your haircut?',
      'traduccion_pregunta': '¿Cómo le gustaría su corte?',
      'palabras': ['haircut', 'How', 'like', 'would', 'you', 'your'],
      'respuesta_correcta': 'How would you like your haircut',
      'contexto_es': 'How + would you like + your haircut',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Short, please.',
      'respuesta_correcta': 'Short, please.',
      'fonetica': '[ SHORT · plis ]',
      'traduccion_pregunta': 'Corto, por favor.',
      'contexto_es': 'El cliente pide el corte corto',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Más largo"?',
      'traduccion_pregunta': 'Más largo',
      'respuesta_correcta': 'Longer',
      'opciones': ['Longer', 'Short', 'Coffee'],
      'contexto_es': 'Lo contrario de short',
    },

    // ── EJ 09 · PAREJAS (repaso L01 + L02) ────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Appointment', 'Of course', 'Water', 'Let me check'],
      'parejas_espanol': ['Cita', 'Por supuesto', 'Agua', 'Déjame revisar'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, please.',
      'respuesta_correcta': 'Short on the sides, please.',
      'fonetica': '[ SHORT on de SAIDS · plis ]',
      'traduccion_pregunta': 'Corto en los lados, por favor.',
      'contexto_es': 'Short + on the sides',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, please.',
      'traduccion_pregunta': 'Corto en los lados, por favor.',
      'palabras': ['sides', 'Short', 'the', 'on', 'please'],
      'respuesta_correcta': 'Short on the sides please',
      'contexto_es': 'Short + on the sides + please',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Corto en los lados, por favor"?',
      'traduccion_pregunta': 'Corto en los lados, por favor',
      'respuesta_correcta': 'Short on the sides, please.',
      'opciones': [
        'Short on the sides, please.',
        'Longer, please.',
        'Short, please.',
      ],
      'contexto_es': 'On the sides = en los lados',
    },

    // ── EJ 13 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite',
      'quien_habla': 'Tú dices',
      'frase': 'Longer, please, Thank you',
      'respuesta_correcta': 'Longer, please, Thank you',
      'fonetica': '[ LONG-er · plis · ZANK iu ]',
      'traduccion_pregunta': 'Más largo, por favor · Gracias',
      'contexto_es': 'El cliente pide más largo y tú agradeces',
    },

    // ── EJ 14 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you ___ your haircut?',
      'traduccion_pregunta': '¿Cómo le gustaría su corte?',
      'respuesta_correcta': 'like',
      'opciones': ['like', 'check', 'wait'],
      'contexto_es': 'Would you like = ¿le gustaría?',
    },

    // ── EJ 15 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena tu respuesta',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Short on the sides.',
      'traduccion_pregunta': '¡Por supuesto! Corto en los lados.',
      'palabras': ['Of', 'course', 'Short', 'on', 'the', 'sides'],
      'respuesta_correcta': 'Of course Short on the sides',
      'contexto_es': 'Confirmas lo que pide el cliente',
    },

    // ── EJ 16 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite',
      'quien_habla': 'Tú dices',
      'frase': 'Longer, please, Of course',
      'respuesta_correcta': 'Longer, please, Of course',
      'fonetica': '[ LONG-er · plis · of KORS ]',
      'traduccion_pregunta': 'Más largo, por favor · Por supuesto',
      'contexto_es': 'El cliente pide y tú confirmas',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the ___, please.',
      'traduccion_pregunta': 'Corto en los lados, por favor.',
      'respuesta_correcta': 'sides',
      'opciones': ['sides', 'haircut', 'coffee'],
      'contexto_es': 'On the sides = en los lados',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente quiere el corte más largo. ¿Qué dice?',
      'respuesta_correcta': 'Longer, please.',
      'opciones': ['Longer, please.', 'Water, please.', 'Short, please.'],
      'contexto_es': 'Longer = más largo',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! How would you like your haircut?',
      'respuesta_correcta': 'Of course! How would you like your haircut?',
      'fonetica': '[ of KORS · JAU wud iu LAIK ior JER-kat ]',
      'traduccion_pregunta': '¡Por supuesto! ¿Cómo le gustaría su corte?',
      'contexto_es': 'Lo que más vas a decir en tu barbería',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pide su corte — ¿qué le respondes?',
      'quien_habla': '¡Tu cliente en la silla! 🏆',
      'frase': 'Short on the sides, please.',
      'traduccion_pregunta': 'Corto en los lados, por favor.',
      'cliente_dice': 'Short on the sides, please.',
      'traduccion_cliente': 'Corto en los lados, por favor.',
      'respuesta_correcta': 'Of course!',
      'traduccion_respuesta': '¡Por supuesto!',
      'opciones_barbero': [
        'Of course!',
        'Welcome! Come in.',
        'Do you have an appointment?',
      ],
      'contexto_es': 'Confirma con seguridad: Of course!',
    },

  ],
);
