import '../../../../models/lesson.dart';

// BARBER ZONE · L10 — Messy Style (Conversación 2, corte clásico)
//
// Unidades NUEVAS L10 (6):
//   1. Would you like to wait?       [ wud iu LAIK tu UEIT ]
//   2. I do not have an appointment  [ ai du NOT jav an a-POINT-ment ]
//   3. Scissors only                 [ SI-sors ON-li ]
//   4. A little longer               [ a LI-rol LONG-er ]
//   5. Combed up                     [ KOUMD AP ]
//   6. Messy                         [ ME-si ]
//
// Repaso L01: Do you have · Appointment · No problem
// Repaso L02: Let me check · Coffee · Water
// Repaso L03: How · Your haircut · Short · Longer · On the sides
// Repaso L04: On top · Classic · Not too short
// Repaso L05: Yes · No · Hair wash · Ready · See you next time
// Repaso L06: Good morning
// Repaso L07: Modern · Fresh
// Repaso L08: Sideburns · I trust you · Like new
// Repaso L09: Be patient
// Sin cifras, sin "it", "What", "his", "her" ni "he".
// Repaso obligatorio: las 6 unidades nuevas deben aparecer en L11, L12 y L13.

const lesson10MessyStyle = Lesson(
  id: 10,
  title: 'Messy Style',
  description: 'Cliente sin cita, corte clásico con tijera',
  emoji: '💇',
  level: Level.A1,
  descripcionEs:
      'Llega un cliente sin cita: ofrécele esperar y entiende cuando pide un '
      'corte clásico con tijera, un poco más largo arriba y desordenado.',
  motivacionEs:
      '¡Ya atiendes al cliente sin cita de principio a fin en inglés! 🔥',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Would you like to wait? · I do not have an appointment · Scissors only
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase':
          'Would you like to wait, I do not have an appointment, Scissors only',
      'respuesta_correcta':
          'Would you like to wait, I do not have an appointment, Scissors only',
      'fonetica':
          '[ wud iu LAIK tu UEIT · ai du NOT jav an a-POINT-ment · SI-sors ON-li ]',
      'traduccion_pregunta':
          '¿Prefiere esperar? · No tengo cita · Solo con tijera',
      'contexto_es': 'Para el cliente que llega sin cita',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: A little longer · Combed up · Messy
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'A little longer, Combed up, Messy',
      'respuesta_correcta': 'A little longer, Combed up, Messy',
      'fonetica': '[ a LI-rol LONG-er · KOUMD AP · ME-si ]',
      'traduccion_pregunta':
          'Un poco más largo · Peinado hacia arriba · Desordenado',
      'contexto_es': 'Para el estilo del corte clásico',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'Would you like to wait?',
        'I do not have an appointment',
        'Scissors only',
        'A little longer',
        'Combed up',
      ],
      'parejas_espanol': [
        '¿Prefiere esperar?',
        'No tengo cita',
        'Solo con tijera',
        'Un poco más largo',
        'Peinado hacia arriba',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'No, I do not have an appointment.',
      'respuesta_correcta': 'No, I do not have an appointment.',
      'fonetica': '[ NOU · ai du NOT jav an a-POINT-ment ]',
      'traduccion_pregunta': 'No, no tengo cita.',
      'contexto_es': 'El cliente llega sin cita',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Do you have an appointment?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Tiene usted una cita? — No, no tengo cita.',
      'respuesta_correcta': 'No, I do not have an appointment.',
      'opciones': [
        'No, I do not have an appointment.',
        'See you next time.',
        'Scissors only.',
      ],
      'contexto_es': 'I do not have = no tengo',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Let me check. Would you like to wait?',
      'respuesta_correcta': 'No problem! Let me check. Would you like to wait?',
      'fonetica': '[ nou PROB-lem · let mi CHEK · wud iu LAIK tu UEIT ]',
      'traduccion_pregunta':
          '¡No hay problema! Déjame revisar. ¿Prefiere esperar?',
      'contexto_es': 'Revisas la agenda y le ofreces esperar',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la pregunta',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like to wait?',
      'traduccion_pregunta': '¿Prefiere esperar?',
      'palabras': ['wait', 'to', 'like', 'you', 'Would'],
      'respuesta_correcta': 'Would you like to wait',
      'contexto_es': 'Would you like + to wait',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Solo con tijera"?',
      'traduccion_pregunta': 'Scissors only = Solo con tijera',
      'respuesta_correcta': 'Scissors only',
      'opciones': ['Scissors only', 'Messy', 'Hair wash'],
      'contexto_es': 'Scissors only = solo con tijera',
    },

    // ── EJ 09 · PAREJAS (nueva + repaso L08 + L09) ────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Messy', 'Be patient', 'I trust you', 'Sideburns', 'Like new'],
      'parejas_espanol': ['Desordenado', 'Ten paciencia', 'Confío en ti', 'Patillas', 'Como nuevo'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic, please. Not too short on the sides.',
      'respuesta_correcta': 'Classic, please. Not too short on the sides.',
      'fonetica': '[ KLA-sik · plis · not tu SHORT on de SAIDS ]',
      'traduccion_pregunta': 'Clásico, por favor. No muy corto en los lados.',
      'contexto_es': 'El cliente pide un corte clásico',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'A little ___ on top.',
      'traduccion_pregunta': 'Un poco más largo arriba.',
      'respuesta_correcta': 'longer',
      'opciones': ['longer', 'coffee', 'fresh'],
      'contexto_es': 'A little longer = un poco más largo',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "How would you like your haircut?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Cómo le gustaría su corte? — Clásico, por favor. Solo con tijera.',
      'respuesta_correcta': 'Classic, please. Scissors only.',
      'opciones': [
        'Classic, please. Scissors only.',
        'Good morning!',
        'Hair wash, please.',
      ],
      'contexto_es': 'El cliente quiere un corte clásico con tijera',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'A little longer on top. Scissors only.',
      'respuesta_correcta': 'A little longer on top. Scissors only.',
      'fonetica': '[ a LI-rol LONG-er on TOP · SI-sors ON-li ]',
      'traduccion_pregunta': 'Un poco más largo arriba. Solo con tijera.',
      'contexto_es': 'El detalle de arriba, todo con tijera',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'A little longer on top.',
      'traduccion_pregunta': 'Un poco más largo arriba.',
      'palabras': ['longer', 'little', 'A', 'on', 'top'],
      'respuesta_correcta': 'A little longer on top',
      'contexto_es': 'A little longer + on top',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Desordenado"?',
      'traduccion_pregunta': 'Messy = Desordenado',
      'respuesta_correcta': 'Messy',
      'opciones': ['Messy', 'Modern', 'Ready'],
      'contexto_es': 'Messy = desordenado',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Combed up. Messy, please.',
      'respuesta_correcta': 'Combed up. Messy, please.',
      'fonetica': '[ KOUMD AP · ME-si · plis ]',
      'traduccion_pregunta': 'Peinado hacia arriba. Desordenado, por favor.',
      'contexto_es': 'Así se peina el cliente',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ up. Messy, please.',
      'traduccion_pregunta': 'Peinado hacia arriba. Desordenado, por favor.',
      'respuesta_correcta': 'Combed',
      'opciones': ['Combed', 'Water', 'Short'],
      'contexto_es': 'Combed up = peinado hacia arriba',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Would you like a hair wash?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Le gustaría un lavado de cabello? — Sí, por favor.',
      'respuesta_correcta': 'Yes, please.',
      'opciones': ['Yes, please.', 'Scissors only.', 'Combed up.'],
      'contexto_es': 'El cliente acepta el lavado',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Fresh! Like new! See you next time.',
      'respuesta_correcta': 'Fresh! Like new! See you next time.',
      'fonetica': '[ FRESH · LAIK niu · SI iu nekst TAIM ]',
      'traduccion_pregunta': '¡Fresco! ¡Como nuevo! Nos vemos la próxima.',
      'contexto_es': 'Así despides al cliente',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero le ofrece esperar — ¿qué responde el cliente?',
      'quien_habla': '¡Tu cliente sin cita! 🏆',
      'frase': 'Let me check. Would you like to wait?',
      'traduccion_pregunta': 'Déjame revisar. ¿Prefiere esperar?',
      'cliente_dice': 'Let me check. Would you like to wait?',
      'traduccion_cliente': 'Déjame revisar. ¿Prefiere esperar?',
      'respuesta_correcta': 'Yes, please.',
      'traduccion_respuesta': 'Sí, por favor.',
      'opciones_barbero': [
        'Yes, please.',
        'Fresh! Like new!',
        'Scissors only.',
      ],
      'contexto_es': 'El cliente acepta esperar',
    },

  ],
);
