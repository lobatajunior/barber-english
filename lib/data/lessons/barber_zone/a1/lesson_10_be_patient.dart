import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L09):
//   L05: Son · Move · Patient · Photo · Modern
//   L09: Wash · Hair · Fresh · Ready · Street
//   (más L01·L02·L03·L04·L06·L07·L08 siempre disponibles)
//
// Palabras NUEVAS L10 (en orden de enseñanza):
//   1. Still      [ STIL ]      → Quieto / Sin moverse
//   2. Look down  [ luk DAUN ]  → Mira hacia abajo
//   3. Turn       [ TORN ]      → Voltea / Gira
//   4. Head       [ JED ]       → Cabeza
//   5. Careful    [ KEIR-ful ]  → Con cuidado

const lesson10BePatient = Lesson(
  id: 10,
  title: 'Be Patient',
  description: 'Instrucciones al niño en tu silla',
  emoji: '🧒',
  level: Level.A1,
  descripcionEs:
      'Aprenderás a dar instrucciones al niño cliente: '
      'pedirle que se quede quieto, que mire hacia abajo '
      'y que gire la cabeza — todo con calma y paciencia.',
  motivacionEs:
      '¡El barbero que sabe trabajar con niños tiene la agenda llena toda la semana! 🧒',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L09 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L05 · L09 · L06 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Son · Wash · Long',
      'traduccion_pregunta': 'Hijo · Lavar · Largo',
      'parejas_ingles': ['Son', 'Wash', 'Long'],
      'parejas_espanol': ['Hijo', 'Lavar', 'Largo'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L09 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa el anuncio final al cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Wash hair, ___, ready, street',
      'traduccion_pregunta': 'Cabello lavado, fresco, listo, a la calle',
      'respuesta_correcta': 'fresh',
      'opciones': ['fresh', 'wash', 'ready', 'street'],
      'contexto_es': 'Repaso de L09 — el cliente sale fresco de tu silla',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L05+L04 ─────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase de calma para el papá',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be patient, son, no problem',
      'respuesta_correcta': 'Please be patient, son, no problem',
      'fonetica': '[ pliis bi PEI-shent, SON, nou PROB-lem ]',
      'traduccion_pregunta': 'Por favor sea paciente, mi hijo, no hay problema',
      'contexto_es': 'Combinas L05 y L04 — tranquilizas al papá mientras trabajas',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L10 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Still" ─────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo le pides al niño que no se mueva',
      'quien_habla': 'Tú le dices',
      'frase': 'Still',
      'fonetica': '[ STIL ]',
      'traduccion_pregunta': 'Quieto / Sin moverse',
      'contexto_es': '"Please be still" — por favor quédate quieto',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Still" ───────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Still',
      'respuesta_correcta': 'Still',
      'fonetica': '[ STIL ]',
      'traduccion_pregunta': 'Quieto / Sin moverse',
      'contexto_es': '"Be still" — dos palabras que te salvan el corte',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Look down" ────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la instrucción para la nuca del niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Look down',
      'fonetica': '[ luk DAUN ]',
      'traduccion_pregunta': 'Mira hacia abajo',
      'contexto_es': '"Look down" — inclinas la cabeza del niño para la nuca',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "Look down" ───────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Look down',
      'respuesta_correcta': 'Look down',
      'fonetica': '[ luk DAUN ]',
      'traduccion_pregunta': 'Mira hacia abajo',
      'contexto_es': 'Usarás esta frase muchas veces con niños y adultos',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Turn" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo pides que gire la cabeza',
      'quien_habla': 'Tú le dices',
      'frase': 'Turn',
      'fonetica': '[ TORN ]',
      'traduccion_pregunta': 'Voltea / Gira',
      'contexto_es': '"Turn" — voltea para que pueda trabajar el otro lado',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Turn" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Turn',
      'respuesta_correcta': 'Turn',
      'fonetica': '[ TORN ]',
      'traduccion_pregunta': 'Voltea / Gira',
      'contexto_es': '"Turn your head" — voltea la cabeza',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L10: Still · Look down · Turn
    {
      'tipo': 'completar',
      'instruccion': 'Completa la instrucción al niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be ___, son',
      'traduccion_pregunta': 'Por favor quédate quieto, hijo',
      'respuesta_correcta': 'still',
      'opciones': ['still', 'patient', 'move', 'look down'],
      'contexto_es': 'La instrucción más usada con los niños en tu silla',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Head" ──────────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la parte del cuerpo que más diriges en tu trabajo',
      'quien_habla': 'Tú le dices',
      'frase': 'Head',
      'fonetica': '[ JED ]',
      'traduccion_pregunta': 'Cabeza',
      'contexto_es': '"Your head" — la cabeza que tú posicionas para cortar',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Head" ────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Head',
      'respuesta_correcta': 'Head',
      'fonetica': '[ JED ]',
      'traduccion_pregunta': 'Cabeza',
      'contexto_es': '"Turn your head" — la instrucción más usada en la silla',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Careful" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha cómo te anuncias cuando trabajas con tijera cerca',
      'quien_habla': 'Tú le dices',
      'frase': 'Careful',
      'fonetica': '[ KEIR-ful ]',
      'traduccion_pregunta': 'Con cuidado',
      'contexto_es': 'Avisas al niño que te acercas con la tijera',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Careful" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Careful',
      'respuesta_correcta': 'Careful',
      'fonetica': '[ KEIR-ful ]',
      'traduccion_pregunta': 'Con cuidado',
      'contexto_es': '"Careful!" — avisa antes de acercarte con la herramienta',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L10 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Still · Look down · Turn · Head · Careful',
      'traduccion_pregunta': 'Quieto · Mira abajo · Voltea · Cabeza · Con cuidado',
      'parejas_ingles': ['Still', 'Look down', 'Turn', 'Head', 'Careful'],
      'parejas_espanol': ['Quieto', 'Mira abajo', 'Voltea', 'Cabeza', 'Con cuidado'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L10 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la instrucción de posición',
      'quien_habla': 'Tú le dices',
      'frase': 'Turn your ___, careful',
      'traduccion_pregunta': 'Voltea la cabeza, con cuidado',
      'respuesta_correcta': 'head',
      'opciones': ['head', 'still', 'turn', 'careful'],
      'contexto_es': 'Posicionas la cabeza del niño para cortar bien',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Still (L10) + son (L05) + please · be · no · problem (L04+L05) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la instrucción completa para el niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be still, son, no problem',
      'traduccion_pregunta': 'Por favor quédate quieto, hijo, no hay problema',
      'palabras': ['please', 'be', 'still', 'son', 'no', 'problem'],
      'respuesta_correcta': 'please be still son no problem',
      'contexto_es': 'Así le pides al niño que coopere con calma',
    },

    // ── EJ 18 · ORDENAR REPASO L05+L10 ────────────────────────────────────
    // Son (L05) + look down · turn · head · careful (L10) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la secuencia de instrucciones al niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Son, look down, turn your head, careful',
      'traduccion_pregunta': 'Hijo, mira abajo, voltea la cabeza, con cuidado',
      'palabras': ['Son', 'look', 'down', 'turn', 'your', 'head', 'careful'],
      'respuesta_correcta': 'Son look down turn your head careful',
      'contexto_es': 'Combinas L05 y L10 — la secuencia completa con el niño',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L10 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia de instrucciones al niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be still! Turn your head, look down, careful',
      'respuesta_correcta': 'Please be still! Turn your head, look down, careful',
      'fonetica': '[ pliis bi STIL, TORN ior JED, luk DAUN, KEIR-ful ]',
      'traduccion_pregunta': '¡Por favor quédate quieto! Voltea la cabeza, mira abajo, con cuidado',
      'contexto_es': 'La secuencia completa para trabajar con niños en tu silla',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // El papá comenta que el niño se mueve — opciones SOLO L01–L10 ✓
    // Respuesta correcta: No problem (L04) + Please be still · Turn · Head (L10)
    {
      'tipo': 'dialogo',
      'instruccion': 'El papá avisa que su hijo se mueve — ¿qué le dices al niño?',
      'quien_habla': '¡El niño se mueve! 🏆',
      'frase': 'My son, please be patient!',
      'traduccion_pregunta': '¡Mi hijo, por favor ten paciencia!',
      'cliente_dice': 'My son, please be patient!',
      'traduccion_cliente': '¡Mi hijo, por favor ten paciencia!',
      'respuesta_correcta': 'No problem! Please be still, son, turn your head',
      'traduccion_respuesta': '¡No hay problema! Por favor quédate quieto, hijo, voltea la cabeza',
      'opciones_barbero': [
        'No problem! Please be still, son, turn your head',
        'Do you have an appointment?',
        'Water or coffee while you wait?',
        'Wash hair, fresh, ready, street',
      ],
      'contexto_es':
          'No problem (L04) + Please be still · Son · Turn your head (L10) — '
          'manejas la situación con calma y profesionalismo',
    },

  ],
);
