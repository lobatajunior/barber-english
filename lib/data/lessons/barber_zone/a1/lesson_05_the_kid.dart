import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L04):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//
// Palabras NUEVAS L05 (en orden de enseñanza):
//   1. Son       [ SON ]       → Hijo
//   2. Move      [ MUUV ]      → Moverse
//   3. Patient   [ PEI-shent ] → Paciente
//   4. Photo     [ FOU-tou ]   → Foto
//   5. Modern    [ MOD-ern ]   → Moderno

const lesson05TheKid = Lesson(
  id: 5,
  title: 'The Kid',
  description: 'Atiende al cliente que trae a su hijo',
  emoji: '👦',
  level: Level.A1,
  descripcionEs:
      'Aprenderás el vocabulario para atender a un niño en tu silla: '
      'hablar con el papá, pedir paciencia y entender '
      'lo que quieren para el corte.',
  motivacionEs:
      '¡Los niños son los clientes más fieles — '
      'si los atiendes bien, el papá siempre vuelve! 👨‍👦',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L04 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // Una palabra de L01, una de L02, una de L04 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Of course · Nice to meet you · No problem',
      'traduccion_pregunta': 'Claro · Mucho gusto · No hay problema',
      'parejas_ingles': ['Of course', 'Nice to meet you', 'No problem'],
      'parejas_espanol': ['Claro', 'Mucho gusto', 'No hay problema'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L04 ──────────────────────────────────────
    // Frase y opciones SOLO L04 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la respuesta al cliente sin cita',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you have an appointment? No ___',
      'traduccion_pregunta': '¿Tiene una cita? No hay problema',
      'respuesta_correcta': 'problem',
      'opciones': ['problem', 'wait', 'minutes', 'have'],
      'contexto_es': 'Repaso de L04 — manejo del walk-in',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L01+L02+L04 ─────────────────────────
    // Of course (L01) + Take a seat (L02) + No problem (L04) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia de bienvenida completa',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course, take a seat, no problem',
      'respuesta_correcta': 'Of course, take a seat, no problem',
      'fonetica': '[ of KORS, teik a SIIT, nou PROB-lem ]',
      'traduccion_pregunta': 'Claro, tome asiento, no hay problema',
      'contexto_es': 'Combinas L01, L02 y L04 en una sola frase',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L05 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Son" ───────────────────────────────────────
    // Palabras nuevas: Son
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra',
      'quien_habla': 'El cliente dice',
      'frase': 'Son',
      'fonetica': '[ SON ]',
      'traduccion_pregunta': 'Hijo',
      'contexto_es': 'El cliente viene con su hijo a la barbería',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN FRASE ─ "Son" ─────────────────────────────────────
    // Disponibles L05: Son
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora dilo en una frase completa',
      'quien_habla': 'El cliente dice',
      'frase': 'Good morning! A haircut for my son',
      'respuesta_correcta': 'Good morning! A haircut for my son',
      'fonetica': '[ gud MOR-ning! a JEAR-kat for mai SON ]',
      'traduccion_pregunta': '¡Buenos días! Un corte para mi hijo',
      'contexto_es': 'El papá o la mamá trae al niño',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "Move" ──────────────────────────────────────
    // Palabras nuevas: Move
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra',
      'quien_habla': 'Tú le dices',
      'frase': 'Move',
      'fonetica': '[ MUUV ]',
      'traduccion_pregunta': 'Moverse',
      'contexto_es': 'El niño se mueve durante el corte',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN FRASE ─ "Move" ────────────────────────────────────
    // Disponibles L05: Son · Move
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora dilo en una frase completa',
      'quien_habla': 'Tú le dices',
      'frase': "Sit down, please, don't move",
      'respuesta_correcta': "Sit down, please, don't move",
      'fonetica': '[ SIT daun, pliis, dont MUUV ]',
      'traduccion_pregunta': 'Siéntate, por favor, no te muevas',
      'contexto_es': 'Firme pero amable con el niño',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Patient" ───────────────────────────────────
    // Palabras nuevas: Patient
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra',
      'quien_habla': 'Tú le dices',
      'frase': 'Patient',
      'fonetica': '[ PEI-shent ]',
      'traduccion_pregunta': 'Paciente',
      'contexto_es': 'Con los niños hay que tener paciencia',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN FRASE ─ "Patient" ─────────────────────────────────
    // Disponibles L05: Son · Move · Patient
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora dilo en una frase completa',
      'quien_habla': 'Tú le dices',
      'frase': "Please be patient, don't move",
      'respuesta_correcta': "Please be patient, don't move",
      'fonetica': '[ pliis bi PEI-shent, dont MUUV ]',
      'traduccion_pregunta': 'Por favor ten paciencia, no te muevas',
      'contexto_es': 'Calma al niño antes de empezar',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L05: Son · Move · Patient
    // Opciones: partes de las expresiones L05 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del papá',
      'quien_habla': 'El cliente dice',
      'frase': 'Please take a seat, my ___',
      'traduccion_pregunta': 'Por favor tome asiento, mi hijo',
      'respuesta_correcta': 'son',
      'opciones': ['son', 'move', 'patient', 'photo'],
      'contexto_es': 'El papá le dice a su hijo que se siente',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Photo" ─────────────────────────────────────
    // Palabras nuevas: Photo
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra',
      'quien_habla': 'El cliente dice',
      'frase': 'Photo',
      'fonetica': '[ FOU-tou ]',
      'traduccion_pregunta': 'Foto',
      'contexto_es': 'El cliente muestra una foto del corte que quiere',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN FRASE ─ "Photo" ───────────────────────────────────
    // Disponibles L05: Son · Move · Patient · Photo
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora dilo en una frase completa',
      'quien_habla': 'El cliente dice',
      'frase': 'This photo, please, for my son',
      'respuesta_correcta': 'This photo, please, for my son',
      'fonetica': '[ dis FOU-tou, pliis, for mai SON ]',
      'traduccion_pregunta': 'Esta foto, por favor, para mi hijo',
      'contexto_es': 'Cuando te enseñan la foto del corte',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Modern" ────────────────────────────────────
    // Palabras nuevas: Modern
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha esta palabra',
      'quien_habla': 'El cliente dice',
      'frase': 'Modern',
      'fonetica': '[ MOD-ern ]',
      'traduccion_pregunta': 'Moderno',
      'contexto_es': 'El cliente describe el estilo que quiere',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN FRASE ─ "Modern" ──────────────────────────────────
    // Disponibles L05: las 5 nuevas
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora dilo en una frase completa',
      'quien_habla': 'El cliente dice',
      'frase': 'A modern haircut for my son',
      'respuesta_correcta': 'A modern haircut for my son',
      'fonetica': '[ a MOD-ern JEAR-kat for mai SON ]',
      'traduccion_pregunta': 'Un corte moderno para mi hijo',
      'contexto_es': 'El estilo más pedido por los jóvenes',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L05 ───────────────────────────────
    // Las 5 palabras nuevas de L05 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Son · Move · Patient · Photo · Modern',
      'traduccion_pregunta':
          'Hijo · Moverse · Paciente · Foto · Moderno',
      'parejas_ingles': ['Son', 'Move', 'Patient', 'Photo', 'Modern'],
      'parejas_espanol': ['Hijo', 'Moverse', 'Paciente', 'Foto', 'Moderno'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Frase usa L03+L04 / opciones son partes de L05 ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del corte del niño',
      'quien_habla': 'El cliente dice',
      'frase': 'A ___ haircut, please',
      'traduccion_pregunta': 'Un corte moderno, por favor',
      'respuesta_correcta': 'modern',
      'opciones': ['modern', 'son', 'patient', 'photo'],
      'contexto_es': 'El papá describe el estilo que quiere para su hijo',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Modern (L05) + haircut (L03) + no problem (L04) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la confirmación del barbero',
      'quien_habla': 'Tú le dices',
      'frase': 'Modern haircut, no problem',
      'traduccion_pregunta': 'Corte moderno, no hay problema',
      'palabras': ['modern', 'haircut', 'no', 'problem'],
      'respuesta_correcta': 'modern haircut no problem',
      'contexto_es': 'Confirmas que puedes hacer el corte moderno',
    },

    // ── EJ 18 · ORDENAR REPASO L01+L03+L05 ───────────────────────────────
    // Good morning (L01) + modern (L05) + haircut (L03) + please (L04) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma el saludo con la solicitud del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Good morning, modern haircut please',
      'traduccion_pregunta': 'Buenos días, corte moderno por favor',
      'palabras': ['Good', 'morning', 'modern', 'haircut', 'please'],
      'respuesta_correcta': 'Good morning modern haircut please',
      'contexto_es': 'Combinas L01, L03 y L05 — el cliente pide su corte',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa ────────────────────────────
    // Modern (L05) + haircut · fade · sides · longer · top (L03) ✓
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción completa del corte moderno',
      'quien_habla': 'El cliente dice',
      'frase': 'Modern haircut, fade on the sides, longer on top',
      'respuesta_correcta': 'Modern haircut, fade on the sides, longer on top',
      'fonetica': '[ MOD-ern JEAR-kat, FEID on de SAIDS, LON-ger on TOP ]',
      'traduccion_pregunta': 'Corte moderno, degradado en los lados, más largo arriba',
      'contexto_es': 'Así describe el cliente el corte perfecto para su hijo',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Papá llega con el niño — opciones SOLO L01–L05 ✓
    // Respuesta correcta: No problem (L04) + Take a seat (L02)
    {
      'tipo': 'dialogo',
      'instruccion': 'El papá llega con su hijo — ¿qué le dices?',
      'quien_habla': '¡Primer cliente con su hijo! 🏆',
      'frase': 'Good morning! Modern haircut, please',
      'traduccion_pregunta': '¡Buenos días! Corte moderno, por favor',
      'cliente_dice': 'Good morning! Modern haircut, please',
      'traduccion_cliente': '¡Buenos días! Corte moderno, por favor',
      'respuesta_correcta': 'No problem! Take a seat, please wait',
      'traduccion_respuesta': '¡No hay problema! Tome asiento, por favor espere',
      'opciones_barbero': [
        'No problem! Take a seat, please wait',
        'Do you have an appointment?',
        'Fade on the sides, longer on top',
        'Nice to meet you, move',
      ],
      'contexto_es':
          'No problem (L04) + Take a seat (L02) + Please wait (L04) — '
          'recibes al niño con calma y profesionalismo',
    },

  ],
);
