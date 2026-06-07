import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L12):
//   L08: Scissors · Classic · Style · Comb · Neat
//   L12: Beard · Sideburns · Shape · Clean · Line
//   (más L01–L07·L09·L10·L11 siempre disponibles)
//
// Palabras NUEVAS L13 (en orden de enseñanza):
//   1. Volume   [ VOL-yum ]      → Volumen
//   2. Texture  [ TEKS-cher ]    → Textura
//   3. Product  [ PRO-dakt ]     → Producto (para el cabello)
//   4. Natural  [ NAT-shu-ral ]  → Natural
//   5. Messy    [ ME-si ]        → Desenfadado / Despeinado natural

const lesson13StyleTalk = Lesson(
  id: 13,
  title: 'Style Talk',
  description: 'Habla del volumen, textura y producto para el cabello',
  emoji: '💈',
  level: Level.A1,
  descripcionEs:
      'Aprenderás el vocabulario para hablar del estilo final: '
      'cuánto volumen quiere arriba, si prefiere textura natural '
      'o producto, y si le gusta el look más desenfadado.',
  motivacionEs:
      '¡El barbero que habla de estilo en inglés cobra más — y lo merece! 💈',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L12 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L12 · L08 · L06 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Beard · Classic · Number one',
      'traduccion_pregunta': 'Barba · Clásico · Número uno',
      'parejas_ingles': ['Beard', 'Classic', 'Number one'],
      'parejas_espanol': ['Barba', 'Clásico', 'Número uno'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L12 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa el servicio de barba',
      'quien_habla': 'Tú le dices',
      'frase': 'Clean ___, shape the sideburns',
      'traduccion_pregunta': 'Barba limpia, perfilar las patillas',
      'respuesta_correcta': 'beard',
      'opciones': ['beard', 'line', 'shape', 'clean'],
      'contexto_es': 'Repaso de L12 — el servicio de barba completo',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L12+L08 ─────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el servicio de barba y corte juntos',
      'quien_habla': 'Tú le dices',
      'frase': 'Beard, shape the sideburns, clean line, classic style',
      'respuesta_correcta': 'Beard, shape the sideburns, clean line, classic style',
      'fonetica': '[ BIRD, SHEIP de SAID-borns, KLIIN LAIN, KLA-sik STAIL ]',
      'traduccion_pregunta': 'Barba, perfilar patillas, línea limpia, estilo clásico',
      'contexto_es': 'Combinas L12 y L08 — el servicio premium completo',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L13 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Volume" ────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha lo que el cliente quiere arriba',
      'quien_habla': 'El cliente dice',
      'frase': 'Volume',
      'fonetica': '[ VOL-yum ]',
      'traduccion_pregunta': 'Volumen',
      'contexto_es': '"Volume on top" — el cliente quiere más cuerpo arriba',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Volume" ──────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Volume',
      'respuesta_correcta': 'Volume',
      'fonetica': '[ VOL-yum ]',
      'traduccion_pregunta': 'Volumen',
      'contexto_es': '"More volume on top" — más cuerpo arriba',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Texture" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el término del acabado profesional',
      'quien_habla': 'Tú le dices',
      'frase': 'Texture',
      'fonetica': '[ TEKS-cher ]',
      'traduccion_pregunta': 'Textura',
      'contexto_es': '"Natural texture" — la textura que da movimiento al cabello',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Texture" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Texture',
      'respuesta_correcta': 'Texture',
      'fonetica': '[ TEKS-cher ]',
      'traduccion_pregunta': 'Textura',
      'contexto_es': '"Texture perfect for your hair" — lo que decía el cliente de Conv. 1',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Product" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha si el cliente quiere o no quiere producto',
      'quien_habla': 'El cliente dice',
      'frase': 'Product',
      'fonetica': '[ PRO-dakt ]',
      'traduccion_pregunta': 'Producto',
      'contexto_es': 'Gel, pomada, cera — todo es "product"',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Product" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Product',
      'respuesta_correcta': 'Product',
      'fonetica': '[ PRO-dakt ]',
      'traduccion_pregunta': 'Producto',
      'contexto_es': '"No product" — algunos clientes prefieren el look natural',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L13: Volume · Texture · Product
    {
      'tipo': 'completar',
      'instruccion': 'Completa la petición del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ on top, please',
      'traduccion_pregunta': 'Volumen arriba, por favor',
      'respuesta_correcta': 'volume',
      'opciones': ['volume', 'texture', 'product', 'longer'],
      'contexto_es': 'El cliente pide el volumen que quiere para su peinado',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Natural" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo prefiere el acabado el cliente moderno',
      'quien_habla': 'El cliente dice',
      'frase': 'Natural',
      'fonetica': '[ NAT-shu-ral ]',
      'traduccion_pregunta': 'Natural',
      'contexto_es': '"Natural look" — sin producto, el cabello tal como cae',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Natural" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Natural',
      'respuesta_correcta': 'Natural',
      'fonetica': '[ NAT-shu-ral ]',
      'traduccion_pregunta': 'Natural',
      'contexto_es': '"Natural texture, no product" — la tendencia actual en barbería',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Messy" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el estilo desenfadado que piden los jóvenes',
      'quien_habla': 'El cliente dice',
      'frase': 'Messy',
      'fonetica': '[ ME-si ]',
      'traduccion_pregunta': 'Desenfadado / Despeinado natural',
      'contexto_es': '"Messy style" — despeinado con intención, el look casual moderno',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Messy" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Messy',
      'respuesta_correcta': 'Messy',
      'fonetica': '[ ME-si ]',
      'traduccion_pregunta': 'Desenfadado / Despeinado natural',
      'contexto_es': '"Messy style, natural, no product" — la descripción del look moderno',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L13 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Volume · Texture · Product · Natural · Messy',
      'traduccion_pregunta': 'Volumen · Textura · Producto · Natural · Desenfadado',
      'parejas_ingles': ['Volume', 'Texture', 'Product', 'Natural', 'Messy'],
      'parejas_espanol': ['Volumen', 'Textura', 'Producto', 'Natural', 'Desenfadado'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L13 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la preferencia del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Natural texture, no ___',
      'traduccion_pregunta': 'Textura natural, sin producto',
      'respuesta_correcta': 'product',
      'opciones': ['product', 'natural', 'texture', 'volume'],
      'contexto_es': 'El cliente prefiere el look natural sin producto',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Volume · on · top (L03) · natural · texture · no · product (L13) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción del estilo del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Volume on top, natural texture, no product',
      'traduccion_pregunta': 'Volumen arriba, textura natural, sin producto',
      'palabras': ['volume', 'on', 'top', 'natural', 'texture', 'no', 'product'],
      'respuesta_correcta': 'volume on top natural texture no product',
      'contexto_es': 'La descripción completa del look que busca el cliente',
    },

    // ── EJ 18 · ORDENAR REPASO L03+L13 ────────────────────────────────────
    // Longer (L03) + on top (L03) + volume · messy · style (L08+L13) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la petición del estilo moderno',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer on top, volume, messy style',
      'traduccion_pregunta': 'Más largo arriba, volumen, estilo desenfadado',
      'palabras': ['longer', 'on', 'top', 'volume', 'messy', 'style'],
      'respuesta_correcta': 'longer on top volume messy style',
      'contexto_es': 'Combinas L03 y L13 — el cliente describe su look moderno',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L13 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción del estilo completo',
      'quien_habla': 'El cliente dice',
      'frase': 'Volume on top, natural texture, no product, messy style',
      'respuesta_correcta': 'Volume on top, natural texture, no product, messy style',
      'fonetica': '[ VOL-yum on TOP, NAT-shu-ral TEKS-cher, nou PRO-dakt, ME-si STAIL ]',
      'traduccion_pregunta': 'Volumen arriba, textura natural, sin producto, estilo desenfadado',
      'contexto_es': 'La descripción perfecta del look moderno que piden los jóvenes',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente describe su estilo — opciones SOLO L01–L13 ✓
    // Respuesta correcta: Of course (L01) + Natural texture · no product · messy style (L13)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente describe su estilo — ¿qué le confirmas?',
      'quien_habla': '¡Habla de estilo! 💈',
      'frase': 'Volume on top, no product, natural',
      'traduccion_pregunta': 'Volumen arriba, sin producto, natural',
      'cliente_dice': 'Volume on top, no product, natural',
      'traduccion_cliente': 'Volumen arriba, sin producto, natural',
      'respuesta_correcta': 'Of course! Natural texture, no product, messy style',
      'traduccion_respuesta': '¡Claro! Textura natural, sin producto, estilo desenfadado',
      'opciones_barbero': [
        'Of course! Natural texture, no product, messy style',
        'Do you have an appointment?',
        'Clean beard, shape the sideburns',
        'Water or coffee while you wait?',
      ],
      'contexto_es':
          'Of course (L01) + Natural texture · No product · Messy style (L13) — '
          'confirmas el look exacto que el cliente quiere',
    },

  ],
);
