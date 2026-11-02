import '../../../../models/lesson.dart';

// BARBER ZONE · L12 — Look Down (Conversación 3, corte de niño)
//
// Unidades NUEVAS L12 (5):
//   1. Look down           [ LUK DAUN ]
//   2. Look to the side    [ LUK tu de SAID ]
//   3. Head up             [ JED AP ]
//   4. Combed to the side  [ KOUMD tu de SAID ]
//   5. Mom                 [ MOM ]
//
// "to", "the", "up" y "or" solo aparecen dentro de expresiones fijas o como
// palabras de apoyo. "Santi" es nombre propio.
//
// Repaso L01: Come in · No problem
// Repaso L02: Have a seat · Coffee · Water
// Repaso L03: How · Your haircut · On the sides
// Repaso L04: Perfect
// Repaso L05: See you next time
// Repaso L06: Good morning · Low · Fade · Razor · Beard
// Repaso L07: Modern
// Repaso L08: Like new
// Repaso L09: I have a photo · Be patient · Do not move
// Repaso L10: Combed up
// Repaso L11: Black coffee
// Sin cifras, sin "it", "his", "her" ni "he".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L13, L14 y L15.

const lesson12LookDown = Lesson(
  id: 12,
  title: 'Look Down',
  description: 'Cortar el pelo a un niño que se mueve',
  emoji: '🧒',
  level: Level.A1,
  descripcionEs:
      'Sigue el corte de niño: recibe a la mamá, pídele al niño que mire '
      'hacia abajo, hacia un lado o que levante la cabeza.',
  motivacionEs:
      '¡Con paciencia y en inglés, el niño sale como nuevo! 🌟',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Look down · Look to the side · Head up
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Look down, Look to the side, Head up',
      'respuesta_correcta': 'Look down, Look to the side, Head up',
      'fonetica': '[ LUK DAUN · LUK tu de SAID · JED AP ]',
      'traduccion_pregunta':
          'Mira hacia abajo · Mira hacia un lado · Levanta la cabeza',
      'contexto_es': 'Para guiar al niño durante el corte',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Combed to the side · Mom
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Combed to the side, Mom',
      'respuesta_correcta': 'Combed to the side, Mom',
      'fonetica': '[ KOUMD tu de SAID · MOM ]',
      'traduccion_pregunta': 'Peinado hacia un lado · Mamá',
      'contexto_es': 'Para hablar con la mamá del peinado',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'Look down',
        'Look to the side',
        'Head up',
        'Combed to the side',
        'Mom',
      ],
      'parejas_espanol': [
        'Mira hacia abajo',
        'Mira hacia un lado',
        'Levanta la cabeza',
        'Peinado hacia un lado',
        'Mamá',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Come in, Mom. Have a seat.',
      'respuesta_correcta': 'Come in, Mom. Have a seat.',
      'fonetica': '[ kom IN · MOM · jav a SIIT ]',
      'traduccion_pregunta': 'Pasa, mamá. Toma asiento.',
      'contexto_es': 'Recibes a la mamá del niño',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Mamá"?',
      'traduccion_pregunta': 'Mom = Mamá',
      'respuesta_correcta': 'Mom',
      'opciones': ['Mom', 'Beard', 'Razor'],
      'contexto_es': 'Mom = mamá',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Look down, please.',
      'respuesta_correcta': 'Look down, please.',
      'fonetica': '[ LUK DAUN · plis ]',
      'traduccion_pregunta': 'Mira hacia abajo, por favor.',
      'contexto_es': 'Para cortar la nuca',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Look down, please.',
      'traduccion_pregunta': 'Mira hacia abajo, por favor.',
      'palabras': ['down', 'Look', 'please'],
      'respuesta_correcta': 'Look down please',
      'contexto_es': 'Look + down',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige qué le dices al niño',
      'quien_habla': 'Practica',
      'pregunta':
          'El niño mira al frente y quieres que mire hacia abajo. ¿Qué le dices?',
      'traduccion_pregunta': 'Look down, please. = Mira hacia abajo, por favor.',
      'respuesta_correcta': 'Look down, please.',
      'opciones': ['Look down, please.', 'Head up, please.', 'Come in, please.'],
      'contexto_es': 'Look down = abajo · Head up = arriba',
    },

    // ── EJ 09 · PAREJAS (repaso L08 + L09 + L10) ──────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'Be patient',
        'Do not move',
        'I have a photo',
        'Combed up',
        'Like new',
      ],
      'parejas_espanol': [
        'Ten paciencia',
        'No te muevas',
        'Tengo una foto',
        'Peinado hacia arriba',
        'Como nuevo',
      ],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'La mamá dice',
      'frase': 'Combed to the side. Low fade, please.',
      'respuesta_correcta': 'Combed to the side. Low fade, please.',
      'fonetica': '[ KOUMD tu de SAID · LOU FEID · plis ]',
      'traduccion_pregunta': 'Peinado hacia un lado. Degradado bajo, por favor.',
      'contexto_es': 'La mamá pide el corte del niño',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Look to the ___, please.',
      'traduccion_pregunta': 'Mira hacia un lado, por favor.',
      'respuesta_correcta': 'side',
      'opciones': ['side', 'coffee', 'water'],
      'contexto_es': 'Look to the side = mira hacia un lado',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta de la mamá',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "How would you like your haircut?" ¿Qué responde Mom?',
      'traduccion_pregunta':
          '¿Cómo le gustaría su corte? — Moderno, por favor. Tengo una foto.',
      'respuesta_correcta': 'Modern, please. I have a photo.',
      'opciones': [
        'Modern, please. I have a photo.',
        'See you next time.',
        'Look down, please.',
      ],
      'contexto_es': 'La mamá quiere algo moderno y trae una foto',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Santi, do not move. Look down.',
      'respuesta_correcta': 'Santi, do not move. Look down.',
      'fonetica': '[ SAN-ti · du NOT muv · LUK DAUN ]',
      'traduccion_pregunta': 'Santi, no te muevas. Mira hacia abajo.',
      'contexto_es': 'Le hablas al niño por su nombre',
    },

    // ── EJ 14 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Head up, please.',
      'traduccion_pregunta': 'Levanta la cabeza, por favor.',
      'palabras': ['up', 'Head', 'please'],
      'respuesta_correcta': 'Head up please',
      'contexto_es': 'Head + up',
    },

    // ── EJ 15 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Peinado hacia un lado"?',
      'traduccion_pregunta': 'Combed to the side = Peinado hacia un lado',
      'respuesta_correcta': 'Combed to the side',
      'opciones': ['Combed to the side', 'On the sides', 'Combed up'],
      'contexto_es': 'Combed up = hacia arriba · Combed to the side = hacia un lado',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Head up. Look to the side.',
      'respuesta_correcta': 'Head up. Look to the side.',
      'fonetica': '[ JED AP · LUK tu de SAID ]',
      'traduccion_pregunta': 'Levanta la cabeza. Mira hacia un lado.',
      'contexto_es': 'Para cortar los lados',
    },

    // ── EJ 17 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': '___ up, please.',
      'traduccion_pregunta': 'Levanta la cabeza, por favor.',
      'respuesta_correcta': 'Head',
      'opciones': ['Head', 'Water', 'Beard'],
      'contexto_es': 'Head up = levanta la cabeza',
    },

    // ── EJ 18 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del barbero',
      'quien_habla': 'Practica',
      'pregunta': 'Mom: "Be patient, please." ¿Qué responde el barbero?',
      'traduccion_pregunta':
          'Ten paciencia, por favor. — ¡No hay problema!',
      'respuesta_correcta': 'No problem!',
      'opciones': ['No problem!', 'Good morning!', 'Look down.'],
      'contexto_es': 'Tranquilizas a la mamá',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'No problem! Perfect! Like new!',
      'respuesta_correcta': 'No problem! Perfect! Like new!',
      'fonetica': '[ nou PROB-lem · PER-fekt · LAIK niu ]',
      'traduccion_pregunta': '¡No hay problema! ¡Perfecto! ¡Como nuevo!',
      'contexto_es': 'El niño quedó como nuevo',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero pregunta por el peinado — ¿qué responde la mamá?',
      'quien_habla': '¡Tu cliente niño y su mamá! 🏆',
      'frase': 'Combed up or combed to the side?',
      'traduccion_pregunta': '¿Peinado hacia arriba o hacia un lado?',
      'cliente_dice': 'Combed up or combed to the side?',
      'traduccion_cliente': '¿Peinado hacia arriba o hacia un lado?',
      'respuesta_correcta': 'Combed to the side. Low fade, please.',
      'traduccion_respuesta':
          'Peinado hacia un lado. Degradado bajo, por favor.',
      'opciones_barbero': [
        'Combed to the side. Low fade, please.',
        'See you next time.',
        'Black coffee.',
      ],
      'contexto_es': 'La mamá elige el peinado del niño',
    },

  ],
);
