import '../../../../models/lesson.dart';

// BARBER ZONE · L07 — More Texture (Bloque 2 · Conversación 1, corte degradado)
//
// Unidades NUEVAS L07 (6):
//   1. Texture  [ TEKS-char ]
//   2. Volume   [ VOL-yum ]
//   3. More     [ MOR ]
//   4. Less     [ LES ]
//   5. Modern   [ MO-dern ]
//   6. Fresh    [ FRESH ]
//
// Repaso L02: Have a seat · Let me check · Thank you · Of course · Water · Coffee
// Repaso L03: How · Your haircut · On the sides
// Repaso L04: On top · Not too short · Perfect
// Repaso L05: See you next time · Ready · Hair wash
// Repaso L06: Good morning · Fade · Low · Razor · Beard
// Sin cifras, sin "it" ni "What".
// Repaso obligatorio: las 6 unidades nuevas deben aparecer en L08, L09 y L10.

const lesson07MoreTexture = Lesson(
  id: 7,
  title: 'More Texture',
  description: 'Textura, volumen y un estilo moderno',
  emoji: '✂️',
  level: Level.A1,
  descripcionEs:
      'Sigue el corte degradado: entiende cuando el cliente pide más textura, '
      'más o menos volumen arriba y un estilo moderno y fresco.',
  motivacionEs:
      '¡Ya entiendes los detalles de arriba! Textura y volumen en inglés. 🔥',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Texture · Volume · More
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Texture, Volume, More',
      'respuesta_correcta': 'Texture, Volume, More',
      'fonetica': '[ TEKS-char · VOL-yum · MOR ]',
      'traduccion_pregunta': 'Textura · Volumen · Más',
      'contexto_es': 'Para hablar de la parte de arriba',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Less · Modern · Fresh
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Less, Modern, Fresh',
      'respuesta_correcta': 'Less, Modern, Fresh',
      'fonetica': '[ LES · MO-dern · FRESH ]',
      'traduccion_pregunta': 'Menos · Moderno · Fresco',
      'contexto_es': 'Para describir el estilo del corte',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Texture', 'Volume', 'More', 'Less'],
      'parejas_espanol': ['Textura', 'Volumen', 'Más', 'Menos'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'More volume on top, please.',
      'respuesta_correcta': 'More volume on top, please.',
      'fonetica': '[ MOR VOL-yum on TOP · plis ]',
      'traduccion_pregunta': 'Más volumen arriba, por favor.',
      'contexto_es': 'El cliente quiere más volumen arriba',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Menos"?',
      'traduccion_pregunta': 'Menos',
      'respuesta_correcta': 'Less',
      'opciones': ['Less', 'More', 'Coffee'],
      'contexto_es': 'Less = menos · More = más',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Less on top, please.',
      'respuesta_correcta': 'Less on top, please.',
      'fonetica': '[ LES on TOP · plis ]',
      'traduccion_pregunta': 'Menos arriba, por favor.',
      'contexto_es': 'El cliente quiere menos pelo arriba',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'More volume on top, please.',
      'traduccion_pregunta': 'Más volumen arriba, por favor.',
      'palabras': ['volume', 'More', 'on', 'top', 'please'],
      'respuesta_correcta': 'More volume on top please',
      'contexto_es': 'More + volume + on top',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la frase del cliente',
      'quien_habla': 'Practica',
      'pregunta': 'El cliente quiere más volumen. ¿Qué dice?',
      'respuesta_correcta': 'More volume, please.',
      'opciones': ['More volume, please.', 'Less volume, please.', 'Low fade, please.'],
      'contexto_es': 'More = más · Less = menos',
    },

    // ── EJ 09 · PAREJAS (nuevas + repaso L02 + L04) ───────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Modern', 'Fresh', 'Let me check', 'Have a seat', 'Not too short'],
      'parejas_espanol': ['Moderno', 'Fresco', 'Déjame revisar', 'Toma asiento', 'No muy corto'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Low fade on the sides, more texture on top, please.',
      'respuesta_correcta': 'Low fade on the sides, more texture on top, please.',
      'fonetica': '[ LOU FEID on de SAIDS · MOR TEKS-char on TOP · plis ]',
      'traduccion_pregunta': 'Degradado bajo en los lados, más textura arriba, por favor.',
      'contexto_es': 'El pedido completo del cliente',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'More ___ on top, please.',
      'traduccion_pregunta': 'Más textura arriba, por favor.',
      'respuesta_correcta': 'texture',
      'opciones': ['texture', 'coffee', 'water'],
      'contexto_es': 'Texture = textura',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Fresco"?',
      'traduccion_pregunta': 'Fresco',
      'respuesta_correcta': 'Fresh',
      'opciones': ['Fresh', 'Ready', 'Perfect'],
      'contexto_es': 'Fresh = fresco, como queda el cliente al terminar',
    },

    // ── EJ 13 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'More texture, please.',
      'traduccion_pregunta': 'Más textura, por favor.',
      'palabras': ['texture', 'More', 'please'],
      'respuesta_correcta': 'More texture please',
      'contexto_es': 'More + texture',
    },

    // ── EJ 14 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Modern fade on the sides, please.',
      'respuesta_correcta': 'Modern fade on the sides, please.',
      'fonetica': '[ MO-dern FEID on de SAIDS · plis ]',
      'traduccion_pregunta': 'Degradado moderno en los lados, por favor.',
      'contexto_es': 'El cliente quiere un toque moderno',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del barbero',
      'quien_habla': 'Practica',
      'pregunta':
          'Cliente: "Low fade, more texture on top, please." ¿Qué responde el barbero?',
      'respuesta_correcta': 'Of course! Perfect.',
      'opciones': ['Of course! Perfect.', 'See you next time.', 'Hair wash, please.'],
      'contexto_es': 'Confirmas el pedido del cliente',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Less on ___, please.',
      'traduccion_pregunta': 'Menos arriba, por favor.',
      'respuesta_correcta': 'top',
      'opciones': ['top', 'water', 'beard'],
      'contexto_es': 'On top = arriba',
    },

    // ── EJ 17 · PRONUNCIACIÓN ─────────────────────────────────────────────
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

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "How would you like your haircut?" ¿Qué responde el cliente?',
      'respuesta_correcta': 'Low fade, more texture on top, please.',
      'opciones': [
        'Low fade, more texture on top, please.',
        'See you next time.',
        'Good morning!',
      ],
      'contexto_es': 'El cliente pide su degradado con textura',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Fresh! Perfect. Thank you!',
      'respuesta_correcta': 'Fresh! Perfect. Thank you!',
      'fonetica': '[ FRESH · PER-fekt · ZANK iu ]',
      'traduccion_pregunta': '¡Fresco! Perfecto. ¡Gracias!',
      'contexto_es': 'Así se despide el cliente contento',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero confirma el corte — ¿qué responde el cliente?',
      'quien_habla': '¡Tu cliente de degradado! 🏆',
      'frase': 'Razor fade on the sides, more texture on top.',
      'traduccion_pregunta': 'Degradado con navaja en los lados, más textura arriba.',
      'cliente_dice': 'Razor fade on the sides, more texture on top.',
      'traduccion_cliente': 'Degradado con navaja en los lados, más textura arriba.',
      'respuesta_correcta': 'Perfect! Thank you!',
      'traduccion_respuesta': '¡Perfecto! ¡Gracias!',
      'opciones_barbero': [
        'Perfect! Thank you!',
        'See you next time.',
        'Hair wash, please.',
      ],
      'contexto_es': 'El cliente aprueba el corte que le propones',
    },

  ],
);
