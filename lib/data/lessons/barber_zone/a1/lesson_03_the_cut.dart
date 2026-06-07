import '../../../../models/lesson.dart';

// Palabras de REPASO (L01 + L02):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//
// Palabras NUEVAS L03 (en orden de enseñanza):
//   1. Haircut  [ JEAR-kat ]   → Corte de cabello
//   2. Fade     [ FEID ]       → Degradado
//   3. Sides    [ SAIDS ]      → Lados
//   4. Top      [ TOP ]        → Arriba
//   5. Longer   [ LON-ger ]    → Más largo

const lesson03TheCut = Lesson(
  id: 3,
  title: 'The Cut',
  description: 'Entiende lo que el cliente quiere',
  emoji: '✂️',
  level: Level.A1,
  descripcionEs:
      'Aprenderás el vocabulario que necesitas para entender la descripción '
      'del corte: degradado, lados, arriba, más largo. '
      'Cuando el cliente hable, sabrás exactamente qué quiere.',
  motivacionEs:
      '¡Entender el corte en inglés te convierte en el barbero '
      'más profesional del salón! ✂️',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01 + L02 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO L01+L02 ────────────────────────────────────
    // Una de L01, una de L02, una de L02 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Good morning · Take a seat · Nice to meet you',
      'traduccion_pregunta': 'Buenos días · Tome asiento · Mucho gusto',
      'parejas_ingles': ['Good morning', 'Take a seat', 'Nice to meet you'],
      'parejas_espanol': ['Buenos días', 'Tome asiento', 'Mucho gusto'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L01+L02 ──────────────────────────────────
    // Frase usa L01 + L02 — opciones son partes de L02 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa el saludo de bienvenida',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Come in, ___ a seat',
      'traduccion_pregunta': '¡Buenos días! Pase, toma asiento',
      'respuesta_correcta': 'take',
      'opciones': ['take', 'sit', 'my', 'nice'],
      'contexto_es': 'Combina L01 y L02',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L02 ──────────────────────────────────
    // L02 ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia estas dos frases de L02',
      'quien_habla': 'Tú le dices',
      'frase': "What's your name? Nice to meet you",
      'respuesta_correcta': "What's your name? Nice to meet you",
      'fonetica': '[ wots ior NEIM, nais tu miit IU ]',
      'traduccion_pregunta': '¿Cómo te llamas? Mucho gusto',
      'contexto_es': 'El ritmo de la presentación con tu cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L03 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Haircut" ───────────────────────────────────
    // Palabras nuevas: Haircut
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra clave',
      'quien_habla': 'El cliente dice',
      'frase': 'Haircut',
      'fonetica': '[ JEAR-kat ]',
      'traduccion_pregunta': 'Corte de cabello',
      'contexto_es': 'El servicio principal de tu barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Haircut" ─────────────────────────────────
    // Disponibles L03: Haircut
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Haircut',
      'respuesta_correcta': 'Haircut',
      'fonetica': '[ JEAR-kat ]',
      'traduccion_pregunta': 'Corte de cabello',
      'contexto_es': 'Es la palabra que más escucharás en tu silla',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Fade" ──────────────────────────────────────
    // Palabras nuevas: Fade
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el corte más pedido',
      'quien_habla': 'El cliente dice',
      'frase': 'Fade',
      'fonetica': '[ FEID ]',
      'traduccion_pregunta': 'Degradado',
      'contexto_es': 'El corte más pedido en tu barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Fade" ────────────────────────────────────
    // Disponibles L03: Haircut · Fade
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítelo tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Fade',
      'respuesta_correcta': 'Fade',
      'fonetica': '[ FEID ]',
      'traduccion_pregunta': 'Degradado',
      'contexto_es': 'Pronuncia con confianza — es tu especialidad',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Sides" ─────────────────────────────────────
    // Palabras nuevas: Sides
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta parte del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Sides',
      'fonetica': '[ SAIDS ]',
      'traduccion_pregunta': 'Lados',
      'contexto_es': 'Los lados de la cabeza donde va el degradado',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Sides" ───────────────────────────────────
    // Disponibles L03: Haircut · Fade · Sides
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Sides',
      'respuesta_correcta': 'Sides',
      'fonetica': '[ SAIDS ]',
      'traduccion_pregunta': 'Lados',
      'contexto_es': 'Siempre va junto con "fade on the sides"',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L03: Haircut · Fade · Sides
    // Opciones: todas de L03 ✓
    {
      'tipo': 'completar',
      'instruccion': 'El cliente describe su corte',
      'quien_habla': 'El cliente dice',
      'frase': 'I want a ___ on the sides',
      'traduccion_pregunta': 'Quiero un degradado en los lados',
      'respuesta_correcta': 'fade',
      'opciones': ['fade', 'haircut', 'top', 'longer'],
      'contexto_es': 'El cliente describe su corte',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Top" ───────────────────────────────────────
    // Palabras nuevas: Top
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta parte del cabello',
      'quien_habla': 'El cliente dice',
      'frase': 'Top',
      'fonetica': '[ TOP ]',
      'traduccion_pregunta': 'Arriba / La parte de arriba',
      'contexto_es': 'La parte superior del cabello',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Top" ─────────────────────────────────────
    // Disponibles L03: Haircut · Fade · Sides · Top
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Top',
      'respuesta_correcta': 'Top',
      'fonetica': '[ TOP ]',
      'traduccion_pregunta': 'Arriba',
      'contexto_es': 'Siempre va junto con "longer on top"',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Longer" ────────────────────────────────────
    // Palabras nuevas: Longer
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo pide más largo',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer',
      'fonetica': '[ LON-ger ]',
      'traduccion_pregunta': 'Más largo',
      'contexto_es': 'El cliente quiere más largo arriba',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Longer" ──────────────────────────────────
    // Disponibles L03: las 5 nuevas
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Longer',
      'respuesta_correcta': 'Longer',
      'fonetica': '[ LON-ger ]',
      'traduccion_pregunta': 'Más largo',
      'contexto_es': 'Siempre la oirás: "longer on top"',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L03 ───────────────────────────────
    // Las 5 palabras nuevas de L03 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Haircut · Fade · Sides · Top · Longer',
      'traduccion_pregunta':
          'Corte de cabello · Degradado · Lados · Arriba · Más largo',
      'parejas_ingles': ['Haircut', 'Fade', 'Sides', 'Top', 'Longer'],
      'parejas_espanol': [
        'Corte de cabello',
        'Degradado',
        'Lados',
        'Arriba',
        'Más largo',
      ],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Frase y opciones usan SOLO palabras de L03 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Fade on the ___, longer on top',
      'traduccion_pregunta': 'Degradado en los lados, más largo arriba',
      'respuesta_correcta': 'sides',
      'opciones': ['sides', 'fade', 'haircut', 'top'],
      'contexto_es': 'La descripción más común del corte degradado',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Chips: L03 (fade, sides, longer, top) + palabras de apoyo (on, the) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Fade on the sides, longer on top',
      'traduccion_pregunta': 'Degradado en los lados, más largo arriba',
      'palabras': ['fade', 'on', 'the', 'sides', 'longer', 'on', 'top'],
      'respuesta_correcta': 'fade on the sides longer on top',
      'contexto_es': 'La frase exacta que escucharás de tus clientes',
    },

    // ── EJ 18 · ORDENAR con REPASO L02+L03 ────────────────────────────────
    // "What's" + "your" → L02 / "haircut" → L03 / "?" puntación ✓
    // CORRECCIÓN: eliminado "today" (no enseñado) del spec original
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la pregunta sobre el corte',
      'quien_habla': 'Tú le dices',
      'frase': "What's your haircut?",
      'traduccion_pregunta': '¿Cuál es tu corte?',
      'palabras': ["What's", 'your', 'haircut', '?'],
      'respuesta_correcta': "What's your haircut ?",
      'contexto_es': 'Preguntas al cliente qué corte quiere — L02 + L03',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa ────────────────────────────
    // L03 ✓ + palabras de apoyo (on, the)
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción completa del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Fade on the sides, longer on top',
      'respuesta_correcta': 'Fade on the sides, longer on top',
      'fonetica': '[ FEID on de SAIDS, LON-ger on TOP ]',
      'traduccion_pregunta': 'Degradado en los lados, más largo arriba',
      'contexto_es': 'Así describe el cliente el corte perfecto',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Integra L01 + L02 + L03 — usa el intercambio del corte (round 2)
    // porque round 1 ya fue practicado en L02
    // Opciones usan SOLO palabras de L01 + L02 + L03 ✓
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente describe su corte — ¿qué le respondes?',
      'quien_habla': '¡Tu primer cliente de degradado! 🏆',
      'frase': 'Fade on the sides, longer on top, please',
      'traduccion_pregunta': 'Degradado en los lados, más largo arriba, por favor',
      'cliente_dice': 'Fade on the sides, longer on top, please',
      'traduccion_cliente': 'Degradado en los lados, más largo arriba, por favor',
      'respuesta_correcta': 'Of course! Fade on the sides, longer on top',
      'traduccion_respuesta':
          '¡Claro! Degradado en los lados, más largo arriba',
      'opciones_barbero': [
        'Of course! Fade on the sides, longer on top',
        'Nice to meet you',
        'Good morning, haircut',
        'Sit down, take a seat',
      ],
      'contexto_es':
          'Of course (L01) + repetir el corte (L03) — '
          'confirmas que entendiste perfectamente',
    },

  ],
);
