import '../../../../models/lesson.dart';

// BARBER ZONE · L08 — Like New (Bloque 2 · Conversación 1, corte degradado)
//
// Unidades NUEVAS L08 (5):
//   1. Sideburns    [ SAID-bernz ]
//   2. Combed back  [ KOUMD BAK ]
//   3. Product      [ PRO-dakt ]
//   4. I trust you  [ ai TRAST iu ]
//   5. Like new     [ LAIK niu ]
//
// Repaso L02: Let me check · Have a seat · Would you like · Water · Coffee
//             · Minutes · Thank you
// Repaso L03: How · Your haircut · On the sides
// Repaso L04: On top · Classic · Not too short · Perfect
// Repaso L05: Yes · Hair wash · See you next time
// Repaso L06: Good morning · Fade · Low · Razor · Beard
// Repaso L07: Texture · More · Modern · Fresh
// Sin cifras, sin "it" ni "What".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L09, L10 y L11.

const lesson08LikeNew = Lesson(
  id: 8,
  title: 'Like New',
  description: 'Patillas, producto y el cliente como nuevo',
  emoji: '✨',
  level: Level.A1,
  descripcionEs:
      'Termina el corte degradado: pregunta por las patillas y el producto, '
      'entiende cuando el cliente confía en ti y despídelo como nuevo.',
  motivacionEs:
      '¡Tu cliente sale como nuevo y tú lo dices en inglés! 💈',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Sideburns · Combed back · Product
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Sideburns, Combed back, Product',
      'respuesta_correcta': 'Sideburns, Combed back, Product',
      'fonetica': '[ SAID-bernz · KOUMD BAK · PRO-dakt ]',
      'traduccion_pregunta': 'Patillas · Peinado hacia atrás · Producto / fijador',
      'contexto_es': 'Para los detalles finales del corte',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: I trust you · Like new
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'I trust you, Like new',
      'respuesta_correcta': 'I trust you, Like new',
      'fonetica': '[ ai TRAST iu · LAIK niu ]',
      'traduccion_pregunta': 'Confío en ti · Como nuevo',
      'contexto_es': 'Lo que dice el cliente cuando confía y cuando termina',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Sideburns', 'Combed back', 'Product', 'I trust you', 'Like new'],
      'parejas_espanol': ['Patillas', 'Peinado hacia atrás', 'Producto', 'Confío en ti', 'Como nuevo'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Combed back, please.',
      'respuesta_correcta': 'Combed back, please.',
      'fonetica': '[ KOUMD BAK · plis ]',
      'traduccion_pregunta': 'Peinado hacia atrás, por favor.',
      'contexto_es': 'El cliente se peina hacia atrás',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Patillas"?',
      'traduccion_pregunta': 'Sideburns = Patillas',
      'respuesta_correcta': 'Sideburns',
      'opciones': ['Sideburns', 'Beard', 'Razor'],
      'contexto_es': 'Sideburns = patillas · Beard = barba',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like product on top?',
      'respuesta_correcta': 'Would you like product on top?',
      'fonetica': '[ wud iu LAIK PRO-dakt on TOP ]',
      'traduccion_pregunta': '¿Le gustaría producto arriba?',
      'contexto_es': 'Le ofreces fijador para terminar',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like product on top?',
      'traduccion_pregunta': '¿Le gustaría producto arriba?',
      'palabras': ['product', 'on', 'top', 'like', 'you', 'Would'],
      'respuesta_correcta': 'Would you like product on top',
      'contexto_es': 'Would you like + product + on top',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Would you like product on top?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Le gustaría producto arriba? — Sí, por favor. Peinado hacia atrás, por favor.',
      'respuesta_correcta': 'Yes, please. Combed back, please.',
      'opciones': [
        'Yes, please. Combed back, please.',
        'See you next time.',
        'Good morning!',
      ],
      'contexto_es': 'El cliente acepta el producto y pide peinado hacia atrás',
    },

    // ── EJ 09 · PAREJAS (repaso L02 + L03 + L04) ──────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Let me check', 'Have a seat', 'Your haircut', 'Not too short', 'Classic'],
      'parejas_espanol': ['Déjame revisar', 'Toma asiento', 'Su corte', 'No muy corto', 'Clásico'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Low fade on the sides, more texture on top. I trust you.',
      'respuesta_correcta':
          'Low fade on the sides, more texture on top. I trust you.',
      'fonetica': '[ LOU FEID on de SAIDS · MOR TEKS-char on TOP · ai TRAST iu ]',
      'traduccion_pregunta':
          'Degradado bajo en los lados, más textura arriba. Confío en ti.',
      'contexto_es': 'El cliente pide su corte y te deja trabajar',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like ___ on top?',
      'traduccion_pregunta': '¿Le gustaría producto arriba?',
      'respuesta_correcta': 'product',
      'opciones': ['product', 'coffee', 'water'],
      'contexto_es': 'Product = producto / fijador',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Razor on the sides, more texture on top." ¿Qué responde el cliente?',
      'traduccion_pregunta':
          'Navaja en los lados, más textura arriba. — Confío en ti.',
      'respuesta_correcta': 'I trust you.',
      'opciones': ['I trust you.', 'See you next time.', 'Hair wash, please.'],
      'contexto_es': 'El cliente confía en tu propuesta',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you like your beard? Classic or modern?',
      'respuesta_correcta': 'How would you like your beard? Classic or modern?',
      'fonetica': '[ JAU wud iu LAIK ior BIRD · KLA-sik or MO-dern ]',
      'traduccion_pregunta': '¿Cómo le gustaría su barba? ¿Clásica o moderna?',
      'contexto_es': 'Le das a elegir el estilo de la barba',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like your sideburns low?',
      'traduccion_pregunta': '¿Le gustarían sus patillas bajas?',
      'palabras': ['sideburns', 'your', 'Would', 'you', 'like', 'low'],
      'respuesta_correcta': 'Would you like your sideburns low',
      'contexto_es': 'Would you like + your sideburns + low',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Como nuevo"?',
      'traduccion_pregunta': 'Like new = Como nuevo',
      'respuesta_correcta': 'Like new',
      'opciones': ['Like new', 'Perfect', 'Ready'],
      'contexto_es': 'Like new = como nuevo',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'Would you like your sideburns low? Yes, please.',
      'respuesta_correcta': 'Would you like your sideburns low? Yes, please.',
      'fonetica': '[ wud iu LAIK ior SAID-bernz LOU · IES · plis ]',
      'traduccion_pregunta': '¿Le gustarían sus patillas bajas? Sí, por favor.',
      'contexto_es': 'Preguntas por las patillas y el cliente acepta',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like your ___ low?',
      'traduccion_pregunta': '¿Le gustarían sus patillas bajas?',
      'respuesta_correcta': 'sideburns',
      'opciones': ['sideburns', 'water', 'minutes'],
      'contexto_es': 'Sideburns = patillas',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "How would you like your beard? Classic or modern?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Cómo le gustaría su barba? ¿Clásica o moderna? — Moderna, por favor.',
      'respuesta_correcta': 'Modern, please.',
      'opciones': ['Modern, please.', 'Good morning!', 'Hair wash, please.'],
      'contexto_es': 'El cliente elige el toque moderno',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Perfect! Fresh! Like new!',
      'respuesta_correcta': 'Perfect! Fresh! Like new!',
      'fonetica': '[ PER-fekt · FRESH · LAIK niu ]',
      'traduccion_pregunta': '¡Perfecto! ¡Fresco! ¡Como nuevo!',
      'contexto_es': 'Así le enseñas el corte terminado',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero termina el corte — ¿qué responde el cliente?',
      'quien_habla': '¡Tu cliente sale como nuevo! 🏆',
      'frase': 'Perfect! Fresh! Like new!',
      'traduccion_pregunta': '¡Perfecto! ¡Fresco! ¡Como nuevo!',
      'cliente_dice': 'Perfect! Fresh! Like new!',
      'traduccion_cliente': '¡Perfecto! ¡Fresco! ¡Como nuevo!',
      'respuesta_correcta': 'Thank you! See you next time.',
      'traduccion_respuesta': '¡Gracias! Nos vemos la próxima.',
      'opciones_barbero': [
        'Thank you! See you next time.',
        'Good morning!',
        'Combed back, please.',
      ],
      'contexto_es': 'El cliente da las gracias y se despide',
    },

  ],
);
