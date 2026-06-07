import '../../../../models/lesson.dart';

// ════════════════════════════════════════════════════════════════════════════
// REPASO TOTAL A1 — Las 80 palabras de L01 a L15
//
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L02: Sit down · My name is · What's your name · Nice to meet you · Take a seat
//   L03: Haircut · Fade · Sides · Top · Longer
//   L04: Do you have · Wait · Minutes · No problem · Please wait
//   L05: Son · Move · Patient · Photo · Modern
//   L06: Number one · Short · Long · Same · Little
//   L07: Water · Coffee · Drink · While · Something
//   L08: Scissors · Classic · Style · Comb · Neat
//   L09: Wash · Hair · Fresh · Ready · Street
//   L10: Still · Look down · Turn · Head · Careful
//   L11: Like · Similar · Possible · Different · Close
//   L12: Beard · Sideburns · Shape · Clean · Line
//   L13: Volume · Texture · Product · Natural · Messy
//   L14: Done · Look · Great · New · Happy
//   L15: Goodbye · See you · Next time · Thank you · Pleasure
// ════════════════════════════════════════════════════════════════════════════

const lesson16FullReview = Lesson(
  id: 16,
  title: 'Full Review A1',
  description: 'Repaso de todas las palabras — ¡eres un barbero bilingüe!',
  emoji: '🏆',
  level: Level.A1,
  descripcionEs:
      'Repaso completo de las 80 palabras del nivel A1. '
      'Pondrás a prueba todo lo que has aprendido desde el primer saludo '
      'hasta la despedida final — la experiencia completa del barbero bilingüe.',
  motivacionEs:
      '¡Has llegado al final del nivel A1! '
      'Cada cliente que entra por tu puerta ya lo puedes atender en inglés de principio a fin. '
      '¡Eso es hablar el idioma del oficio! 🏆',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso por grupos temáticos (EJ 01–04)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS ─ L01 + L02 + L04 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repasa el vocabulario de bienvenida y citas',
      'quien_habla': 'Practica',
      'frase': 'Of course · Take a seat · No problem · Please wait',
      'traduccion_pregunta': 'Claro · Tome asiento · No hay problema · Por favor espere',
      'parejas_ingles': ['Of course', 'Take a seat', 'No problem', 'Please wait'],
      'parejas_espanol': ['Claro', 'Tome asiento', 'No hay problema', 'Por favor espere'],
      'contexto_es': 'L01 · L02 · L04 — recibir y gestionar al cliente',
    },

    // ── EJ 02 · PAREJAS ─ L05 + L07 + L08 + L09 ─────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repasa el vocabulario de atención y herramientas',
      'quien_habla': 'Practica',
      'frase': 'Patient · Coffee · Scissors · Ready',
      'traduccion_pregunta': 'Paciente · Café · Tijera · Listo',
      'parejas_ingles': ['Patient', 'Coffee', 'Scissors', 'Ready'],
      'parejas_espanol': ['Paciente', 'Café', 'Tijera', 'Listo'],
      'contexto_es': 'L05 · L07 · L08 · L09 — el cliente cómodo y el corte correcto',
    },

    // ── EJ 03 · PAREJAS ─ L10 + L11 + L12 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repasa el vocabulario del niño y la foto de referencia',
      'quien_habla': 'Practica',
      'frase': 'Head · Similar · Beard · Clean',
      'traduccion_pregunta': 'Cabeza · Similar · Barba · Limpio',
      'parejas_ingles': ['Head', 'Similar', 'Beard', 'Clean'],
      'parejas_espanol': ['Cabeza', 'Similar', 'Barba', 'Limpio'],
      'contexto_es': 'L10 · L11 · L12 — instrucciones, foto y barba',
    },

    // ── EJ 04 · PAREJAS ─ L13 + L14 + L15 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repasa el vocabulario del estilo y la despedida',
      'quien_habla': 'Practica',
      'frase': 'Volume · Done · Thank you · Pleasure',
      'traduccion_pregunta': 'Volumen · Listo · Gracias · Un gusto',
      'parejas_ingles': ['Volume', 'Done', 'Thank you', 'Pleasure'],
      'parejas_espanol': ['Volumen', 'Listo', 'Gracias', 'Un gusto'],
      'contexto_es': 'L13 · L14 · L15 — el estilo, el resultado y la despedida',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Completar con vocabulario de todas las lecciones (EJ 05–11)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 05 · COMPLETAR L01+L02 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'El cliente llega con cita — completa tu saludo',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Come in, take a ___',
      'traduccion_pregunta': '¡Buenos días! Pase, tome asiento',
      'respuesta_correcta': 'seat',
      'opciones': ['seat', 'appointment', 'welcome', 'morning'],
      'contexto_es': 'L01 + L02 — el saludo perfecto al cliente con cita',
    },

    // ── EJ 06 · COMPLETAR L03+L06 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la descripción del corte',
      'quien_habla': 'El cliente dice',
      'frase': '___ on the sides, long on top',
      'traduccion_pregunta': 'Corto en los lados, largo arriba',
      'respuesta_correcta': 'short',
      'opciones': ['short', 'fade', 'longer', 'number one'],
      'contexto_es': 'L03 + L06 — el largo del corte con precisión',
    },

    // ── EJ 07 · COMPLETAR L04+L07 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'El cliente espera — completa tu oferta',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem, please ___, something to drink',
      'traduccion_pregunta': 'No hay problema, por favor espere, algo de tomar',
      'respuesta_correcta': 'wait',
      'opciones': ['wait', 'drink', 'while', 'minutes'],
      'contexto_es': 'L04 + L07 — manejas al walk-in con hospitalidad',
    },

    // ── EJ 08 · COMPLETAR L08+L09 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa el servicio de corte y lavado',
      'quien_habla': 'Tú le dices',
      'frase': 'Classic style, ___, fresh, ready',
      'traduccion_pregunta': 'Estilo clásico, tijera, fresco, listo',
      'respuesta_correcta': 'scissors',
      'opciones': ['scissors', 'comb', 'neat', 'wash'],
      'contexto_es': 'L08 + L09 — el corte clásico con lavado al final',
    },

    // ── EJ 09 · COMPLETAR L10+L11 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la instrucción con el niño en la silla',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be still, turn your ___, careful',
      'traduccion_pregunta': 'Por favor quédate quieto, voltea la cabeza, con cuidado',
      'respuesta_correcta': 'head',
      'opciones': ['head', 'still', 'turn', 'look down'],
      'contexto_es': 'L10 + L11 — instrucciones de posición con calma',
    },

    // ── EJ 10 · COMPLETAR L12+L13 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa el servicio de barba',
      'quien_habla': 'Tú le dices',
      'frase': '___ beard, shape the sideburns, natural texture',
      'traduccion_pregunta': 'Barba limpia, perfilar las patillas, textura natural',
      'respuesta_correcta': 'clean',
      'opciones': ['clean', 'beard', 'shape', 'line'],
      'contexto_es': 'L12 + L13 — el servicio premium de barba y estilo',
    },

    // ── EJ 11 · COMPLETAR L14+L15 ─────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la despedida final',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Look great, like new, ___?',
      'traduccion_pregunta': '¡Listo! Se ve genial, como nuevo, ¿contento?',
      'respuesta_correcta': 'happy',
      'opciones': ['happy', 'done', 'great', 'new'],
      'contexto_es': 'L14 + L15 — el cierre perfecto del servicio',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Ordenar frases largas (EJ 12–16)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 12 · ORDENAR L01+L02 ───────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma el saludo completo del primer contacto',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning, welcome, take a seat',
      'traduccion_pregunta': 'Buenos días, bienvenido, tome asiento',
      'palabras': ['Good', 'morning', 'welcome', 'take', 'a', 'seat'],
      'respuesta_correcta': 'Good morning welcome take a seat',
      'contexto_es': 'L01 + L02 — la bienvenida perfecta',
    },

    // ── EJ 13 · ORDENAR L03+L06+L08 ──────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la descripción completa del corte',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, longer on top, classic style',
      'traduccion_pregunta': 'Corto en los lados, más largo arriba, estilo clásico',
      'palabras': ['short', 'on', 'the', 'sides', 'longer', 'on', 'top', 'classic', 'style'],
      'respuesta_correcta': 'short on the sides longer on top classic style',
      'contexto_es': 'L03 + L06 + L08 — el corte perfecto en una frase',
    },

    // ── EJ 14 · ORDENAR L07+L04 ───────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la atención al cliente que llega sin cita',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem, please wait, water or coffee',
      'traduccion_pregunta': 'No hay problema, por favor espere, agua o café',
      'palabras': ['No', 'problem', 'please', 'wait', 'water', 'or', 'coffee'],
      'respuesta_correcta': 'No problem please wait water or coffee',
      'contexto_es': 'L04 + L07 — la hospitalidad del barbero profesional',
    },

    // ── EJ 15 · ORDENAR L10+L05 ───────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la secuencia de instrucciones al niño',
      'quien_habla': 'Tú le dices',
      'frase': 'Please be still, son, look down, careful',
      'traduccion_pregunta': 'Por favor quédate quieto, hijo, mira abajo, con cuidado',
      'palabras': ['please', 'be', 'still', 'son', 'look', 'down', 'careful'],
      'respuesta_correcta': 'please be still son look down careful',
      'contexto_es': 'L05 + L10 — trabajas con el niño en la silla con calma',
    },

    // ── EJ 16 · ORDENAR L12+L15 ───────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma el cierre del servicio de barba con despedida',
      'quien_habla': 'Tú le dices',
      'frase': 'Beard, clean line, thank you, see you next time',
      'traduccion_pregunta': 'Barba, línea limpia, gracias, nos vemos la próxima',
      'palabras': ['beard', 'clean', 'line', 'thank', 'you', 'see', 'you', 'next', 'time'],
      'respuesta_correcta': 'beard clean line thank you see you next time',
      'contexto_es': 'L12 + L15 — barba perfecta y despedida memorable',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Pronunciación de frases largas (EJ 17–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 17 · PRONUNCIACIÓN ─ Bienvenida completa (L01+L02+L04) ────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la secuencia completa de bienvenida',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning! Welcome, come in, take a seat. No problem',
      'respuesta_correcta': 'Good morning! Welcome, come in, take a seat. No problem',
      'fonetica': '[ gud MOR-ning, WEL-kom, kom IN, teik a SIIT, nou PROB-lem ]',
      'traduccion_pregunta': '¡Buenos días! Bienvenido, pase, tome asiento. No hay problema',
      'contexto_es': 'L01 + L02 + L04 — los primeros 10 segundos del servicio perfecto',
    },

    // ── EJ 18 · PRONUNCIACIÓN ─ Corte y estilo (L06+L08+L13) ─────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la descripción completa del corte con estilo',
      'quien_habla': 'El cliente dice',
      'frase': 'Short on the sides, classic style, natural texture, no product',
      'respuesta_correcta': 'Short on the sides, classic style, natural texture, no product',
      'fonetica': '[ SHORT on de SAIDS, KLA-sik STAIL, NAT-shu-ral TEKS-cher, nou PRO-dakt ]',
      'traduccion_pregunta': 'Corto en los lados, estilo clásico, textura natural, sin producto',
      'contexto_es': 'L06 + L08 + L13 — el cliente describe su look completo',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ Cierre del servicio (L14+L15) ────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el cierre perfecto del servicio',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Look great, like new. Thank you, a pleasure! See you next time, goodbye',
      'respuesta_correcta': 'Done! Look great, like new. Thank you, a pleasure! See you next time, goodbye',
      'fonetica': '[ DON, luk GREIT, laik NIU, ZANK iu, a PLE-zher, SI iu NEKST taim, gud-BAI ]',
      'traduccion_pregunta': '¡Listo! Se ve genial, como nuevo. ¡Gracias, un gusto! Nos vemos la próxima, adiós',
      'contexto_es': 'L14 + L15 — desde el resultado hasta la despedida final, todo en inglés',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 5 — Diálogo final del nivel A1 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL A1 ──────────────────────────────────────────
    // El cliente describe el corte y el estilo que quiere
    // Respuesta: confirmar el corte de la foto con las palabras del nivel A1
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente describe su corte — elige la respuesta del barbero profesional',
      'quien_habla': '¡Examen final A1! 🏆',
      'frase': 'Short on the sides, like the photo, similar, please',
      'traduccion_pregunta': 'Corto en los lados, como la foto, similar, por favor',
      'cliente_dice': 'Short on the sides, like the photo, similar, please',
      'traduccion_cliente': 'Corto en los lados, como la foto, similar, por favor',
      'respuesta_correcta': 'Of course! Similar to the photo, number one, short on the sides',
      'traduccion_respuesta': '¡Claro! Similar a la foto, número uno, corto en los lados',
      'opciones_barbero': [
        'Of course! Similar to the photo, number one, short on the sides',
        'Do you have an appointment?',
        'Please be still, turn your head, careful',
        'Water or coffee while you wait?',
      ],
      'contexto_es':
          'Of course (L01) + Similar to the photo (L11) + Number one · Short on the sides (L06) — '
          '¡Has completado el nivel A1 de Barber English! 🎉',
    },

  ],
);
