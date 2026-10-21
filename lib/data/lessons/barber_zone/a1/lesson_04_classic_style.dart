import '../../../../models/lesson.dart';

// BARBER ZONE · L04 — Classic Style (Bloque 1 · Conversación 2, corte clásico)
//
// Unidades NUEVAS L04 (5):
//   1. On top          [ on TOP ]
//   2. Classic         [ KLA-sik ]
//   3. Scissors        [ SI-sors ]
//   4. Not too short   [ not tu SHORT ]
//   5. Perfect         [ PER-fekt ]
//
// Repaso L01: Appointment · Do you have · Welcome · Come in
// Repaso L02: Would you like · Water · Coffee · Minutes · Of course
// Repaso L03: How · Your haircut · Short · Longer · On the sides
// Sin cifras, sin "it", "What" ni "Yes".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L05, L06 y L07.

const lesson04ClassicStyle = Lesson(
  id: 4,
  title: 'Classic Style',
  description: 'El corte clásico con tijera',
  emoji: '💈',
  level: Level.A1,
  descripcionEs:
      'El cliente quiere algo clásico: con tijera, no muy corto en los lados '
      'y más largo arriba. Aprenderás a entenderlo y a confirmarlo.',
  motivacionEs:
      '¡El corte clásico nunca pasa de moda! Y ahora lo entiendes en inglés. ✂️',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: On top · Classic · Scissors
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'On top, Classic, Scissors',
      'respuesta_correcta': 'On top, Classic, Scissors',
      'fonetica': '[ on TOP · KLA-sik · SI-sors ]',
      'traduccion_pregunta': 'Arriba · Clásico · Tijeras',
      'contexto_es': 'Para hablar del corte clásico',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Not too short · Perfect
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Not too short, Perfect',
      'respuesta_correcta': 'Not too short, Perfect',
      'fonetica': '[ not tu SHORT · PER-fekt ]',
      'traduccion_pregunta': 'No muy corto · Perfecto',
      'contexto_es': 'Lo que pide el cliente y lo que respondes tú',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 5 unidades nuevas
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['On top', 'Classic', 'Scissors', 'Perfect'],
      'parejas_espanol': ['Arriba', 'Clásico', 'Tijeras', 'Perfecto'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic, please.',
      'respuesta_correcta': 'Classic, please.',
      'fonetica': '[ KLA-sik · plis ]',
      'traduccion_pregunta': 'Clásico, por favor.',
      'contexto_es': 'El cliente pide un corte clásico',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Tijeras"?',
      'traduccion_pregunta': 'Tijeras',
      'respuesta_correcta': 'Scissors',
      'opciones': ['Scissors', 'Classic', 'Coffee'],
      'contexto_es': 'La herramienta del corte clásico',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer on top, please.',
      'respuesta_correcta': 'Longer on top, please.',
      'fonetica': '[ LONG-er on TOP · plis ]',
      'traduccion_pregunta': 'Más largo arriba, por favor.',
      'contexto_es': 'Longer + on top',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer on top, please.',
      'traduccion_pregunta': 'Más largo arriba, por favor.',
      'palabras': ['top', 'Longer', 'on', 'please'],
      'respuesta_correcta': 'Longer on top please',
      'contexto_es': 'Longer + on top + please',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente no quiere el corte muy corto. ¿Qué dice?',
      'respuesta_correcta': 'Not too short, please.',
      'opciones': ['Not too short, please.', 'Short, please.', 'Water, please.'],
      'contexto_es': 'Not too short = no muy corto',
    },

    // ── EJ 09 · PAREJAS (repaso L02 + L03) ────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['How', 'Your haircut', 'On the sides', 'Would you like'],
      'parejas_espanol': ['Cómo', 'Su corte', 'En los lados', '¿Te gustaría?'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Not too short on the sides, please.',
      'respuesta_correcta': 'Not too short on the sides, please.',
      'fonetica': '[ not tu SHORT on de SAIDS · plis ]',
      'traduccion_pregunta': 'No muy corto en los lados, por favor.',
      'contexto_es': 'Not too short + on the sides',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Not too short, please.',
      'traduccion_pregunta': 'No muy corto, por favor.',
      'palabras': ['please', 'short', 'Not', 'too'],
      'respuesta_correcta': 'Not too short please',
      'contexto_es': 'Not + too + short',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Más largo arriba, por favor"?',
      'traduccion_pregunta': 'Más largo arriba, por favor',
      'respuesta_correcta': 'Longer on top, please.',
      'opciones': [
        'Longer on top, please.',
        'Short on the sides, please.',
        'Classic, please.',
      ],
      'contexto_es': 'On top = arriba',
    },

    // ── EJ 13 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite',
      'quien_habla': 'Tú dices',
      'frase': 'Scissors, please, Of course',
      'respuesta_correcta': 'Scissors, please, Of course',
      'fonetica': '[ SI-sors · plis · of KORS ]',
      'traduccion_pregunta': 'Tijeras, por favor · Por supuesto',
      'contexto_es': 'El cliente pide tijera y tú confirmas',
    },

    // ── EJ 14 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Scissors, ___.',
      'traduccion_pregunta': 'Tijeras, por favor.',
      'respuesta_correcta': 'please',
      'opciones': ['please', 'haircut', 'minutes'],
      'contexto_es': 'Pide con educación: please',
    },

    // ── EJ 15 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena tu respuesta',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Perfect.',
      'traduccion_pregunta': '¡Por supuesto! Perfecto.',
      'palabras': ['course', 'Of', 'Perfect'],
      'respuesta_correcta': 'Of course Perfect',
      'contexto_es': 'Confirmas con seguridad',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Perfect.',
      'respuesta_correcta': 'Of course! Perfect.',
      'fonetica': '[ of KORS · PER-fekt ]',
      'traduccion_pregunta': '¡Por supuesto! Perfecto.',
      'contexto_es': 'Tu respuesta cuando entiendes lo que quiere',
    },

    // ── EJ 17 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta correcta',
      'quien_habla': 'Practica',
      'pregunta': 'Cliente: "Classic, please. Not too short." ¿Qué responde el barbero?',
      'respuesta_correcta': 'Of course!',
      'opciones': [
        'Of course!',
        'Welcome! Come in.',
        'Do you have an appointment?',
      ],
      'contexto_es': 'Confirma lo que pide el cliente',
    },

    // ── EJ 18 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer on ___, please.',
      'traduccion_pregunta': 'Más largo arriba, por favor.',
      'respuesta_correcta': 'top',
      'opciones': ['top', 'water', 'coffee'],
      'contexto_es': 'On top = arriba',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Scissors, please. Longer on top.',
      'respuesta_correcta': 'Scissors, please. Longer on top.',
      'fonetica': '[ SI-sors · plis · LONG-er on TOP ]',
      'traduccion_pregunta': 'Tijeras, por favor. Más largo arriba.',
      'contexto_es': 'Lo que pide el cliente de corte clásico',
    },

    // ── EJ 20 · DIÁLOGO FINAL (esta vez respondes como cliente) ───────────
    {
      'tipo': 'dialogo',
      'instruccion': 'Ahora eres el cliente — ¿qué le respondes al barbero?',
      'quien_habla': 'El barbero dice 💈',
      'frase': 'How would you like your haircut?',
      'traduccion_pregunta': '¿Cómo le gustaría su corte?',
      'cliente_dice': 'How would you like your haircut?',
      'traduccion_cliente': '¿Cómo le gustaría su corte?',
      'respuesta_correcta': 'Classic, please. Longer on top.',
      'traduccion_respuesta': 'Clásico, por favor. Más largo arriba.',
      'opciones_barbero': [
        'Classic, please. Longer on top.',
        'Welcome! Come in.',
        'Do you have an appointment?',
      ],
      'contexto_es': 'Classic + Longer on top — el corte clásico',
    },

  ],
);
