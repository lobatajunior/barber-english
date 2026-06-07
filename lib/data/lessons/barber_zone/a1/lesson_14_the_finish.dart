import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L13):
//   L09: Wash · Hair · Fresh · Ready · Street
//   L13: Volume · Texture · Product · Natural · Messy
//   (más L01–L08·L10·L11·L12 siempre disponibles)
//
// Palabras NUEVAS L14 (en orden de enseñanza):
//   1. Done   [ DON ]    → Listo / Terminado
//   2. Look   [ LUK ]    → Mira / Aspecto
//   3. Great  [ GREIT ]  → Genial / Excelente
//   4. New    [ NIU ]    → Nuevo (como nuevo)
//   5. Happy  [ JA-pi ]  → Contento / Satisfecho

const lesson14TheFinish = Lesson(
  id: 14,
  title: 'The Finish',
  description: 'El momento en que el cliente ve el resultado final',
  emoji: '✨',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las palabras del gran momento: '
      'anunciar que terminaste, mostrar el resultado '
      'y preguntar si el cliente está contento con su nuevo look.',
  motivacionEs:
      '¡Las últimas palabras que escucha el cliente son las que recuerda — '
      'hazlas perfectas en inglés! ✨',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L13 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L13 · L12 · L09 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Volume · Beard · Fresh',
      'traduccion_pregunta': 'Volumen · Barba · Fresco',
      'parejas_ingles': ['Volume', 'Beard', 'Fresh'],
      'parejas_espanol': ['Volumen', 'Barba', 'Fresco'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L13 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la petición del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ on top, no product, natural',
      'traduccion_pregunta': 'Volumen arriba, sin producto, natural',
      'respuesta_correcta': 'volume',
      'opciones': ['volume', 'texture', 'messy', 'product'],
      'contexto_es': 'Repaso de L13 — el cliente describe su estilo',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L13 ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción del estilo moderno',
      'quien_habla': 'El cliente dice',
      'frase': 'Volume on top, natural texture, no product, messy style',
      'respuesta_correcta': 'Volume on top, natural texture, no product, messy style',
      'fonetica': '[ VOL-yum on TOP, NAT-shu-ral TEKS-cher, nou PRO-dakt, ME-si STAIL ]',
      'traduccion_pregunta': 'Volumen arriba, textura natural, sin producto, estilo desenfadado',
      'contexto_es': 'Repaso de L13 — el look moderno completo',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L14 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Done" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra que anuncia el final del servicio',
      'quien_habla': 'Tú le dices',
      'frase': 'Done',
      'fonetica': '[ DON ]',
      'traduccion_pregunta': 'Listo / Terminado',
      'contexto_es': '"Done!" — el momento más satisfactorio del servicio',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Done" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Done',
      'respuesta_correcta': 'Done',
      'fonetica': '[ DON ]',
      'traduccion_pregunta': 'Listo / Terminado',
      'contexto_es': 'Una sola sílaba que el cliente espera con ilusión',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Look" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la invitación a ver el resultado',
      'quien_habla': 'Tú le dices',
      'frase': 'Look',
      'fonetica': '[ LUK ]',
      'traduccion_pregunta': 'Mira / Aspecto',
      'contexto_es': '"Look!" — le indicas al cliente que mire en el espejo',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Look" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Look',
      'respuesta_correcta': 'Look',
      'fonetica': '[ LUK ]',
      'traduccion_pregunta': 'Mira / Aspecto',
      'contexto_es': '"Look great" — el resultado tiene un aspecto excelente',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Great" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el cumplido que le haces al resultado',
      'quien_habla': 'Tú le dices',
      'frase': 'Great',
      'fonetica': '[ GREIT ]',
      'traduccion_pregunta': 'Genial / Excelente',
      'contexto_es': '"Look great!" — el resultado es excelente',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Great" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Great',
      'respuesta_correcta': 'Great',
      'fonetica': '[ GREIT ]',
      'traduccion_pregunta': 'Genial / Excelente',
      'contexto_es': '"Look great" — cuando el cliente se ve en el espejo y sonríe',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L14: Done · Look · Great
    {
      'tipo': 'completar',
      'instruccion': 'Completa el anuncio del resultado',
      'quien_habla': 'Tú le dices',
      'frase': '___, look great!',
      'traduccion_pregunta': '¡Listo, se ve genial!',
      'respuesta_correcta': 'done',
      'opciones': ['done', 'look', 'great', 'ready'],
      'contexto_es': 'Las primeras palabras cuando el cliente se ve en el espejo',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "New" ───────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo el cliente sale renovado de tu silla',
      'quien_habla': 'Tú le dices',
      'frase': 'New',
      'fonetica': '[ NIU ]',
      'traduccion_pregunta': 'Nuevo / Como nuevo',
      'contexto_es': '"Like new" — el cliente sale de tu silla como recién estrenado',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "New" ─────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'New',
      'respuesta_correcta': 'New',
      'fonetica': '[ NIU ]',
      'traduccion_pregunta': 'Nuevo / Como nuevo',
      'contexto_es': '"Like new" — el mayor cumplido que puede escuchar un barbero',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Happy" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo preguntas si el cliente está satisfecho',
      'quien_habla': 'Tú le dices',
      'frase': 'Happy',
      'fonetica': '[ JA-pi ]',
      'traduccion_pregunta': 'Contento / Satisfecho',
      'contexto_es': '"Happy?" — la pregunta final que garantiza que el cliente vuelve',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Happy" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Happy',
      'respuesta_correcta': 'Happy',
      'fonetica': '[ JA-pi ]',
      'traduccion_pregunta': 'Contento / Satisfecho',
      'contexto_es': '"Happy?" — una sola palabra que fideliza al cliente',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L14 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Done · Look · Great · New · Happy',
      'traduccion_pregunta': 'Listo · Mira · Genial · Nuevo · Contento',
      'parejas_ingles': ['Done', 'Look', 'Great', 'New', 'Happy'],
      'parejas_espanol': ['Listo', 'Mira', 'Genial', 'Nuevo', 'Contento'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L14 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa el comentario del resultado',
      'quien_habla': 'Tú le dices',
      'frase': 'Look ___, like new!',
      'traduccion_pregunta': '¡Se ve genial, como nuevo!',
      'respuesta_correcta': 'great',
      'opciones': ['great', 'done', 'look', 'happy'],
      'contexto_es': 'El momento en que el cliente se mira en el espejo',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Done · fresh (L09) · like (L11) · new · ready (L09) (L14) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma el anuncio del final del servicio',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Fresh, like new, ready',
      'traduccion_pregunta': '¡Listo! Fresco, como nuevo, listo para salir',
      'palabras': ['done', 'fresh', 'like', 'new', 'ready'],
      'respuesta_correcta': 'done fresh like new ready',
      'contexto_es': 'Combinas L14, L09 y L11 — el anuncio perfecto del final',
    },

    // ── EJ 18 · ORDENAR REPASO L09+L14 ────────────────────────────────────
    // Ready (L09) + look · great · fresh (L09+L14) + like · new (L11+L14) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la despedida completa al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready! Look great, fresh, like new',
      'traduccion_pregunta': '¡Listo! Se ve genial, fresco, como nuevo',
      'palabras': ['Ready', 'look', 'great', 'fresh', 'like', 'new'],
      'respuesta_correcta': 'Ready look great fresh like new',
      'contexto_es': 'Combinas L09 y L14 — la despedida del servicio completo',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L14 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el anuncio completo del final del servicio',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Look great, like new, happy?',
      'respuesta_correcta': 'Done! Look great, like new, happy?',
      'fonetica': '[ DON, luk GREIT, laik NIU, JA-pi ]',
      'traduccion_pregunta': '¡Listo! Se ve genial, como nuevo, ¿contento?',
      'contexto_es': 'La frase perfecta que cierra el servicio y fideliza al cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente reacciona al resultado — opciones SOLO L01–L14 ✓
    // Respuesta correcta: Done (L14) + Look great · Like new · Happy (L14)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente mira el espejo y reacciona — ¿qué le dices tú?',
      'quien_habla': '¡El gran momento! ✨',
      'frase': 'Like new! Happy!',
      'traduccion_pregunta': '¡Como nuevo! ¡Contento!',
      'cliente_dice': 'Like new! Happy!',
      'traduccion_cliente': '¡Como nuevo! ¡Contento!',
      'respuesta_correcta': 'Done! Look great, like new, happy?',
      'traduccion_respuesta': '¡Listo! Se ve genial, como nuevo, ¿contento?',
      'opciones_barbero': [
        'Done! Look great, like new, happy?',
        'Do you have an appointment?',
        'Volume on top, natural texture, no product',
        'Wash hair, fresh, ready, street',
      ],
      'contexto_es':
          'Done · Look great · Like new · Happy (L14) — '
          'el cierre perfecto del servicio que hace volver al cliente',
    },

  ],
);
