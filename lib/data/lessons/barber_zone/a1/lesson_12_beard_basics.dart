import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L11):
//   L03: Haircut · Fade · Sides · Top · Longer
//   L06: Number one · Short · Long · Same · Little
//   L11: Like · Similar · Possible · Different · Close
//   (más L01·L02·L04·L05·L07·L08·L09·L10 siempre disponibles)
//
// Palabras NUEVAS L12 (en orden de enseñanza):
//   1. Beard      [ BIRD ]      → Barba
//   2. Sideburns  [ SAID-borns ] → Patillas
//   3. Shape      [ SHEIP ]     → Perfilar / Forma
//   4. Clean      [ KLIIN ]     → Limpio / Limpiar
//   5. Line       [ LAIN ]      → Línea / Perfil

const lesson12BeardBasics = Lesson(
  id: 12,
  title: 'Beard Basics',
  description: 'Barba, patillas y perfil — el detalle que marca la diferencia',
  emoji: '🪒',
  level: Level.A1,
  descripcionEs:
      'Aprenderás el vocabulario para hablar de la barba: '
      'cómo preguntar si quiere que le perfiles, limpies las patillas '
      'y definas la línea para un acabado impecable.',
  motivacionEs:
      '¡Un barbero que domina la barba en inglés tiene el 100% del servicio cubierto! 🪒',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L11 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L11 · L09 · L06 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Like · Fresh · Long',
      'traduccion_pregunta': 'Como · Fresco · Largo',
      'parejas_ingles': ['Like', 'Fresh', 'Long'],
      'parejas_espanol': ['Como', 'Fresco', 'Largo'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L11 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la respuesta al cliente con la foto',
      'quien_habla': 'Tú le dices',
      'frase': '___ to the photo, possible',
      'traduccion_pregunta': 'Similar a la foto, posible',
      'respuesta_correcta': 'similar',
      'opciones': ['similar', 'close', 'different', 'like'],
      'contexto_es': 'Repaso de L11 — confirmas el corte de la foto',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L11+L06 ─────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la confirmación completa del corte de la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Similar to the photo, possible! Number one, short on the sides',
      'respuesta_correcta': 'Similar to the photo, possible! Number one, short on the sides',
      'fonetica': '[ SI-mi-lar tu de FOU-tou, PO-si-bol, NOM-ber WAN, SHORT on de SAIDS ]',
      'traduccion_pregunta': '¡Similar a la foto, posible! Número uno, corto en los lados',
      'contexto_es': 'Combinas L11 y L06 — la respuesta completa al cliente con foto',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L12 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Beard" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el vocabulario del vello facial',
      'quien_habla': 'El cliente dice',
      'frase': 'Beard',
      'fonetica': '[ BIRD ]',
      'traduccion_pregunta': 'Barba',
      'contexto_es': 'El servicio de barba más lucrativo de la barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Beard" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Beard',
      'respuesta_correcta': 'Beard',
      'fonetica': '[ BIRD ]',
      'traduccion_pregunta': 'Barba',
      'contexto_es': '"Beard trim, please" — perfila la barba, por favor',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Sideburns" ────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el nombre de la zona más delicada de la barba',
      'quien_habla': 'El cliente dice',
      'frase': 'Sideburns',
      'fonetica': '[ SAID-borns ]',
      'traduccion_pregunta': 'Patillas',
      'contexto_es': 'La zona de conexión entre el cabello y la barba',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Sideburns" ───────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Sideburns',
      'respuesta_correcta': 'Sideburns',
      'fonetica': '[ SAID-borns ]',
      'traduccion_pregunta': 'Patillas',
      'contexto_es': '"Shape the sideburns" — perfilar las patillas',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Shape" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el verbo del perfilado',
      'quien_habla': 'Tú le dices',
      'frase': 'Shape',
      'fonetica': '[ SHEIP ]',
      'traduccion_pregunta': 'Perfilar / Dar forma',
      'contexto_es': '"Shape the beard" — perfilar la barba con precisión',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Shape" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Shape',
      'respuesta_correcta': 'Shape',
      'fonetica': '[ SHEIP ]',
      'traduccion_pregunta': 'Perfilar / Dar forma',
      'contexto_es': '"Shape" transforma una barba descuidada en una obra de arte',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L12: Beard · Sideburns · Shape
    {
      'tipo': 'completar',
      'instruccion': 'Completa la pregunta sobre la barba',
      'quien_habla': 'Tú le dices',
      'frase': '___ the sideburns, please?',
      'traduccion_pregunta': '¿Le perfilamos las patillas, por favor?',
      'respuesta_correcta': 'shape',
      'opciones': ['shape', 'beard', 'similar', 'modern'],
      'contexto_es': 'Preguntas si quiere que le perfiles las patillas',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Clean" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el adjetivo del acabado impecable',
      'quien_habla': 'Tú le dices',
      'frase': 'Clean',
      'fonetica': '[ KLIIN ]',
      'traduccion_pregunta': 'Limpio / Impecable',
      'contexto_es': '"Clean beard" — barba limpia y bien definida',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Clean" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Clean',
      'respuesta_correcta': 'Clean',
      'fonetica': '[ KLIIN ]',
      'traduccion_pregunta': 'Limpio / Impecable',
      'contexto_es': '"Clean line, clean beard" — el resultado que el cliente espera',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Line" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el elemento más importante del acabado de la barba',
      'quien_habla': 'Tú le dices',
      'frase': 'Line',
      'fonetica': '[ LAIN ]',
      'traduccion_pregunta': 'Línea / Perfil',
      'contexto_es': '"Clean line" — la línea perfecta que define al barbero profesional',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Line" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Line',
      'respuesta_correcta': 'Line',
      'fonetica': '[ LAIN ]',
      'traduccion_pregunta': 'Línea / Perfil',
      'contexto_es': '"Clean line, clean beard" — la marca del barbero de nivel',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L12 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Beard · Sideburns · Shape · Clean · Line',
      'traduccion_pregunta': 'Barba · Patillas · Perfilar · Limpio · Línea',
      'parejas_ingles': ['Beard', 'Sideburns', 'Shape', 'Clean', 'Line'],
      'parejas_espanol': ['Barba', 'Patillas', 'Perfilar', 'Limpio', 'Línea'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L12 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del servicio de barba',
      'quien_habla': 'Tú le dices',
      'frase': 'Clean beard, ___ sideburns',
      'traduccion_pregunta': 'Barba limpia, patillas perfiladas',
      'respuesta_correcta': 'shape',
      'opciones': ['shape', 'beard', 'clean', 'line'],
      'contexto_es': 'Describes el servicio de barba completo al cliente',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Beard · shape · sideburns · clean · line (L12) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción del servicio de barba',
      'quien_habla': 'Tú le dices',
      'frase': 'Beard, shape the sideburns, clean line',
      'traduccion_pregunta': 'Barba, perfilar las patillas, línea limpia',
      'palabras': ['beard', 'shape', 'the', 'sideburns', 'clean', 'line'],
      'respuesta_correcta': 'beard shape the sideburns clean line',
      'contexto_es': 'El servicio de barba descrito en tres elementos clave',
    },

    // ── EJ 18 · ORDENAR REPASO L03+L12 ────────────────────────────────────
    // Fade (L03) + on the sides (L03) + clean beard · shape the line (L12) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción completa del servicio premium',
      'quien_habla': 'Tú le dices',
      'frase': 'Fade on the sides, clean beard, shape the line',
      'traduccion_pregunta': 'Degradado en los lados, barba limpia, perfilar la línea',
      'palabras': ['Fade', 'on', 'the', 'sides', 'clean', 'beard', 'shape', 'the', 'line'],
      'respuesta_correcta': 'Fade on the sides clean beard shape the line',
      'contexto_es': 'Combinas L03 y L12 — el servicio completo de corte y barba',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L12 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción del servicio de barba',
      'quien_habla': 'Tú le dices',
      'frase': 'Beard, shape the sideburns, clean line, please',
      'respuesta_correcta': 'Beard, shape the sideburns, clean line, please',
      'fonetica': '[ BIRD, SHEIP de SAID-borns, KLIIN LAIN, pliis ]',
      'traduccion_pregunta': 'Barba, perfilar las patillas, línea limpia, por favor',
      'contexto_es': 'El servicio de barba completo — lo que te convierte en el barbero de referencia',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente pide servicio de barba — opciones SOLO L01–L12 ✓
    // Respuesta correcta: Of course (L01) + Clean beard · shape · sideburns · line (L12)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pide que le arregles la barba — ¿qué le dices?',
      'quien_habla': '¡Servicio de barba! 🪒',
      'frase': 'Beard, shape the sideburns, please',
      'traduccion_pregunta': 'Barba, perfilar las patillas, por favor',
      'cliente_dice': 'Beard, shape the sideburns, please',
      'traduccion_cliente': 'Barba, perfilar las patillas, por favor',
      'respuesta_correcta': 'Of course! Clean beard, shape the line, sideburns',
      'traduccion_respuesta': '¡Claro! Barba limpia, perfilar la línea, patillas',
      'opciones_barbero': [
        'Of course! Clean beard, shape the line, sideburns',
        'Do you have an appointment?',
        'Similar to the photo, number one',
        'Classic style, scissors, neat',
      ],
      'contexto_es':
          'Of course (L01) + Clean beard · Shape the line · Sideburns (L12) — '
          'confirmas el servicio de barba como un profesional',
    },

  ],
);
