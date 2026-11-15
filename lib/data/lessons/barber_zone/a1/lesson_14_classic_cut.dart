import '../../../../models/lesson.dart';

// BARBER ZONE · L14 — Classic Cut (repaso, Conversaciones 1 y 2)
//
// Unidades NUEVAS L14: ninguna (lección de repaso puro).
// EJ 01-02 vuelven a pronunciar expresiones ya enseñadas (sin es_palabra_nueva).
//
// "What", "is", "are", "to", "the" y "an" solo aparecen dentro de expresiones
// fijas, nunca sueltos. "Eduardo" es nombre propio.
//
// Repaso L01: Do you have · Appointment · No problem
// Repaso L02: Let me check · Would you like · Water · Coffee · Thank you
// Repaso L03: How · Your haircut · Short · On the sides
// Repaso L04: Classic · Not too short · Perfect
// Repaso L05: No · Ready · See you next time
// Repaso L06: Good morning · Fade · Low
// Repaso L07: Fresh
// Repaso L08: I trust you · Like new
// Repaso L09: Be patient
// Repaso L10: Would you like to wait? · I do not have an appointment
//             · Scissors only · A little longer · Combed up · Messy
// Repaso L11: What is your name? · My name is · You are early
//             · Black coffee · Come to the chair
// Repaso L12: Look to the side · Look down · Combed to the side
// Repaso L13: Great job
// Sin cifras, sin "it", "his", "her" ni "he".

