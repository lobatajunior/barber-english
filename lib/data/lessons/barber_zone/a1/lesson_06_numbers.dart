// L06 — NUMBERS & LENGTHS
// Palabras nuevas: Number one, Short, Long, Same, Little
// Fuente: Conversación 1 (fade con textura) y Conversación 2 (corte clásico)

final List<Map<String, dynamic>> lesson06Numbers = [

  // ═══════════════════════════════════════════════════════════════
  // BLOQUE 1 — REPASO L01-L05  (EJ 01-03)
  // ═══════════════════════════════════════════════════════════════

  // EJ 01 — Repaso L05: Son / Move / Patient / Photo / Modern
  {
    'tipo': 'parejas',
    'instruccion': 'Repaso — une cada palabra con su significado',
    'parejas_ingles': ['Son', 'Move', 'Patient', 'Photo', 'Modern'],
    'parejas_espanol': ['Hijo', 'Moverse', 'Paciente', 'Foto', 'Moderno'],
  },

  // EJ 02 — Repaso L03: Fade / Sides / Top
  {
    'tipo': 'opciones',
    'instruccion': 'Repaso — elige la palabra correcta',
    'pregunta': 'I want a _______ on the sides.',
    'traduccion_pregunta': 'Quiero un degradado en los lados.',
    'respuesta_correcta': 'fade',
    'opciones': ['fade', 'appointment', 'welcome', 'minutes'],
  },

  // EJ 03 — Repaso L01: Good morning + Appointment
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Repaso — pronuncia el saludo de apertura',
    'respuesta_correcta': 'Good morning! Do you have an appointment?',
    'fonetica': 'gud MOR-ning! du yu jav an a-POINT-ment?',
    'traduccion_pregunta': '¡Buenos días! ¿Tienes una cita?',
  },

  // ═══════════════════════════════════════════════════════════════
  // BLOQUE 2 — PALABRAS NUEVAS  (EJ 04-13)
  // Orden: escuchar 🆕 → pronunciar, para cada palabra nueva
  // ═══════════════════════════════════════════════════════════════

  // EJ 04 — 🆕 NUMBER ONE
  {
    'tipo': 'escuchar',
    'instruccion': 'Escucha y repite',
    'palabra': 'Number one',
    'traduccion': 'Número uno',
    'fonetica': 'NOM-ber WAN',
    'es_palabra_nueva': true,
  },

  // EJ 05 — Pronuncia: Number one
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase',
    'respuesta_correcta': 'Number one on the sides, please.',
    'fonetica': 'NOM-ber WAN on de SAIDS, pliis',
    'traduccion_pregunta': 'Número uno en los lados, por favor.',
    'es_palabra_nueva': true,
  },

  // EJ 06 — 🆕 SHORT
  {
    'tipo': 'escuchar',
    'instruccion': 'Escucha y repite',
    'palabra': 'Short',
    'traduccion': 'Corto',
    'fonetica': 'SHORT',
    'es_palabra_nueva': true,
  },

  // EJ 07 — Pronuncia: Short
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase',
    'respuesta_correcta': 'Keep it short on the sides.',
    'fonetica': 'kiip it SHORT on de SAIDS',
    'traduccion_pregunta': 'Mantenlo corto en los lados.',
    'es_palabra_nueva': true,
  },

  // EJ 08 — 🆕 LONG
  {
    'tipo': 'escuchar',
    'instruccion': 'Escucha y repite',
    'palabra': 'Long',
    'traduccion': 'Largo',
    'fonetica': 'LONG',
    'es_palabra_nueva': true,
  },

  // EJ 09 — Pronuncia: Long
  // NOTA: "little" no se enseña hasta EJ 12 — frase solo usa palabras ya enseñadas
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase',
    'respuesta_correcta': 'Long on top, please.',
    'fonetica': 'LONG on TOP, pliis',
    'traduccion_pregunta': 'Largo arriba, por favor.',
    'es_palabra_nueva': true,
  },

  // EJ 10 — 🆕 SAME
  {
    'tipo': 'escuchar',
    'instruccion': 'Escucha y repite',
    'palabra': 'Same',
    'traduccion': 'Igual / Lo mismo',
    'fonetica': 'SEIM',
    'es_palabra_nueva': true,
  },

  // EJ 11 — Pronuncia: Same
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase',
    'respuesta_correcta': 'The same haircut, please.',
    'fonetica': 'de SEIM JEAR-kat, pliis',
    'traduccion_pregunta': 'El mismo corte, por favor.',
    'es_palabra_nueva': true,
  },

  // EJ 12 — 🆕 LITTLE
  {
    'tipo': 'escuchar',
    'instruccion': 'Escucha y repite',
    'palabra': 'Little',
    'traduccion': 'Un poco',
    'fonetica': 'LI-tel',
    'es_palabra_nueva': true,
  },

  // EJ 13 — Pronuncia: Little (combina con Short y Sides, ya enseñados)
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase',
    'respuesta_correcta': 'A little short on the sides.',
    'fonetica': 'a LI-tel SHORT on de SAIDS',
    'traduccion_pregunta': 'Un poco corto en los lados.',
    'es_palabra_nueva': true,
  },

  // ═══════════════════════════════════════════════════════════════
  // BLOQUE 3 — CONSOLIDACIÓN  (EJ 14-19)
  // Distractores: SOLO palabras enseñadas en L01-L05 + L06
  // ═══════════════════════════════════════════════════════════════

  // EJ 14 — Number one en contexto
  // Distractores: Fade (L03), Modern (L05), Patient (L05)
  {
    'tipo': 'opciones',
    'instruccion': 'Elige la palabra correcta',
    'pregunta': '_______ on the sides, please.',
    'traduccion_pregunta': 'Número uno en los lados, por favor.',
    'respuesta_correcta': 'Number one',
    'opciones': ['Number one', 'Fade', 'Modern', 'Patient'],
  },

  // EJ 15 — Short vs Long (opuestos)
  // Distractores: long (L06 enseñada), fade (L03), move (L05)
  {
    'tipo': 'opciones',
    'instruccion': 'Elige la palabra correcta',
    'pregunta': 'Not too _______ on top.',
    'traduccion_pregunta': 'No muy corto arriba.',
    'respuesta_correcta': 'short',
    'opciones': ['short', 'long', 'fade', 'move'],
  },

  // EJ 16 — Parejas con las 5 palabras nuevas de L06
  {
    'tipo': 'parejas',
    'instruccion': 'Une cada palabra nueva con su significado',
    'parejas_ingles': ['Number one', 'Short', 'Long', 'Same', 'Little'],
    'parejas_espanol': ['Número uno', 'Corto', 'Largo', 'Igual', 'Un poco'],
  },

  // EJ 17 — Same en contexto
  // Distractores: wait (L04), photo (L05), welcome (L01)
  {
    'tipo': 'opciones',
    'instruccion': 'Elige la palabra correcta',
    'pregunta': 'The _______ as last time, please.',
    'traduccion_pregunta': 'Lo mismo que la última vez, por favor.',
    'respuesta_correcta': 'same',
    'opciones': ['same', 'wait', 'photo', 'welcome'],
  },

  // EJ 18 — Frase combinada: Number one + Little + Long
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase completa',
    'respuesta_correcta': 'Number one on the sides and a little long on top.',
    'fonetica': 'NOM-ber WAN on de SAIDS and a LI-tel LONG on TOP',
    'traduccion_pregunta': 'Número uno en los lados y un poco largo arriba.',
  },

  // EJ 19 — Frase combinada: Same + Little + Short
  {
    'tipo': 'pronunciacion',
    'instruccion': 'Pronuncia la frase completa',
    'respuesta_correcta': 'The same haircut, a little short on the sides.',
    'fonetica': 'de SEIM JEAR-kat, a LI-tel SHORT on de SAIDS',
    'traduccion_pregunta': 'El mismo corte, un poco corto en los lados.',
  },

  // ═══════════════════════════════════════════════════════════════
  // BLOQUE 4 — DIÁLOGO FINAL 🏆  (EJ 20)
  // Fuente: Conversación 1 — "¿Desde qué número?" + Conversación 2 — "no muy corto"
  // ═══════════════════════════════════════════════════════════════

  // EJ 20 — Diálogo completo Junior ↔ Cliente
  {
    'tipo': 'dialogo',
    'instruccion': '🏆 Diálogo final — elige la respuesta correcta',
    'lineas': [
      {
        'hablante': 'JUNIOR',
        'texto': 'Good morning! Welcome, come in.',
        'traduccion': '¡Buenos días! Bienvenido, pasa.',
      },
      {
        'hablante': 'CLIENT',
        'texto': 'Good morning! I have an appointment.',
        'traduccion': '¡Buenos días! Tengo una cita.',
      },
      {
        'hablante': 'JUNIOR',
        'texto': 'Of course! Sit down, please.',
        'traduccion': '¡Claro! Siéntate, por favor.',
      },
      {
        'hablante': 'JUNIOR',
        'texto': 'How would you like your haircut?',
        'traduccion': '¿Cómo te gustaría tu corte?',
      },
      {
        'hablante': 'CLIENT',
        'texto': '_______ on the sides, please.',
        'traduccion': 'Número uno en los lados, por favor.',
        'respuesta_correcta': 'Number one',
        'opciones': ['Number one', 'Fade', 'Modern', 'Patient'],
      },
      {
        'hablante': 'JUNIOR',
        'texto': 'Long or short on top?',
        'traduccion': '¿Largo o corto arriba?',
      },
      {
        'hablante': 'CLIENT',
        'texto': 'A little _______, please.',
        'traduccion': 'Un poco largo, por favor.',
        'respuesta_correcta': 'long',
        'opciones': ['long', 'short', 'wait', 'move'],
      },
      {
        'hablante': 'JUNIOR',
        'texto': 'The same as last time?',
        'traduccion': '¿Lo mismo que la última vez?',
      },
      {
        'hablante': 'CLIENT',
        'texto': 'Yes, the _______ style, please.',
        'traduccion': 'Sí, el mismo estilo, por favor.',
        'respuesta_correcta': 'same',
        'opciones': ['same', 'photo', 'minutes', 'welcome'],
      },
    ],
  },
];
