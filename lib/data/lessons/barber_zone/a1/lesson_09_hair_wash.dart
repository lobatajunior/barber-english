import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L08):
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//   L07: Water · Coffee · Drink · While · Something
//   L08: Scissors · Classic · Style · Comb · Neat
//   (más L01·L02·L05·L06 siempre disponibles)
//
// Palabras NUEVAS L09 (en orden de enseñanza):
//   1. Wash    [ WOSH ]    → Lavar
//   2. Hair    [ JEIR ]    → Cabello
//   3. Fresh   [ FRESH ]   → Fresco
//   4. Ready   [ RE-di ]   → Listo
//   5. Street  [ STRIIT ]  → Calle

const lesson09HairWash = Lesson(
  id: 9,
  title: 'Hair Wash',
  description: 'El lavado de cabello al final del corte',
  emoji: '🚿',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a ofrecer y confirmar el lavado de cabello: '
      'cómo el cliente lo pide y cómo tú anuncias que está listo, '
      'fresco y listo para salir a la calle.',
  motivacionEs:
      '¡Un lavado al final es el toque de lujo que los clientes recuerdan! 🚿',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L08 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L03 · L07 · L08 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Fade · Water · Classic',
      'traduccion_pregunta': 'Degradado · Agua · Clásico',
      'parejas_ingles': ['Fade', 'Water', 'Classic'],
      'parejas_espanol': ['Degradado', 'Agua', 'Clásico'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L08 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del corte clásico',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic ___, scissors, neat',
      'traduccion_pregunta': 'Estilo clásico, tijera, prolijo',
      'respuesta_correcta': 'style',
      'opciones': ['style', 'haircut', 'comb', 'modern'],
      'contexto_es': 'Repaso de L08 — el corte clásico con tijera',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L08 ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la confirmación del corte clásico',
      'quien_habla': 'Tú le dices',
      'frase': 'Classic haircut, comb, scissors, neat style',
      'respuesta_correcta': 'Classic haircut, comb, scissors, neat style',
      'fonetica': '[ KLA-sik JEAR-kat, KOUM, SI-sors, NIIT STAIL ]',
      'traduccion_pregunta': 'Corte clásico, peine, tijera, estilo prolijo',
      'contexto_es': 'Repaso de L08 — confirmas el estilo al cliente',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L09 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Wash" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la acción de lavar el cabello',
      'quien_habla': 'Tú le dices',
      'frase': 'Wash',
      'fonetica': '[ WOSH ]',
      'traduccion_pregunta': 'Lavar',
      'contexto_es': '"Wash your hair?" — ¿te lavamos el cabello?',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Wash" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Wash',
      'respuesta_correcta': 'Wash',
      'fonetica': '[ WOSH ]',
      'traduccion_pregunta': 'Lavar',
      'contexto_es': 'El servicio adicional que más valoran los clientes',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Hair" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la palabra que une lavado y cabello',
      'quien_habla': 'El cliente dice',
      'frase': 'Hair',
      'fonetica': '[ JEIR ]',
      'traduccion_pregunta': 'Cabello',
      'contexto_es': '"Wash my hair" — lavar mi cabello',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Hair" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'El cliente dice',
      'frase': 'Hair',
      'respuesta_correcta': 'Hair',
      'fonetica': '[ JEIR ]',
      'traduccion_pregunta': 'Cabello',
      'contexto_es': '"Haircut" ya lo sabías — ahora aprende "hair" solo',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Fresh" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo sale el cliente de tu silla',
      'quien_habla': 'Tú le dices',
      'frase': 'Fresh',
      'fonetica': '[ FRESH ]',
      'traduccion_pregunta': 'Fresco',
      'contexto_es': 'El cliente sale de tu silla sintiéndose renovado',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Fresh" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Fresh',
      'respuesta_correcta': 'Fresh',
      'fonetica': '[ FRESH ]',
      'traduccion_pregunta': 'Fresco',
      'contexto_es': '"Fresh" = limpio, renovado, listo para brillar',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L09: Wash · Hair · Fresh
    {
      'tipo': 'completar',
      'instruccion': 'Completa la oferta al cliente',
      'quien_habla': 'Tú le dices',
      'frase': '___ your hair, please?',
      'traduccion_pregunta': '¿Le lavamos el cabello, por favor?',
      'respuesta_correcta': 'wash',
      'opciones': ['wash', 'hair', 'fresh', 'comb'],
      'contexto_es': 'Ofreces el lavado de cabello al cliente',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Ready" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo anuncias que el trabajo está terminado',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready',
      'fonetica': '[ RE-di ]',
      'traduccion_pregunta': 'Listo',
      'contexto_es': 'Anuncias que el cliente está listo para salir',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Ready" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready',
      'respuesta_correcta': 'Ready',
      'fonetica': '[ RE-di ]',
      'traduccion_pregunta': 'Listo',
      'contexto_es': '"Ready!" — la palabra que más les gusta escuchar a tus clientes',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Street" ────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha el destino del cliente después del corte',
      'quien_habla': 'Tú le dices',
      'frase': 'Street',
      'fonetica': '[ STRIIT ]',
      'traduccion_pregunta': 'Calle',
      'contexto_es': '"Fresh for the street" — listo para salir a la calle',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Street" ──────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Street',
      'respuesta_correcta': 'Street',
      'fonetica': '[ STRIIT ]',
      'traduccion_pregunta': 'Calle',
      'contexto_es': '"Fresh for the street" — la frase con la que el cliente se va feliz',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L09 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Wash · Hair · Fresh · Ready · Street',
      'traduccion_pregunta': 'Lavar · Cabello · Fresco · Listo · Calle',
      'parejas_ingles': ['Wash', 'Hair', 'Fresh', 'Ready', 'Street'],
      'parejas_espanol': ['Lavar', 'Cabello', 'Fresco', 'Listo', 'Calle'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L09 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa el anuncio final al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready! Fresh, wash hair, ___',
      'traduccion_pregunta': '¡Listo! Fresco, cabello lavado, calle',
      'respuesta_correcta': 'street',
      'opciones': ['street', 'fresh', 'wash', 'ready'],
      'contexto_es': 'Así anuncias que el cliente está listo para salir',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Wash · hair · fresh · street (L09) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la despedida del barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Wash hair, fresh, ready, street',
      'traduccion_pregunta': 'Cabello lavado, fresco, listo, a la calle',
      'palabras': ['wash', 'hair', 'fresh', 'ready', 'street'],
      'respuesta_correcta': 'wash hair fresh ready street',
      'contexto_es': 'Las palabras del final del servicio',
    },

    // ── EJ 18 · ORDENAR REPASO L04+L09 ────────────────────────────────────
    // No problem (L04) + wash · hair · fresh · ready (L09) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la respuesta completa al cliente que pide lavado',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem, wash hair, fresh, ready',
      'traduccion_pregunta': 'No hay problema, lavamos el cabello, fresco, listo',
      'palabras': ['No', 'problem', 'wash', 'hair', 'fresh', 'ready'],
      'respuesta_correcta': 'No problem wash hair fresh ready',
      'contexto_es': 'Combinas L04 y L09 — confirmas el lavado con calma',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L09 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el anuncio final al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready! Wash your hair, fresh for the street',
      'respuesta_correcta': 'Ready! Wash your hair, fresh for the street',
      'fonetica': '[ RE-di, WOSH ior JEIR, FRESH for de STRIIT ]',
      'traduccion_pregunta': '¡Listo! Le lavamos el cabello, fresco para salir a la calle',
      'contexto_es': 'La frase con la que el cliente sale de tu silla con una sonrisa',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente pide lavado — opciones SOLO L01–L09 ✓
    // Respuesta correcta: Of course (L01) + Wash hair · fresh · ready (L09)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente pide que le laves el cabello — ¿qué le dices?',
      'quien_habla': '¡Lavado de cabello! 🏆',
      'frase': 'Wash my hair, please',
      'traduccion_pregunta': 'Lávame el cabello, por favor',
      'cliente_dice': 'Wash my hair, please',
      'traduccion_cliente': 'Lávame el cabello, por favor',
      'respuesta_correcta': 'Of course! Wash hair, fresh, ready',
      'traduccion_respuesta': '¡Claro! Lavamos el cabello, fresco, listo',
      'opciones_barbero': [
        'Of course! Wash hair, fresh, ready',
        'Do you have an appointment?',
        'Something to drink while you wait?',
        'Classic style, scissors, no problem',
      ],
      'contexto_es':
          'Of course (L01) + Wash hair · Fresh · Ready (L09) — '
          'confirmas el lavado y preparas al cliente para salir',
    },

  ],
);