const lesson14ClassicCut = Lesson(
  id: 14,
  title: 'Classic Cut',
  description: 'Repaso: cliente sin cita y corte clásico',
  emoji: '✂️',
  level: Level.A1,
  descripcionEs:
      'Repasa todo el corte clásico: recibe a un cliente sin cita, ofrécele '
      'café, pregúntale su nombre y termina con un corte como nuevo.',
  motivacionEs:
      '¡Buen trabajo! Ya atiendes un corte clásico completo en inglés. 💈',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista, repaso L10) ─────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Repaso — escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase':
          'Would you like to wait?, I do not have an appointment, A little longer',
      'respuesta_correcta':
          'Would you like to wait?, I do not have an appointment, A little longer',
      'fonetica':
          '[ wud iu LAIK tu UEIT · ai du NOT jav an a-POINT-ment · a LI-rol LONG-er ]',
      'traduccion_pregunta':
          '¿Prefiere esperar? · No tengo cita · Un poco más largo',
      'contexto_es': 'Expresiones del cliente sin cita',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista, repaso L10 + L11) ───────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Repaso — escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Messy, You are early, Come to the chair',
      'respuesta_correcta': 'Messy, You are early, Come to the chair',
      'fonetica': '[ ME-si · iu ar ER-li · kom tu de CHER ]',
      'traduccion_pregunta': 'Desordenado · Llegó temprano · Pase a la silla',
      'contexto_es': 'Expresiones para recibir y peinar al cliente',
    },

    // ── EJ 03 · PAREJAS (repaso L10 + L11) ────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'What is your name?',
        'My name is',
        'Black coffee',
        'Scissors only',
        'Combed up',
      ],
      'parejas_espanol': [
        '¿Cómo se llama?',
        'Mi nombre es',
        'Café negro',
        'Solo con tijera',
        'Peinado hacia arriba',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Do you have an appointment?',
      'respuesta_correcta': 'Good morning! Do you have an appointment?',
      'fonetica': '[ gud MOR-ning · du iu jav an a-POINT-ment ]',
      'traduccion_pregunta': '¡Buenos días! ¿Tiene cita?',
      'contexto_es': 'Llega un cliente a la barbería',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Do you have an appointment?" ¿Qué responde el cliente?',
      'traduccion_pregunta': '¿Tiene cita? — No, no tengo cita.',
      'respuesta_correcta': 'No, I do not have an appointment.',
      'opciones': [
        'No, I do not have an appointment.',
        'Combed up.',
        'Great job!',
      ],
      'contexto_es': 'El cliente llega sin cita',
    },

    // ── EJ 06 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'I do not have an appointment.',
      'traduccion_pregunta': 'No tengo cita.',
      'palabras': ['appointment', 'an', 'have', 'not', 'do', 'I'],
      'respuesta_correcta': 'I do not have an appointment',
      'contexto_es': 'I do not have + an appointment',
    },

    // ── EJ 07 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Let me check. Would you like to wait?',
      'respuesta_correcta': 'No problem! Let me check. Would you like to wait?',
      'fonetica': '[ nou PROB-lem · let mi CHEK · wud iu LAIK tu UEIT ]',
      'traduccion_pregunta':
          '¡No hay problema! Déjame revisar. ¿Prefiere esperar?',
      'contexto_es': 'Revisas la agenda para el cliente sin cita',
    },

    // ── EJ 08 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Would you like to ___?',
      'traduccion_pregunta': '¿Prefiere esperar?',
      'respuesta_correcta': 'wait',
      'opciones': ['wait', 'fade', 'coffee'],
      'contexto_es': 'Would you like to wait? = ¿prefiere esperar?',
    },

    // ── EJ 09 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Llegó temprano"?',
      'traduccion_pregunta': 'You are early = Llegó temprano',
      'respuesta_correcta': 'You are early',
      'opciones': ['You are early', 'Great job', 'Be patient'],
      'contexto_es': 'You are early = llegó temprano',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Black coffee, please. Thank you!',
      'respuesta_correcta': 'Black coffee, please. Thank you!',
      'fonetica': '[ BLAK KO-fi · plis · ZANK iu ]',
      'traduccion_pregunta': 'Café negro, por favor. ¡Gracias!',
      'contexto_es': 'El cliente pide algo mientras espera',
    },

    // ── EJ 11 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'What is your name?',
      'traduccion_pregunta': '¿Cómo se llama?',
      'palabras': ['is', 'name', 'your', 'What'],
      'respuesta_correcta': 'What is your name',
      'contexto_es': 'What is + your name',
    },

    // ── EJ 12 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú dices y el cliente responde',
      'frase': 'Come to the chair. My name is Eduardo.',
      'respuesta_correcta': 'Come to the chair. My name is Eduardo.',
      'fonetica': '[ kom tu de CHER · mai NEIM is e-DUAR-do ]',
      'traduccion_pregunta': 'Pase a la silla. Mi nombre es Eduardo.',
      'contexto_es': 'Llega el turno del cliente',
    },

    // ── EJ 13 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'How would you like your ___?',
      'traduccion_pregunta': '¿Cómo le gustaría su corte?',
      'respuesta_correcta': 'haircut',
      'opciones': ['haircut', 'coffee', 'water'],
      'contexto_es': 'Your haircut = su corte',
    },

    // ── EJ 14 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Classic, please. Not too short on the sides.',
      'respuesta_correcta': 'Classic, please. Not too short on the sides.',
      'fonetica': '[ KLA-sik · plis · NOT tu SHORT on de SAIDS ]',
      'traduccion_pregunta': 'Clásico, por favor. No muy corto en los lados.',
      'contexto_es': 'El cliente pide un corte clásico',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Un poco más largo"?',
      'traduccion_pregunta': 'A little longer = Un poco más largo',
      'respuesta_correcta': 'A little longer',
      'opciones': ['A little longer', 'Not too short', 'Low fade'],
      'contexto_es': 'A little longer = un poco más largo',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Scissors only. I trust you.',
      'respuesta_correcta': 'Scissors only. I trust you.',
      'fonetica': '[ SI-sors ON-li · ai TRAST iu ]',
      'traduccion_pregunta': 'Solo con tijera. Confío en ti.',
      'contexto_es': 'El cliente confía en el barbero',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Combed up. ___, please.',
      'traduccion_pregunta': 'Peinado hacia arriba. Desordenado, por favor.',
      'respuesta_correcta': 'Messy',
      'opciones': ['Messy', 'Fresh', 'Ready'],
      'contexto_es': 'Messy = desordenado',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Mira hacia un lado"?',
      'traduccion_pregunta': 'Look to the side = Mira hacia un lado',
      'respuesta_correcta': 'Look to the side',
      'opciones': ['Look to the side', 'Combed to the side', 'Look down'],
      'contexto_es': 'Look to the side = mira · Combed to the side = peinado',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Perfect! Like new! Great job!',
      'respuesta_correcta': 'Perfect! Like new! Great job!',
      'fonetica': '[ PER-fekt · LAIK niu · GREIT YOB ]',
      'traduccion_pregunta': '¡Perfecto! ¡Como nuevo! ¡Buen trabajo!',
      'contexto_es': 'El cliente ve el corte terminado',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero termina el corte — ¿qué responde el cliente?',
      'quien_habla': '¡Tu cliente del corte clásico! 🏆',
      'frase': 'Perfect! Fresh! Like new!',
      'traduccion_pregunta': '¡Perfecto! ¡Fresco! ¡Como nuevo!',
      'cliente_dice': 'Perfect! Fresh! Like new!',
      'traduccion_cliente': '¡Perfecto! ¡Fresco! ¡Como nuevo!',
      'respuesta_correcta': 'Great job! Thank you! See you next time.',
      'traduccion_respuesta': '¡Buen trabajo! ¡Gracias! Nos vemos la próxima.',
      'opciones_barbero': [
        'Great job! Thank you! See you next time.',
        'You are early.',
        'I do not have an appointment.',
      ],
      'contexto_es': 'El cliente se despide contento',
    },

  ],
);
