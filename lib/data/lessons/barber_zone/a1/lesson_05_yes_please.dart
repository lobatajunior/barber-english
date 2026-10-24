import '../../../../models/lesson.dart';

// BARBER ZONE · L05 — Yes, Please (Bloque 1 · Conversación 2, corte clásico)
//
// Unidades NUEVAS L05 (5):
//   1. Yes                [ IES ]
//   2. No                 [ NOU ]
//   3. Hair wash          [ JER UOSH ]
//   4. Ready              [ RE-di ]
//   5. See you next time  [ SI iu nekst TAIM ]
//
// Repaso L01: Do you have · Appointment · Welcome · Come in
// Repaso L02: Would you like · Water · Coffee · Thank you · Of course · Minutes
// Repaso L03: Short · Longer · Haircut · On the sides
// Repaso L04: Scissors · Perfect
// Sin cifras, sin "it" ni "What".
// EJ 03: "No → No" no va en parejas (inglés = español rompe ParejasWidget);
//        en su lugar va "See you next time".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L06, L07 y L08.

const lesson05YesPlease = Lesson(
  id: 5,
  title: 'Yes, Please',
  description: 'Lavado de cabello y despedida',
  emoji: '🚿',
  level: Level.A1,
  descripcionEs:
      'Cierra el corte clásico: ofrece lavado de cabello, entiende cuando el '
      'cliente dice sí o no, avísale que está listo y despídete.',
  motivacionEs:
      '¡Un buen final hace que el cliente vuelva! See you next time. 👋',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Yes · No · Hair wash
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Yes, No, Hair wash',
      'respuesta_correcta': 'Yes, No, Hair wash',
      'fonetica': '[ IES · NOU · JER UOSH ]',
      'traduccion_pregunta': 'Sí · No · Lavado de cabello',
      'contexto_es': 'Para ofrecer el lavado y entender la respuesta',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Ready · See you next time
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 palabras',
      'quien_habla': 'Tú dices',
      'frase': 'Ready, See you next time',
      'respuesta_correcta': 'Ready, See you next time',
      'fonetica': '[ RE-di · SI iu nekst TAIM ]',
      'traduccion_pregunta': 'Listo · Nos vemos la próxima',
      'contexto_es': 'Para terminar el corte y despedirte',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    // Disponibles: las 5 unidades nuevas ("No" no se empareja: ver cabecera)
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Yes', 'See you next time', 'Hair wash', 'Ready'],
      'parejas_espanol': ['Sí', 'Nos vemos la próxima', 'Lavado de cabello', 'Listo'],
      'contexto_es': 'Toca cada palabra en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Yes, please.',
      'respuesta_correcta': 'Yes, please.',
      'fonetica': '[ IES · plis ]',
      'traduccion_pregunta': 'Sí, por favor.',
      'contexto_es': 'La respuesta más amable para aceptar',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Sí"?',
      'traduccion_pregunta': 'Sí',
      'respuesta_correcta': 'Yes',
      'opciones': ['Yes', 'No', 'Ready'],
      'contexto_es': 'Para aceptar lo que te ofrecen',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'Would you like water or coffee? Yes, please.',
      'respuesta_correcta': 'Would you like water or coffee? Yes, please.',
      'fonetica': '[ wud iu LAIK WO-ter or KO-fi · IES · plis ]',
      'traduccion_pregunta': '¿Te gustaría agua o café? Sí, por favor.',
      'contexto_es': 'Ofreces algo y el cliente acepta',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la respuesta',
      'quien_habla': 'El cliente dice',
      'frase': 'Yes, please.',
      'traduccion_pregunta': 'Sí, por favor.',
      'palabras': ['Yes', 'please'],
      'respuesta_correcta': 'Yes please',
      'contexto_es': 'Yes + please',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'El barbero pregunta: "Would you like water or coffee?" ¿Qué responde el cliente?',
      'respuesta_correcta': 'Coffee, please.',
      'opciones': ['Coffee, please.', 'Hair wash, please.', 'See you next time.'],
      'contexto_es': 'El cliente elige una de las dos opciones',
    },

    // ── EJ 09 · PAREJAS (repaso L03 + L04) ────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada palabra con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': ['Short', 'Longer', 'Scissors', 'Perfect'],
      'parejas_espanol': ['Corto', 'Más largo', 'Tijeras', 'Perfecto'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'Do you have an appointment? No, thank you.',
      'respuesta_correcta': 'Do you have an appointment? No, thank you.',
      'fonetica': '[ du iu jav an a-POINT-ment · NOU · ZANK iu ]',
      'traduccion_pregunta': '¿Tiene usted una cita? No, gracias.',
      'contexto_es': 'El cliente no tiene cita',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la respuesta del cliente',
      'quien_habla': 'Barbero y cliente',
      'frase': 'Do you have an appointment? ___, thank you.',
      'traduccion_pregunta': '¿Tiene usted una cita? No, gracias.',
      'respuesta_correcta': 'No',
      'opciones': ['No', 'Perfect', 'Scissors'],
      'contexto_es': 'No = no',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Lavado de cabello"?',
      'traduccion_pregunta': 'Lavado de cabello',
      'respuesta_correcta': 'Hair wash',
      'opciones': ['Hair wash', 'Haircut', 'Coffee'],
      'contexto_es': 'Hair wash ≠ haircut',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'Would you like a hair wash? Yes, please. Thank you!',
      'respuesta_correcta': 'Would you like a hair wash? Yes, please. Thank you!',
      'fonetica': '[ wud iu LAIK a JER UOSH · IES · plis · ZANK iu ]',
      'traduccion_pregunta': '¿Te gustaría un lavado de cabello? Sí, por favor. ¡Gracias!',
      'contexto_es': 'Ofreces el lavado al final del corte',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Hair wash, please.',
      'traduccion_pregunta': 'Lavado de cabello, por favor.',
      'palabras': ['wash', 'Hair', 'please'],
      'respuesta_correcta': 'Hair wash please',
      'contexto_es': 'Hair wash + please',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'El barbero pregunta: "Would you like a hair wash?" ¿Qué responde el cliente?',
      'respuesta_correcta': 'Yes, please.',
      'opciones': ['Yes, please.', 'Welcome! Come in.', 'Of course!'],
      'contexto_es': 'El cliente acepta el lavado',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready! Perfect.',
      'respuesta_correcta': 'Ready! Perfect.',
      'fonetica': '[ RE-di · PER-fekt ]',
      'traduccion_pregunta': '¡Listo! Perfecto.',
      'contexto_es': 'Terminaste el corte',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'Tú le dices',
      'frase': '___! Perfect.',
      'traduccion_pregunta': '¡Listo! Perfecto.',
      'respuesta_correcta': 'Ready',
      'opciones': ['Ready', 'Water', 'Minutes'],
      'contexto_es': 'Ready = listo',
    },

    // ── EJ 18 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la despedida',
      'quien_habla': 'Tú le dices',
      'frase': 'See you next time.',
      'traduccion_pregunta': 'Nos vemos la próxima.',
      'palabras': ['time', 'next', 'you', 'See'],
      'respuesta_correcta': 'See you next time',
      'contexto_es': 'See you + next time',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la despedida completa',
      'quien_habla': 'Tú le dices',
      'frase': 'Ready! Perfect. See you next time.',
      'respuesta_correcta': 'Ready! Perfect. See you next time.',
      'fonetica': '[ RE-di · PER-fekt · SI iu nekst TAIM ]',
      'traduccion_pregunta': '¡Listo! Perfecto. Nos vemos la próxima.',
      'contexto_es': 'Así cierras el corte y despides al cliente',
    },

    // ── EJ 20 · DIÁLOGO FINAL (respondes como cliente) ────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'Ahora eres el cliente — ¿qué le respondes al barbero?',
      'quien_habla': 'El barbero dice 💈',
      'frase': 'Would you like a hair wash?',
      'traduccion_pregunta': '¿Te gustaría un lavado de cabello?',
      'cliente_dice': 'Would you like a hair wash?',
      'traduccion_cliente': '¿Te gustaría un lavado de cabello?',
      'respuesta_correcta': 'Yes, please. Thank you!',
      'traduccion_respuesta': 'Sí, por favor. ¡Gracias!',
      'opciones_barbero': [
        'Yes, please. Thank you!',
        'Welcome! Come in.',
        'Short on the sides, please.',
      ],
      'contexto_es': 'Yes, please + Thank you — aceptas con educación',
    },

  ],
);
