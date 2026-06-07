import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L05):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//   L05: Son · Move · Patient · Photo · Modern
//
// Palabras NUEVAS L06 (en orden de enseñanza):
//   1. Number one   [ NOM-ber WAN ]   → Número uno
//   2. Short        [ SHORT ]          → Corto
//   3. Long         [ LONG ]           → Largo
//   4. Same         [ SEIM ]           → Igual
//   5. Little       [ LI-tel ]         → Poco / Un poco

const lesson06NumbersLengths = Lesson(
  id: 6,
  title: 'Numbers & Lengths',
  description: 'Habla del largo y nivel del corte',
  emoji: '📏',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a entender cuando el cliente describe el largo exacto '
      'que quiere: el número de la máquina, si quiere corto o largo y '
      'si quiere igual que la última vez.',
  motivacionEs:
      '¡Entender el largo en inglés elimina los malentendidos '
      'y te hace ver como el barbero más profesional del barrio! 📏',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L05 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // Una palabra de L03, L04 y L05 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Haircut · No problem · Modern',
      'traduccion_pregunta': 'Corte de cabello · No hay problema · Moderno',
      'parejas_ingles': ['Haircut', 'No problem', 'Modern'],
      'parejas_espanol': ['Corte de cabello', 'No hay problema', 'Moderno'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L03+L05 ──────────────────────────────────
    // Frase usa L03 + L05 — opciones de L03 y L05 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la petición del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'A modern ___, please',
      'traduccion_pregunta': 'Un corte moderno, por favor',
      'respuesta_correcta': 'haircut',
      'opciones': ['haircut', 'fade', 'photo', 'modern'],
      'contexto_es': 'Repaso de L03 + L05 — el cliente pide su estilo',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L04+L05 ─────────────────────────────
    // No problem (L04) + Modern haircut (L03+L05) + please wait (L04) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la respuesta al cliente que pide un corte moderno',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Modern haircut, please wait',
      'respuesta_correcta': 'No problem! Modern haircut, please wait',
      'fonetica': '[ nou PROB-lem, MOD-ern JEAR-kat, pliis WEIT ]',
      'traduccion_pregunta': '¡No hay problema! Corte moderno, por favor espere',
      'contexto_es': 'Combinas L04 y L05 — gestionas al cliente que quiere algo moderno',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L06 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Number one" ───────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el nivel más común de la máquina',
      'quien_habla': 'El cliente dice',
      'frase': 'Number one',
      'fonetica': '[ NOM-ber WAN ]',
      'traduccion_pregunta': 'Número uno',
      'contexto_es': 'El nivel de máquina más pedido en barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Number one" ─────────────────────────────
    // Disponibles L06: Number one
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Number one',
      'respuesta_correcta': 'Number one',
      'fonetica': '[ NOM-ber WAN ]',
      'traduccion_pregunta': 'Número uno',
      'contexto_es': '¿Desde qué número te gustaría hacerte tu corte?',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Short" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo pide poco largo',
      'quien_habla': 'El cliente dice',
      'frase': 'Short',
      'fonetica': '[ SHORT ]',
      'traduccion_pregunta': 'Corto',
      'contexto_es': 'El cliente quiere los lados bien cortos',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Short" ───────────────────────────────────
    // Disponibles L06: Number one · Short
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Short',
      'respuesta_correcta': 'Short',
      'fonetica': '[ SHORT ]',
      'traduccion_pregunta': 'Corto',
      'contexto_es': '"Short on the sides" — una de las frases más escuchadas en tu silla',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Long" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo pide más largo',
      'quien_habla': 'El cliente dice',
      'frase': 'Long',
      'fonetica': '[ LONG ]',
      'traduccion_pregunta': 'Largo',
      'contexto_es': 'El cliente quiere mantener el largo arriba',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Long" ────────────────────────────────────
    // Disponibles L06: Number one · Short · Long
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Long',
      'respuesta_correcta': 'Long',
      'fonetica': '[ LONG ]',
      'traduccion_pregunta': 'Largo',
      'contexto_es': '"Long on top" — siempre lo escucharás junto con "short on the sides"',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L06: Number one · Short · Long
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, ___ on top',
      'traduccion_pregunta': 'Corto en los lados, largo arriba',
      'respuesta_correcta': 'long',
      'opciones': ['long', 'short', 'longer', 'fade'],
      'contexto_es': 'El cliente describe exactamente lo que quiere',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Same" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cuando el cliente quiere igual que antes',
      'quien_habla': 'El cliente dice',
      'frase': 'Same',
      'fonetica': '[ SEIM ]',
      'traduccion_pregunta': 'Igual',
      'contexto_es': 'El cliente de confianza que siempre pide lo mismo',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Same" ────────────────────────────────────
    // Disponibles L06: Number one · Short · Long · Same
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Same',
      'respuesta_correcta': 'Same',
      'fonetica': '[ SEIM ]',
      'traduccion_pregunta': 'Igual',
      'contexto_es': '"Same as last time" — el cliente de confianza que repite siempre',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Little" ────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cuando quiere que le cortes solo un poco',
      'quien_habla': 'El cliente dice',
      'frase': 'Little',
      'fonetica': '[ LI-tel ]',
      'traduccion_pregunta': 'Poco / Un poco',
      'contexto_es': 'El cliente quiere que le quites solo un poquito',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Little" ──────────────────────────────────
    // Disponibles L06: las 5 nuevas
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Little',
      'respuesta_correcta': 'Little',
      'fonetica': '[ LI-tel ]',
      'traduccion_pregunta': 'Poco / Un poco',
      'contexto_es': '"A little shorter" — más amable que pedir "very short"',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L06 ───────────────────────────────
    // Las 5 palabras nuevas de L06 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Number one · Short · Long · Same · Little',
      'traduccion_pregunta': 'Número uno · Corto · Largo · Igual · Poco',
      'parejas_ingles': ['Number one', 'Short', 'Long', 'Same', 'Little'],
      'parejas_espanol': ['Número uno', 'Corto', 'Largo', 'Igual', 'Poco'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Frase usa Short (L06) + all 5 available / opciones L06 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, a ___ long on top',
      'traduccion_pregunta': 'Corto en los lados, un poco largo arriba',
      'respuesta_correcta': 'little',
      'opciones': ['little', 'long', 'same', 'short'],
      'contexto_es': 'El cliente pide precisión — un poco largo, no mucho',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Short · Long (L06) + on · the · sides · top (L03) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción del largo del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, long on top',
      'traduccion_pregunta': 'Corto en los lados, largo arriba',
      'palabras': ['short', 'on', 'the', 'sides', 'long', 'on', 'top'],
      'respuesta_correcta': 'short on the sides long on top',
      'contexto_es': 'La frase más clásica del mundo de la barbería',
    },

    // ── EJ 18 · ORDENAR REPASO L03+L06 ────────────────────────────────────
    // Number one (L06) + on the sides (L03) + longer on top (L03) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la petición completa del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'Number one on the sides, longer on top',
      'traduccion_pregunta': 'Número uno en los lados, más largo arriba',
      'palabras': ['Number', 'one', 'on', 'the', 'sides', 'longer', 'on', 'top'],
      'respuesta_correcta': 'Number one on the sides longer on top',
      'contexto_es': 'Combinas L06 y L03 — el cliente describe su corte completo',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa ────────────────────────────
    // Short · little · long (L06) + on the sides / on top (L03) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción completa del largo',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, a little long on top, please',
      'respuesta_correcta': 'Short on the sides, a little long on top, please',
      'fonetica': '[ SHORT on de SAIDS, a LI-tel LONG on TOP, pliis ]',
      'traduccion_pregunta': 'Corto en los lados, un poco largo arriba, por favor',
      'contexto_es': 'La descripción más completa y natural que aprenderás en L06',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente describe el largo — opciones SOLO L01–L06 ✓
    // Respuesta correcta: Of course (L01) + Number one · Short on the sides (L06)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente te describe el largo — ¿qué le respondes?',
      'quien_habla': '¡Habla del largo del corte! 🏆',
      'frase': 'Short on the sides, a little long on top, please',
      'traduccion_pregunta': 'Corto en los lados, un poco largo arriba, por favor',
      'cliente_dice': 'Short on the sides, a little long on top, please',
      'traduccion_cliente': 'Corto en los lados, un poco largo arriba, por favor',
      'respuesta_correcta': 'Of course! Number one, short on the sides',
      'traduccion_respuesta': '¡Claro! Número uno, corto en los lados',
      'opciones_barbero': [
        'Of course! Number one, short on the sides',
        'Do you have an appointment?',
        'No problem, please wait',
        'Sit down, nice to meet you',
      ],
      'contexto_es':
          'Of course (L01) + Number one · Short on the sides (L06) — '
          'confirmas el largo del corte con precisión',
    },

  ],
);
