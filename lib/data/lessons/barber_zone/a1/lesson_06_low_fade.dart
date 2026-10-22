import '../../../../models/lesson.dart';

// BARBER ZONE · L06 — Low Fade (Bloque 2 · Conversación 1, corte degradado)
//
// Unidades NUEVAS L06 (5):
//   1. Good morning  [ gud MOR-ning ]
//   2. Fade          [ FEID ]
//   3. Low           [ LOU ]
//   4. Razor         [ REI-zor ]
//   5. Beard         [ BIRD ]
//
// Repaso L01: Welcome · Come in
// Repaso L02: Have a seat · Let me check · Thank you · Of course · Water · Coffee · Minutes
// Repaso L03: How · Your haircut · On the sides · Longer
// Repaso L04: On top · Classic · Scissors · Perfect
// Repaso L05: See you next time · Ready · Hair wash
// Sin cifras, sin "it" ni "What".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L07, L08 y L09.

const lesson06LowFade = Lesson(
  id: 6,
  title: 'Low Fade',
  description: 'El degradado bajo con navaja',
  emoji: '💈',
  level: Level.A1,
  descripcionEs:
      'Empieza el corte degradado: saluda por la mañana, entiende cuando el '
      'cliente pide un degradado bajo y pregúntale cómo quiere la barba.',
  motivacionEs:
      '¡El low fade es el corte más pedido! Ahora lo entiendes en inglés. 🔥',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Good morning · Fade · Low
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Good morning, Fade, Low',
      'respuesta_correcta': 'Good morning, Fade, Low',
      'fonetica': '[ gud MOR-ning · FEID · LOU ]',
      'traduccion_pregunta': 'Buenos días · Degradado · Bajo',
      'contexto_es': 'Para saludar y hablar del degradado',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Razor · Beard
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Razor, Beard',
      'respuesta_correcta': 'Razor, Beard',
      'fonetica': '[ REI-zor · BIRD ]',
      'traduccion_pregunta': 'Navaja · Barba',
      'contexto_es': 'Para el detalle del degradado y la barba',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 5 unidades nuevas
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Good morning', 'Fade', 'Low', 'Razor'],
      'parejas_espanol': ['Buenos días', 'Degradado', 'Bajo', 'Navaja'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Welcome. Come in.',
      'respuesta_correcta': 'Good morning! Welcome. Come in.',
      'fonetica': '[ gud MOR-ning · WEL-kom · kom IN ]',
      'traduccion_pregunta': '¡Buenos días! Bienvenido. Pasa.',
      'contexto_es': 'Así recibes al cliente por la mañana',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'Un cliente llega por la mañana. ¿Qué le dices?',
      'respuesta_correcta': 'Good morning! Welcome.',
      'opciones': ['Good morning! Welcome.', 'See you next time.', 'Ready! Perfect.'],
      'contexto_es': 'Good morning = buenos días',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Have a seat. How would you like your haircut?',
      'respuesta_correcta': 'Have a seat. How would you like your haircut?',
      'fonetica': '[ jav a SIIT · JAU wud iu LAIK ior JER-kat ]',
      'traduccion_pregunta': 'Toma asiento. ¿Cómo le gustaría su corte?',
      'contexto_es': 'Repaso: lo sientas y le preguntas por su corte',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Low fade, please.',
      'traduccion_pregunta': 'Degradado bajo, por favor.',
      'palabras': ['fade', 'Low', 'please'],
      'respuesta_correcta': 'Low fade please',
      'contexto_es': 'Low + fade: primero "bajo", luego "degradado"',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Degradado bajo"?',
      'traduccion_pregunta': 'Degradado bajo',
      'respuesta_correcta': 'Low fade',
      'opciones': ['Low fade', 'Classic scissors', 'Hair wash'],
      'contexto_es': 'En inglés el adjetivo va antes: low fade',
    },

    // ── EJ 09 · PAREJAS (repaso L02 + L03 + L04 + L06) ────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Beard', 'How', 'On top', 'Let me check'],
      'parejas_espanol': ['Barba', 'Cómo', 'Arriba', 'Déjame revisar'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Low fade on the sides, longer on top, please.',
      'respuesta_correcta': 'Low fade on the sides, longer on top, please.',
      'fonetica': '[ LOU FEID on de SAIDS · LONG-er on TOP · plis ]',
      'traduccion_pregunta': 'Degradado bajo en los lados, más largo arriba, por favor.',
      'contexto_es': 'El pedido completo del cliente',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Low ___, please.',
      'traduccion_pregunta': 'Degradado bajo, por favor.',
      'respuesta_correcta': 'fade',
      'opciones': ['fade', 'water', 'ready'],
      'contexto_es': 'Fade = degradado',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Navaja"?',
      'traduccion_pregunta': 'Navaja',
      'respuesta_correcta': 'Razor',
      'opciones': ['Razor', 'Beard', 'Coffee'],
      'contexto_es': 'Para el detalle del degradado',
    },

    // ── EJ 13 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Low fade on the sides.',
      'traduccion_pregunta': 'Degradado bajo en los lados.',
      'palabras': ['sides', 'the', 'on', 'fade', 'Low'],
      'respuesta_correcta': 'Low fade on the sides',
      'contexto_es': 'Low fade + on the sides',
    },

    // ── EJ 14 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices',
      'frase': 'Razor, please. Perfect!',
      'respuesta_correcta': 'Razor, please. Perfect!',
      'fonetica': '[ REI-zor · plis · PER-fekt ]',
      'traduccion_pregunta': 'Navaja, por favor. ¡Perfecto!',
      'contexto_es': 'El toque final del degradado',
    },

    // ── EJ 15 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'How would you like your beard? Classic, please.',
      'respuesta_correcta': 'How would you like your beard? Classic, please.',
      'fonetica': '[ JAU wud iu LAIK ior BIRD · KLA-sik · plis ]',
      'traduccion_pregunta': '¿Cómo le gustaría su barba? Clásica, por favor.',
      'contexto_es': 'Preguntas por la barba igual que por el corte',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you like your ___?',
      'traduccion_pregunta': '¿Cómo le gustaría su barba?',
      'respuesta_correcta': 'beard',
      'opciones': ['beard', 'minutes', 'coffee'],
      'contexto_es': 'Beard = barba',
    },

    // ── EJ 17 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta': 'Barbero: "How would you like your beard?" ¿Qué responde el cliente?',
      'respuesta_correcta': 'Classic, please.',
      'opciones': ['Classic, please.', 'Good morning!', 'See you next time.'],
      'contexto_es': 'El cliente quiere una barba clásica',
    },

    // ── EJ 18 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you like your beard?',
      'traduccion_pregunta': '¿Cómo le gustaría su barba?',
      'palabras': ['beard', 'your', 'like', 'How', 'would', 'you'],
      'respuesta_correcta': 'How would you like your beard',
      'contexto_es': 'How + would you like + your beard',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Good morning! Low fade, please. Thank you!',
      'respuesta_correcta': 'Good morning! Low fade, please. Thank you!',
      'fonetica': '[ gud MOR-ning · LOU FEID · plis · ZANK iu ]',
      'traduccion_pregunta': '¡Buenos días! Degradado bajo, por favor. ¡Gracias!',
      'contexto_es': 'Así llega el cliente que quiere un degradado',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pide su degradado — ¿qué le respondes?',
      'quien_habla': '¡Tu cliente de degradado! 🏆',
      'frase': 'Good morning! Low fade, please.',
      'traduccion_pregunta': '¡Buenos días! Degradado bajo, por favor.',
      'cliente_dice': 'Good morning! Low fade, please.',
      'traduccion_cliente': '¡Buenos días! Degradado bajo, por favor.',
      'respuesta_correcta': 'Of course! Have a seat.',
      'traduccion_respuesta': '¡Por supuesto! Toma asiento.',
      'opciones_barbero': [
        'Of course! Have a seat.',
        'See you next time.',
        'Hair wash, please.',
      ],
      'contexto_es': 'Of course + Have a seat — confirmas y lo sientas',
    },

  ],
);
