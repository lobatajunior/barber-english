import '../../../../models/lesson.dart';

// BARBER ZONE · L09 — My Son (Conversación 3, corte de niño)
//
// Unidades NUEVAS L09 (5):
//   1. I have an appointment  [ ai jav an a-POINT-ment ]
//   2. For my son             [ for mai SAN ]
//   3. I have a photo         [ ai jav a FOU-tou ]
//   4. Be patient             [ bi PEI-shent ]
//   5. Do not move            [ du NOT muv ]
//
// Repaso L01: Come in · Appointment · Do you have · No problem
// Repaso L02: Let me check · Have a seat · Thank you · Coffee · Water
// Repaso L03: How · Your haircut
// Repaso L04: Perfect
// Repaso L05: No · Hair wash · See you next time
// Repaso L06: Good morning · Beard
// Repaso L07: Volume · Less · Modern
// Repaso L08: Product · Like new
// Sin cifras, sin "it", "What", "his", "her" ni "he".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L10, L11 y L12.

const lesson09MySon = Lesson(
  id: 9,
  title: 'My Son',
  description: 'Una madre trae a su hijo con cita',
  emoji: '👦',
  level: Level.A1,
  descripcionEs:
      'Llega una madre con su hijo: entiende que tiene cita, que trae una '
      'foto del corte y pídele al niño que no se mueva.',
  motivacionEs:
      '¡Los niños también son clientes! Ya sabes atenderlos en inglés. 👏',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: I have an appointment · For my son · I have a photo
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'I have an appointment, For my son, I have a photo',
      'respuesta_correcta': 'I have an appointment, For my son, I have a photo',
      'fonetica': '[ ai jav an a-POINT-ment · for mai SAN · ai jav a FOU-tou ]',
      'traduccion_pregunta': 'Tengo una cita · Para mi hijo · Tengo una foto',
      'contexto_es': 'Lo que dice la madre al llegar',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Be patient · Do not move
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Be patient, Do not move',
      'respuesta_correcta': 'Be patient, Do not move',
      'fonetica': '[ bi PEI-shent · du NOT muv ]',
      'traduccion_pregunta': 'Ten paciencia · No te muevas',
      'contexto_es': 'Para cortar el pelo a un niño',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'I have an appointment',
        'For my son',
        'I have a photo',
        'Be patient',
        'Do not move',
      ],
      'parejas_espanol': [
        'Tengo una cita',
        'Para mi hijo',
        'Tengo una foto',
        'Ten paciencia',
        'No te muevas',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'La madre dice',
      'frase': 'Good morning! I have an appointment for my son.',
      'respuesta_correcta': 'Good morning! I have an appointment for my son.',
      'fonetica': '[ gud MOR-ning · ai jav an a-POINT-ment · for mai SAN ]',
      'traduccion_pregunta': '¡Buenos días! Tengo una cita para mi hijo.',
      'contexto_es': 'Así llega la madre con su hijo',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Para mi hijo"?',
      'traduccion_pregunta': 'For my son = Para mi hijo',
      'respuesta_correcta': 'For my son',
      'opciones': ['For my son', 'Your haircut', 'Like new'],
      'contexto_es': 'For my son = para mi hijo',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Let me check. Come in, please.',
      'respuesta_correcta': 'Let me check. Come in, please.',
      'fonetica': '[ let mi CHEK · kom IN · plis ]',
      'traduccion_pregunta': 'Déjame revisar. Pasen, por favor.',
      'contexto_es': 'Revisas la cita y los haces pasar',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'La madre dice',
      'frase': 'I have an appointment.',
      'traduccion_pregunta': 'Tengo una cita.',
      'palabras': ['appointment', 'have', 'I', 'an'],
      'respuesta_correcta': 'I have an appointment',
      'contexto_es': 'I have + an appointment',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo dices "Tengo una cita"?',
      'traduccion_pregunta': 'I have an appointment = Tengo una cita',
      'respuesta_correcta': 'I have an appointment',
      'opciones': [
        'I have an appointment',
        'Do you have an appointment?',
        'Let me check',
      ],
      'contexto_es': 'I have = tengo · Do you have = ¿tiene usted?',
    },

    // ── EJ 09 · PAREJAS (repaso L05 + L06 + L07 + L08) ────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Volume', 'Less', 'Good morning', 'No, thank you', 'Product'],
      'parejas_espanol': ['Volumen', 'Menos', 'Buenos días', 'No, gracias', 'Producto'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Have a seat. How would you like your haircut?',
      'respuesta_correcta': 'Have a seat. How would you like your haircut?',
      'fonetica': '[ jav a SIIT · JAU wud iu LAIK ior JER-kat ]',
      'traduccion_pregunta': 'Toma asiento. ¿Cómo le gustaría su corte?',
      'contexto_es': 'Repaso: lo sientas y preguntas por el corte',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase de la madre',
      'quien_habla': 'La madre dice',
      'frase': 'I have a ___.',
      'traduccion_pregunta': 'Tengo una foto.',
      'respuesta_correcta': 'photo',
      'opciones': ['photo', 'coffee', 'beard'],
      'contexto_es': 'Photo = foto',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "How would you like your haircut?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Cómo le gustaría su corte? — Moderno, por favor. Tengo una foto.',
      'respuesta_correcta': 'Modern, please. I have a photo.',
      'opciones': [
        'Modern, please. I have a photo.',
        'Good morning!',
        'See you next time.',
      ],
      'contexto_es': 'La madre quiere algo moderno y trae una foto',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'La madre dice',
      'frase': 'Modern, please. I have a photo.',
      'respuesta_correcta': 'Modern, please. I have a photo.',
      'fonetica': '[ MO-dern · plis · ai jav a FOU-tou ]',
      'traduccion_pregunta': 'Moderno, por favor. Tengo una foto.',
      'contexto_es': 'El corte por foto',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'La madre dice',
      'frase': 'I have a photo.',
      'traduccion_pregunta': 'Tengo una foto.',
      'palabras': ['photo', 'a', 'have', 'I'],
      'respuesta_correcta': 'I have a photo',
      'contexto_es': 'I have + a photo',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "No te muevas"?',
      'traduccion_pregunta': 'Do not move = No te muevas',
      'respuesta_correcta': 'Do not move',
      'opciones': ['Do not move', 'Be patient', 'Like new'],
      'contexto_es': 'Do not move = no te muevas · Be patient = ten paciencia',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Do not move, please.',
      'respuesta_correcta': 'Do not move, please.',
      'fonetica': '[ du NOT muv · plis ]',
      'traduccion_pregunta': 'No te muevas, por favor.',
      'contexto_es': 'Se lo pides al niño con calma',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'La madre dice',
      'frase': 'Be ___, please.',
      'traduccion_pregunta': 'Ten paciencia, por favor.',
      'respuesta_correcta': 'patient',
      'opciones': ['patient', 'coffee', 'water'],
      'contexto_es': 'Be patient = ten paciencia',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige lo que dice la madre',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Perfect! Do not move, please." ¿Qué dice la madre?',
      'traduccion_pregunta':
          '¡Perfecto! No te muevas, por favor. — Ten paciencia, por favor.',
      'respuesta_correcta': 'Be patient, please.',
      'opciones': ['Be patient, please.', 'Good morning!', 'Hair wash, please.'],
      'contexto_es': 'La madre te pide paciencia con el niño',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Cliente y barbero',
      'frase': 'Less volume, please. No problem!',
      'respuesta_correcta': 'Less volume, please. No problem!',
      'fonetica': '[ LES VOL-yum · plis · nou PROB-lem ]',
      'traduccion_pregunta': 'Menos volumen, por favor. ¡No hay problema!',
      'contexto_es': 'Repaso: un pedido y tu respuesta',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'La madre llega con su hijo — ¿qué le respondes?',
      'quien_habla': '¡Tu primer cliente niño! 🏆',
      'frase': 'Good morning! I have an appointment for my son.',
      'traduccion_pregunta': '¡Buenos días! Tengo una cita para mi hijo.',
      'cliente_dice': 'Good morning! I have an appointment for my son.',
      'traduccion_cliente': '¡Buenos días! Tengo una cita para mi hijo.',
      'respuesta_correcta': 'Let me check. Come in, please.',
      'traduccion_respuesta': 'Déjame revisar. Pasen, por favor.',
      'opciones_barbero': [
        'Let me check. Come in, please.',
        'See you next time.',
        'Do not move.',
      ],
      'contexto_es': 'Revisas la cita y los haces pasar',
    },

  ],
);
