import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L07):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//   L05: Son · Move · Patient · Photo · Modern
//   L06: Number one · Short · Long · Same · Little
//   L07: Water · Coffee · Drink · While · Something
//
// Palabras NUEVAS L08 (en orden de enseñanza):
//   1. Scissors  [ SI-sors ]   → Tijera
//   2. Classic   [ KLA-sik ]   → Clásico
//   3. Style     [ STAIL ]     → Estilo
//   4. Comb      [ KOUM ]      → Peine
//   5. Neat      [ NIIT ]      → Prolijo / Bien hecho

const lesson08ScissorsCut = Lesson(
  id: 8,
  title: 'Scissors Cut',
  description: 'El corte con tijera — clásico y preciso',
  emoji: '✂️',
  level: Level.A1,
  descripcionEs:
      'Aprenderás el vocabulario del corte clásico con tijera: '
      'cómo el cliente lo pide y cómo tú confirmas el estilo prolijo que va a recibir.',
  motivacionEs:
      '¡El corte clásico con tijera nunca pasa de moda — '
      'y saber pedirlo en inglés te abre las puertas del mundo! ✂️',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L07 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L03 · L05 · L07 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Haircut · Modern · Coffee',
      'traduccion_pregunta': 'Corte de cabello · Moderno · Café',
      'parejas_ingles': ['Haircut', 'Modern', 'Coffee'],
      'parejas_espanol': ['Corte de cabello', 'Moderno', 'Café'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L07 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la oferta al cliente que espera',
      'quien_habla': 'Tú le dices',
      'frase': 'Water or coffee ___ you wait?',
      'traduccion_pregunta': '¿Agua o café mientras espera?',
      'respuesta_correcta': 'while',
      'opciones': ['while', 'drink', 'water', 'coffee'],
      'contexto_es': 'Repaso de L07 — la hospitalidad en tu barbería',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L01+L07 ─────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la bienvenida con oferta de bebida',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! Water or coffee while you wait',
      'respuesta_correcta': 'Of course! Water or coffee while you wait',
      'fonetica': '[ of KORS, WO-ter or KO-fi wail iu WEIT ]',
      'traduccion_pregunta': '¡Claro! Agua o café mientras espera',
      'contexto_es': 'Combinas L01 y L07 — bienvenida con hospitalidad',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L08 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Scissors" ──────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la herramienta del corte clásico',
      'quien_habla': 'El cliente dice',
      'frase': 'Scissors',
      'fonetica': '[ SI-sors ]',
      'traduccion_pregunta': 'Tijera',
      'contexto_es': 'El cliente pide que le cortes con tijera, sin máquina',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Scissors" ────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Scissors',
      'respuesta_correcta': 'Scissors',
      'fonetica': '[ SI-sors ]',
      'traduccion_pregunta': 'Tijera',
      'contexto_es': '"Scissors only" — solo tijera, sin máquina',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Classic" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el estilo más elegante de la barbería',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic',
      'fonetica': '[ KLA-sik ]',
      'traduccion_pregunta': 'Clásico',
      'contexto_es': 'El cliente quiere un corte atemporal y elegante',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Classic" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic',
      'respuesta_correcta': 'Classic',
      'fonetica': '[ KLA-sik ]',
      'traduccion_pregunta': 'Clásico',
      'contexto_es': '"Classic haircut" — el corte que nunca falla',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Style" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra que resume la apariencia final',
      'quien_habla': 'El cliente dice',
      'frase': 'Style',
      'fonetica': '[ STAIL ]',
      'traduccion_pregunta': 'Estilo',
      'contexto_es': 'El "style" es el resultado visual que busca el cliente',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Style" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Style',
      'respuesta_correcta': 'Style',
      'fonetica': '[ STAIL ]',
      'traduccion_pregunta': 'Estilo',
      'contexto_es': '"Classic style" — estilo clásico, elegante y prolijo',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L08: Scissors · Classic · Style
    {
      'tipo': 'completar',
      'instruccion': 'Completa la petición del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'A ___ haircut, please',
      'traduccion_pregunta': 'Un corte clásico, por favor',
      'respuesta_correcta': 'classic',
      'opciones': ['classic', 'modern', 'style', 'scissors'],
      'contexto_es': 'El cliente pide el estilo que quiere',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Comb" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la herramienta que acompaña a la tijera',
      'quien_habla': 'Tú le dices',
      'frase': 'Comb',
      'fonetica': '[ KOUM ]',
      'traduccion_pregunta': 'Peine',
      'contexto_es': 'Tijera y peine — el dúo del corte clásico perfecto',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Comb" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Comb',
      'respuesta_correcta': 'Comb',
      'fonetica': '[ KOUM ]',
      'traduccion_pregunta': 'Peine',
      'contexto_es': 'La "b" en "comb" no se pronuncia — recuérdalo',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Neat" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo describes un corte prolijo y bien terminado',
      'quien_habla': 'Tú le dices',
      'frase': 'Neat',
      'fonetica': '[ NIIT ]',
      'traduccion_pregunta': 'Prolijo / Bien hecho',
      'contexto_es': '"Neat" = limpio, ordenado, bien terminado',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Neat" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Neat',
      'respuesta_correcta': 'Neat',
      'fonetica': '[ NIIT ]',
      'traduccion_pregunta': 'Prolijo / Bien hecho',
      'contexto_es': '"Neat style" — así describes el resultado perfecto al cliente',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L08 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Scissors · Classic · Style · Comb · Neat',
      'traduccion_pregunta': 'Tijera · Clásico · Estilo · Peine · Prolijo',
      'parejas_ingles': ['Scissors', 'Classic', 'Style', 'Comb', 'Neat'],
      'parejas_espanol': ['Tijera', 'Clásico', 'Estilo', 'Peine', 'Prolijo'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L08 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del estilo',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic ___, scissors, neat',
      'traduccion_pregunta': 'Estilo clásico, tijera, prolijo',
      'respuesta_correcta': 'style',
      'opciones': ['style', 'haircut', 'comb', 'modern'],
      'contexto_es': 'El cliente describe su estilo favorito con precisión',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Classic · haircut (L03) · neat · style (L08) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción del corte clásico',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic haircut, neat style',
      'traduccion_pregunta': 'Corte clásico, estilo prolijo',
      'palabras': ['classic', 'haircut', 'neat', 'style'],
      'respuesta_correcta': 'classic haircut neat style',
      'contexto_es': 'La descripción perfecta del corte clásico',
    },

    // ── EJ 18 · ORDENAR REPASO L05+L08 ────────────────────────────────────
    // Modern (L05) + style · comb · no · problem (L04+L08) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la confirmación del barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Modern style, comb, no problem',
      'traduccion_pregunta': 'Estilo moderno, peine, no hay problema',
      'palabras': ['modern', 'style', 'comb', 'no', 'problem'],
      'respuesta_correcta': 'modern style comb no problem',
      'contexto_es': 'Combinas L05 y L08 — confirmas el estilo con calma',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L08 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la confirmación del corte clásico',
      'quien_habla': 'Tú le dices',
      'frase': 'Classic haircut, comb, scissors, neat style',
      'respuesta_correcta': 'Classic haircut, comb, scissors, neat style',
      'fonetica': '[ KLA-sik JEAR-kat, KOUM, SI-sors, NIIT STAIL ]',
      'traduccion_pregunta': 'Corte clásico, peine, tijera, estilo prolijo',
      'contexto_es': 'Así confirmas el estilo completo al cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente pide corte clásico — opciones SOLO L01–L08 ✓
    // Respuesta correcta: Of course (L01) + Classic haircut · scissors · neat (L08)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pide un corte clásico con tijera — ¿qué le respondes?',
      'quien_habla': '¡Primer cliente con corte clásico! 🏆',
      'frase': 'Classic style, scissors, please',
      'traduccion_pregunta': 'Estilo clásico, tijera, por favor',
      'cliente_dice': 'Classic style, scissors, please',
      'traduccion_cliente': 'Estilo clásico, tijera, por favor',
      'respuesta_correcta': 'Of course! Classic haircut, scissors, neat style',
      'traduccion_respuesta': '¡Claro! Corte clásico, tijera, estilo prolijo',
      'opciones_barbero': [
        'Of course! Classic haircut, scissors, neat style',
        'Do you have an appointment?',
        'Water or coffee while you wait?',
        'Short on the sides, long on top',
      ],
      'contexto_es':
          'Of course (L01) + Classic haircut · Scissors · Neat style (L08) — '
          'confirmas el corte clásico con profesionalismo',
    },

  ],
);
