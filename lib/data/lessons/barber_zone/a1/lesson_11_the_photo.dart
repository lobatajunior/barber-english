import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L10):
//   L05: Son · Move · Patient · Photo · Modern
//   L06: Number one · Short · Long · Same · Little
//   L10: Still · Look down · Turn · Head · Careful
//   (más L01·L02·L03·L04·L07·L08·L09 siempre disponibles)
//
// Palabras NUEVAS L11 (en orden de enseñanza):
//   1. Like       [ LAIK ]       → Como / Así
//   2. Similar    [ SI-mi-lar ]  → Similar / Parecido
//   3. Possible   [ PO-si-bol ]  → Posible
//   4. Different  [ DI-fer-ent ] → Diferente
//   5. Close      [ KLOUS ]      → Pegado / Muy corto (nivel máquina)

const lesson11ThePhoto = Lesson(
  id: 11,
  title: 'The Photo',
  description: 'El cliente llega con una foto de referencia',
  emoji: '📸',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a hablar sobre la foto de referencia que trae el cliente: '
      'si es posible, si el resultado será similar, '
      'y cómo ajustar cuando no es exactamente igual.',
  motivacionEs:
      '¡La foto de referencia es el idioma universal del barbero — '
      'ahora también lo hablarás en inglés! 📸',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L10 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L10 · L05 · L09 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Head · Patient · Fresh',
      'traduccion_pregunta': 'Cabeza · Paciente · Fresco',
      'parejas_ingles': ['Head', 'Patient', 'Fresh'],
      'parejas_espanol': ['Cabeza', 'Paciente', 'Fresco'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L10 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la instrucción al niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be ___, look down, careful',
      'traduccion_pregunta': 'Por favor quédate quieto, mira abajo, con cuidado',
      'respuesta_correcta': 'still',
      'opciones': ['still', 'careful', 'head', 'turn'],
      'contexto_es': 'Repaso de L10 — instrucciones al niño en tu silla',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L10+L05 ─────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia completa de instrucciones',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be still, son, turn your head, careful',
      'respuesta_correcta': 'Please be still, son, turn your head, careful',
      'fonetica': '[ pliis bi STIL, SON, TORN ior JED, KEIR-ful ]',
      'traduccion_pregunta': 'Por favor quédate quieto, hijo, voltea la cabeza, con cuidado',
      'contexto_es': 'Combinas L10 y L05 — la secuencia perfecta con el niño',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L11 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Like" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo el cliente compara con la foto',
      'quien_habla': 'El cliente dice',
      'frase': 'Like',
      'fonetica': '[ LAIK ]',
      'traduccion_pregunta': 'Como / Así',
      'contexto_es': '"Like the photo" — como en la foto',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Like" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Like',
      'respuesta_correcta': 'Like',
      'fonetica': '[ LAIK ]',
      'traduccion_pregunta': 'Como / Así',
      'contexto_es': '"Like this" o "like the photo" — así lo pide el cliente',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Similar" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo describes el resultado respecto a la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Similar',
      'fonetica': '[ SI-mi-lar ]',
      'traduccion_pregunta': 'Similar / Parecido',
      'contexto_es': 'El resultado será parecido a la foto, no exactamente igual',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Similar" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Similar',
      'respuesta_correcta': 'Similar',
      'fonetica': '[ SI-mi-lar ]',
      'traduccion_pregunta': 'Similar / Parecido',
      'contexto_es': '"Similar to the photo" — gestionas las expectativas del cliente',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Possible" ──────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo confirmas que el corte es alcanzable',
      'quien_habla': 'Tú le dices',
      'frase': 'Possible',
      'fonetica': '[ PO-si-bol ]',
      'traduccion_pregunta': 'Posible',
      'contexto_es': 'Confirmas que puedes hacer algo parecido a la foto',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Possible" ────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Possible',
      'respuesta_correcta': 'Possible',
      'fonetica': '[ PO-si-bol ]',
      'traduccion_pregunta': 'Posible',
      'contexto_es': '"Possible!" — una sola palabra que tranquiliza al cliente',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L11: Like · Similar · Possible
    {
      'tipo': 'completar',
      'instruccion': 'Completa la respuesta al cliente con la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Like the photo, ___ style',
      'traduccion_pregunta': 'Como la foto, estilo similar',
      'respuesta_correcta': 'similar',
      'opciones': ['similar', 'like', 'possible', 'modern'],
      'contexto_es': 'Confirmas que el resultado se parecerá a la foto',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Different" ─────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo explicas que el resultado no será idéntico',
      'quien_habla': 'Tú le dices',
      'frase': 'Different',
      'fonetica': '[ DI-fer-ent ]',
      'traduccion_pregunta': 'Diferente',
      'contexto_es': 'El cabello o el largo es diferente a la foto',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Different" ───────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Different',
      'respuesta_correcta': 'Different',
      'fonetica': '[ DI-fer-ent ]',
      'traduccion_pregunta': 'Diferente',
      'contexto_es': '"A little different" — honestidad que genera confianza',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Close" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo describes el nivel corto de la máquina',
      'quien_habla': 'Tú le dices',
      'frase': 'Close',
      'fonetica': '[ KLOUS ]',
      'traduccion_pregunta': 'Pegado / Muy corto',
      'contexto_es': '"Close" = muy pegado a la piel, nivel muy bajo de máquina',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Close" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Close',
      'respuesta_correcta': 'Close',
      'fonetica': '[ KLOUS ]',
      'traduccion_pregunta': 'Pegado / Muy corto',
      'contexto_es': '"Not too close" — no demasiado pegado, un poco más largo',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L11 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Like · Similar · Possible · Different · Close',
      'traduccion_pregunta': 'Como · Similar · Posible · Diferente · Pegado',
      'parejas_ingles': ['Like', 'Similar', 'Possible', 'Different', 'Close'],
      'parejas_espanol': ['Como', 'Similar', 'Posible', 'Diferente', 'Pegado'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L11 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la valoración de la foto',
      'quien_habla': 'Tú le dices',
      'frase': '___ to the photo, possible!',
      'traduccion_pregunta': '¡Similar a la foto, posible!',
      'respuesta_correcta': 'similar',
      'opciones': ['similar', 'like', 'possible', 'close'],
      'contexto_es': 'Confirmas que el corte de la foto es posible',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Like · photo (L05) · number (L06) · one (L06) · short (L06) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la confirmación del corte de la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Like the photo, number one, short',
      'traduccion_pregunta': 'Como la foto, número uno, corto',
      'palabras': ['like', 'the', 'photo', 'number', 'one', 'short'],
      'respuesta_correcta': 'like the photo number one short',
      'contexto_es': 'Combinas L11 y L06 para confirmar el nivel del corte',
    },

    // ── EJ 18 · ORDENAR REPASO L06+L11 ────────────────────────────────────
    // Short (L06) + on the sides (L03) + similar to the photo (L11) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción completa del corte de la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Short on the sides, similar to the photo',
      'traduccion_pregunta': 'Corto en los lados, similar a la foto',
      'palabras': ['short', 'on', 'the', 'sides', 'similar', 'to', 'the', 'photo'],
      'respuesta_correcta': 'short on the sides similar to the photo',
      'contexto_es': 'Combinas L06 y L11 — el corte de la foto con sus detalles',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L11 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la respuesta completa al cliente con la foto',
      'quien_habla': 'Tú le dices',
      'frase': 'Like the photo, similar, possible! Number one, short on the sides',
      'respuesta_correcta': 'Like the photo, similar, possible! Number one, short on the sides',
      'fonetica': '[ laik de FOU-tou, SI-mi-lar, PO-si-bol, NOM-ber WAN, SHORT on de SAIDS ]',
      'traduccion_pregunta': '¡Como la foto, similar, posible! Número uno, corto en los lados',
      'contexto_es': 'La respuesta completa que inspira confianza al cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente muestra foto — opciones SOLO L01–L11 ✓
    // Respuesta correcta: Of course (L01) + Similar · possible (L11) + number one · short (L06)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente muestra una foto — ¿qué le respondes?',
      'quien_habla': '¡El cliente llega con foto! 📸',
      'frase': 'Like this photo, similar, possible?',
      'traduccion_pregunta': '¿Como esta foto, similar, posible?',
      'cliente_dice': 'Like this photo, similar, possible?',
      'traduccion_cliente': '¿Como esta foto, similar, posible?',
      'respuesta_correcta': 'Of course! Similar to the photo, number one, short on the sides',
      'traduccion_respuesta': '¡Claro! Similar a la foto, número uno, corto en los lados',
      'opciones_barbero': [
        'Of course! Similar to the photo, number one, short on the sides',
        'Do you have an appointment?',
        'Please be still, turn your head, careful',
        'Water or coffee while you wait?',
      ],
      'contexto_es':
          'Of course (L01) + Similar · possible (L11) + Number one · short on the sides (L06) — '
          'confirmas el corte de la foto con confianza',
    },

  ],
);
