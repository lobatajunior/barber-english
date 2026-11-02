import '../../../../models/lesson.dart';

// BARBER ZONE · L11 — Your Name (Conversación 1, corte degradado)
//
// Unidades NUEVAS L11 (5):
//   1. What is your name?  [ UAT is ior NEIM ]
//   2. My name is          [ mai NEIM is ]
//   3. You are early       [ iu ar ER-li ]
//   4. Black coffee        [ BLAK KO-fi ]
//   5. Come to the chair   [ kom tu de CHER ]
//
// "What", "is", "are", "to" y "the" solo aparecen dentro de estas
// expresiones fijas, nunca sueltos. "Santiago" es nombre propio.
//
// Repaso L02: Have a seat · Would you like · Water · Coffee · Thank you
//             · Of course
// Repaso L05: Hair wash · See you next time
// Repaso L06: Good morning · Low · Fade
// Repaso L07: Modern · Fresh
// Repaso L08: I trust you · Like new
// Repaso L09: I have an appointment · Be patient · Do not move
// Repaso L10: Combed up · Scissors only
// Sin cifras, sin "it", "his", "her" ni "he".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L12, L13 y L14.

const lesson11YourName = Lesson(
  id: 11,
  title: 'Your Name',
  description: 'El cliente llega temprano a su cita',
  emoji: '☕',
  level: Level.A1,
  descripcionEs:
      'El cliente llega antes de su cita: pregúntale su nombre, ofrécele un '
      'café negro e invítalo a pasar a la silla.',
  motivacionEs:
      '¡Ya sabes recibir al cliente por su nombre en inglés! 🙌',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: What is your name? · My name is · You are early
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'What is your name, My name is, You are early',
      'respuesta_correcta': 'What is your name, My name is, You are early',
      'fonetica': '[ UAT is ior NEIM · mai NEIM is · iu ar ER-li ]',
      'traduccion_pregunta': '¿Cómo se llama? · Mi nombre es · Llegó temprano',
      'contexto_es': 'Para presentarse con el cliente',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Black coffee · Come to the chair
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Black coffee, Come to the chair',
      'respuesta_correcta': 'Black coffee, Come to the chair',
      'fonetica': '[ BLAK KO-fi · kom tu de CHER ]',
      'traduccion_pregunta': 'Café negro · Pase a la silla',
      'contexto_es': 'Para atender al cliente mientras espera',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'What is your name?',
        'My name is',
        'You are early',
        'Black coffee',
        'Come to the chair',
      ],
      'parejas_espanol': [
        '¿Cómo se llama?',
        'Mi nombre es',
        'Llegó temprano',
        'Café negro',
        'Pase a la silla',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la pregunta y la respuesta',
      'quien_habla': 'Barbero y cliente',
      'frase': 'What is your name? My name is Santiago.',
      'respuesta_correcta': 'What is your name? My name is Santiago.',
      'fonetica': '[ UAT is ior NEIM · mai NEIM is san-TIA-go ]',
      'traduccion_pregunta': '¿Cómo se llama? Mi nombre es Santiago.',
      'contexto_es': 'Preguntas el nombre y el cliente se presenta',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Café negro"?',
      'traduccion_pregunta': 'Black coffee = Café negro',
      'respuesta_correcta': 'Black coffee',
      'opciones': ['Black coffee', 'Hair wash', 'Like new'],
      'contexto_es': 'Black = negro · Coffee = café',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Of course! You are early.',
      'respuesta_correcta': 'Of course! You are early.',
      'fonetica': '[ of KORS · iu ar ER-li ]',
      'traduccion_pregunta': '¡Por supuesto! Llegó temprano.',
      'contexto_es': 'El cliente llega unos minutos antes',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'You are early.',
      'traduccion_pregunta': 'Llegó temprano.',
      'palabras': ['early', 'are', 'You'],
      'respuesta_correcta': 'You are early',
      'contexto_es': 'You are + early',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del barbero',
      'quien_habla': 'Practica',
      'pregunta':
          'Cliente: "Good morning! I have an appointment." ¿Qué responde el barbero?',
      'traduccion_pregunta':
          '¡Buenos días! Tengo una cita. — ¡Por supuesto! Llegó temprano.',
      'respuesta_correcta': 'Of course! You are early.',
      'opciones': [
        'Of course! You are early.',
        'See you next time.',
        'Black coffee.',
      ],
      'contexto_es': 'Confirmas la cita y le dices que llegó temprano',
    },

    // ── EJ 09 · PAREJAS (repaso L02 + L06 + L08 + L10) ────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'Good morning',
        'Have a seat',
        'Combed up',
        'Scissors only',
        'I trust you',
      ],
      'parejas_espanol': [
        'Buenos días',
        'Toma asiento',
        'Peinado hacia arriba',
        'Solo con tijera',
        'Confío en ti',
      ],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
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
      'contexto_es': 'El cliente pide su café mientras espera',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': '___ coffee, please.',
      'traduccion_pregunta': 'Café negro, por favor.',
      'respuesta_correcta': 'Black',
      'opciones': ['Black', 'Low', 'Modern'],
      'contexto_es': 'Black coffee = café negro',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Would you like water or coffee?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Le gustaría agua o café? — Café negro, por favor.',
      'respuesta_correcta': 'Black coffee, please.',
      'opciones': [
        'Black coffee, please.',
        'You are early.',
        'Come to the chair.',
      ],
      'contexto_es': 'El cliente elige café negro',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Come to the chair. What is your name?',
      'respuesta_correcta': 'Come to the chair. What is your name?',
      'fonetica': '[ kom tu de CHER · UAT is ior NEIM ]',
      'traduccion_pregunta': 'Pase a la silla. ¿Cómo se llama?',
      'contexto_es': 'Lo pasas a la silla y le preguntas el nombre',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Come to the chair.',
      'traduccion_pregunta': 'Pase a la silla.',
      'palabras': ['chair', 'the', 'to', 'Come'],
      'respuesta_correcta': 'Come to the chair',
      'contexto_es': 'Come + to the chair',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta': 'Barbero: "What is your name?" ¿Qué responde el cliente?',
      'traduccion_pregunta':
          '¿Cómo se llama? — Mi nombre es Santiago.',
      'respuesta_correcta': 'My name is Santiago.',
      'opciones': [
        'My name is Santiago.',
        'Black coffee, please.',
        'Fresh! Like new!',
      ],
      'contexto_es': 'My name is + tu nombre',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase del cliente',
      'quien_habla': 'El cliente dice',
      'frase': 'My ___ is Santiago.',
      'traduccion_pregunta': 'Mi nombre es Santiago.',
      'respuesta_correcta': 'name',
      'opciones': ['name', 'coffee', 'fade'],
      'contexto_es': 'Name = nombre',
    },

    // ── EJ 17 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Good morning! My name is Santiago.',
      'respuesta_correcta': 'Good morning! My name is Santiago.',
      'fonetica': '[ gud MOR-ning · mai NEIM is san-TIA-go ]',
      'traduccion_pregunta': '¡Buenos días! Mi nombre es Santiago.',
      'contexto_es': 'El cliente saluda y se presenta',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Llegó temprano"?',
      'traduccion_pregunta': 'You are early = Llegó temprano',
      'respuesta_correcta': 'You are early',
      'opciones': ['You are early', 'Be patient', 'Do not move'],
      'contexto_es': 'Early = temprano',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'El cliente dice',
      'frase': 'Good morning! I have an appointment.',
      'respuesta_correcta': 'Good morning! I have an appointment.',
      'fonetica': '[ gud MOR-ning · ai jav an a-POINT-ment ]',
      'traduccion_pregunta': '¡Buenos días! Tengo una cita.',
      'contexto_es': 'Repaso: el cliente llega con cita',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero le pregunta el nombre — ¿qué responde el cliente?',
      'quien_habla': '¡Tu cliente se presenta! 🏆',
      'frase': 'Come to the chair. What is your name?',
      'traduccion_pregunta': 'Pase a la silla. ¿Cómo se llama?',
      'cliente_dice': 'Come to the chair. What is your name?',
      'traduccion_cliente': 'Pase a la silla. ¿Cómo se llama?',
      'respuesta_correcta': 'My name is Santiago.',
      'traduccion_respuesta': 'Mi nombre es Santiago.',
      'opciones_barbero': [
        'My name is Santiago.',
        'Black coffee, please.',
        'You are early.',
      ],
      'contexto_es': 'El cliente se presenta por su nombre',
    },

  ],
);
