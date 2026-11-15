import '../../../../models/lesson.dart';

// BARBER ZONE · L13 — Cartoons (Conversación 3, corte de niño)
//
// Unidades NUEVAS L13 (5):
//   1. Cartoons on the phone      [ KAR-tunz on de FOUN ]
//   2. Do you like your haircut?  [ du iu LAIK ior JER-kat ]
//   3. Like the photo             [ LAIK de FOU-tou ]
//   4. Great job                  [ GREIT YOB ]
//   5. Little boy                 [ LI-rol BOI ]
//
// "on", "the", "do", "you" y "like" solo aparecen dentro de expresiones fijas
// o como palabras de apoyo. "Eduardo" es nombre propio.
//
// Repaso L01: No problem
// Repaso L02: Would you like · Water · Coffee · Thank you
// Repaso L03: How · Your haircut
// Repaso L04: On top · Perfect
// Repaso L05: Yes · See you next time
// Repaso L06: Low
// Repaso L08: Sideburns · Combed back · Product · Like new
// Repaso L09: I have an appointment · For my son · I have a photo
//             · Be patient · Do not move
// Repaso L10: Scissors only
// Repaso L12: Look down · Head up · Combed to the side · Mom
// Sin cifras, sin "it", "his", "her", "he" ni "What".
// Repaso obligatorio: las 5 unidades nuevas deben aparecer en L14, L15 y L16.

const lesson13Cartoons = Lesson(
  id: 13,
  title: 'Cartoons',
  description: 'Terminar el corte del niño y despedir a la mamá',
  emoji: '📱',
  level: Level.A1,
  descripcionEs:
      'Termina el corte de niño: ofrece dibujos animados en el teléfono, '
      'corta como la foto y pregunta si le gusta el corte.',
  motivacionEs:
      '¡Buen trabajo! El niño y su mamá se van felices. 🌟',
  exercises: [

    // ── EJ 01 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Cartoons on the phone · Do you like your haircut? · Like the photo
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 3 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Cartoons on the phone, Do you like your haircut?, Like the photo',
      'respuesta_correcta':
          'Cartoons on the phone, Do you like your haircut?, Like the photo',
      'fonetica': '[ KAR-tunz on de FOUN · du iu LAIK ior JER-kat · LAIK de FOU-tou ]',
      'traduccion_pregunta':
          'Dibujos animados en el teléfono · ¿Le gusta su corte? · Como la foto',
      'contexto_es': 'Para el corte del niño',
    },

    // ── EJ 02 · PRONUNCIACIÓN (lista) ─────────────────────────────────────
    // Nuevas: Great job · Little boy
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Escucha y repite las 2 expresiones',
      'quien_habla': 'Tú dices',
      'frase': 'Great job, Little boy',
      'respuesta_correcta': 'Great job, Little boy',
      'fonetica': '[ GREIT YOB · LI-rol BOI ]',
      'traduccion_pregunta': 'Buen trabajo · Niño pequeño',
      'contexto_es': 'Para hablar con el niño y la mamá',
    },

    // ── EJ 03 · PAREJAS ───────────────────────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'Cartoons on the phone',
        'Do you like your haircut?',
        'Like the photo',
        'Great job',
        'Little boy',
      ],
      'parejas_espanol': [
        'Dibujos animados en el teléfono',
        '¿Le gusta su corte?',
        'Como la foto',
        'Buen trabajo',
        'Niño pequeño',
      ],
      'contexto_es': 'Toca cada expresión en inglés para escucharla',
    },

    // ── EJ 04 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Little boy, look down. Head up. Do not move.',
      'respuesta_correcta': 'Little boy, look down. Head up. Do not move.',
      'fonetica': '[ LI-rol BOI · LUK DAUN · JED AP · du NOT muv ]',
      'traduccion_pregunta':
          'Niño pequeño, mira hacia abajo. Levanta la cabeza. No te muevas.',
      'contexto_es': 'Guías al niño durante el corte',
    },

    // ── EJ 05 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Buen trabajo"?',
      'traduccion_pregunta': 'Great job = Buen trabajo',
      'respuesta_correcta': 'Great job',
      'opciones': ['Great job', 'Like new', 'Be patient'],
      'contexto_es': 'Great job = buen trabajo',
    },

    // ── EJ 06 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices a la mamá',
      'frase': 'No problem! Cartoons on the phone, Mom?',
      'respuesta_correcta': 'No problem! Cartoons on the phone, Mom?',
      'fonetica': '[ nou PROB-lem · KAR-tunz on de FOUN · MOM ]',
      'traduccion_pregunta':
          '¡No hay problema! ¿Dibujos animados en el teléfono, mamá?',
      'contexto_es': 'Para que el niño se quede quieto',
    },

    // ── EJ 07 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices a la mamá',
      'frase': 'Cartoons on the phone.',
      'traduccion_pregunta': 'Dibujos animados en el teléfono.',
      'palabras': ['phone', 'on', 'the', 'Cartoons'],
      'respuesta_correcta': 'Cartoons on the phone',
      'contexto_es': 'Cartoons + on the phone',
    },

    // ── EJ 08 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta de la mamá',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Cartoons on the phone, Mom?" ¿Qué responde Mom?',
      'traduccion_pregunta':
          '¿Dibujos animados en el teléfono, mamá? — ¡Sí, por favor!',
      'respuesta_correcta': 'Yes, please!',
      'opciones': ['Yes, please!', 'See you next time.', 'Do not move.'],
      'contexto_es': 'La mamá acepta los dibujos animados',
    },

    // ── EJ 09 · PAREJAS (repaso L08 + L09) ────────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso — une cada expresión con su traducción',
      'quien_habla': 'Practica',
      'parejas_ingles': [
        'For my son',
        'I have an appointment',
        'Sideburns',
        'Combed back',
        'Product',
      ],
      'parejas_espanol': [
        'Para mi hijo',
        'Tengo una cita',
        'Patillas',
        'Peinado hacia atrás',
        'Producto',
      ],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 10 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'La mamá dice',
      'frase': 'I have a photo. Like the photo, please.',
      'respuesta_correcta': 'I have a photo. Like the photo, please.',
      'fonetica': '[ ai jav a FOU-tou · LAIK de FOU-tou · plis ]',
      'traduccion_pregunta': 'Tengo una foto. Como la foto, por favor.',
      'contexto_es': 'La mamá enseña la foto del corte',
    },

    // ── EJ 11 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'La mamá dice',
      'frase': 'Combed to the side, like the ___.',
      'traduccion_pregunta': 'Peinado hacia un lado, como la foto.',
      'respuesta_correcta': 'photo',
      'opciones': ['photo', 'coffee', 'water'],
      'contexto_es': 'Like the photo = como la foto',
    },

    // ── EJ 12 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige cómo se dice en inglés',
      'quien_habla': 'Practica',
      'pregunta': '¿Cómo se dice "Niño pequeño"?',
      'traduccion_pregunta': 'Little boy = Niño pequeño',
      'respuesta_correcta': 'Little boy',
      'opciones': ['Little boy', 'Great job', 'Mom'],
      'contexto_es': 'Little boy = niño pequeño',
    },

    // ── EJ 13 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le dices al niño',
      'frase': 'Little boy, do you like your haircut?',
      'respuesta_correcta': 'Little boy, do you like your haircut?',
      'fonetica': '[ LI-rol BOI · du iu LAIK ior JER-kat ]',
      'traduccion_pregunta': 'Niño pequeño, ¿te gusta tu corte?',
      'contexto_es': 'Le enseñas el corte terminado al niño',
    },

    // ── EJ 14 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la frase correcta',
      'quien_habla': 'Practica',
      'pregunta': '¿Cuál significa "¿Le gusta su corte?"?',
      'traduccion_pregunta':
          'Do you like your haircut? = ¿Le gusta su corte? · '
          'How would you like your haircut? = ¿Cómo le gustaría su corte? · '
          'Would you like product on top? = ¿Le gustaría producto arriba?',
      'respuesta_correcta': 'Do you like your haircut?',
      'opciones': [
        'Do you like your haircut?',
        'How would you like your haircut?',
        'Would you like product on top?',
      ],
      'contexto_es': 'Do you like = ¿le gusta? · Would you like = ¿le gustaría?',
    },

    // ── EJ 15 · ORDENAR ───────────────────────────────────────────────────
    {
      'tipo': 'ordenar',
      'instruccion': 'Ordena la frase',
      'quien_habla': 'Tú le dices',
      'frase': 'Do you like your haircut?',
      'traduccion_pregunta': '¿Le gusta su corte?',
      'palabras': ['haircut', 'your', 'like', 'you', 'Do'],
      'respuesta_correcta': 'Do you like your haircut',
      'contexto_es': 'Do you like + your haircut',
    },

    // ── EJ 16 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'Tú le preguntas y la mamá responde',
      'frase': 'Would you like product on top? Yes, please. Combed back.',
      'respuesta_correcta':
          'Would you like product on top? Yes, please. Combed back.',
      'fonetica': '[ wud iu LAIK PRO-dakt on TOP · IES plis · KOUMD BAK ]',
      'traduccion_pregunta':
          '¿Le gustaría producto arriba? Sí, por favor. Peinado hacia atrás.',
      'contexto_es': 'El peinado final del niño',
    },

    // ── EJ 17 · OPCIONES ──────────────────────────────────────────────────
    {
      'tipo': 'opciones',
      'instruccion': 'Elige la respuesta del cliente',
      'quien_habla': 'Practica',
      'pregunta':
          'Barbero: "Would you like your sideburns low?" ¿Qué responde Eduardo?',
      'traduccion_pregunta':
          '¿Le gustarían las patillas bajas? — Sí, por favor. Solo con tijera.',
      'respuesta_correcta': 'Yes, please. Scissors only.',
      'opciones': [
        'Yes, please. Scissors only.',
        'Cartoons on the phone.',
        'For my son.',
      ],
      'contexto_es': 'Eduardo responde sobre las patillas',
    },

    // ── EJ 18 · COMPLETAR ─────────────────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa la frase',
      'quien_habla': 'La mamá dice',
      'frase': '___ job! Thank you!',
      'traduccion_pregunta': '¡Buen trabajo! ¡Gracias!',
      'respuesta_correcta': 'Great',
      'opciones': ['Great', 'Low', 'Water'],
      'contexto_es': 'Great job = buen trabajo',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─────────────────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la frase',
      'quien_habla': 'La mamá dice',
      'frase': 'Great job! Thank you! See you next time.',
      'respuesta_correcta': 'Great job! Thank you! See you next time.',
      'fonetica': '[ GREIT YOB · ZANK iu · SI iu nekst TAIM ]',
      'traduccion_pregunta': '¡Buen trabajo! ¡Gracias! Nos vemos la próxima.',
      'contexto_es': 'La mamá se despide contenta',
    },

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    {
      'tipo': 'dialogo',
      'instruccion': 'El barbero termina el corte — ¿qué responde la mamá?',
      'quien_habla': '¡Tu cliente niño y su mamá! 🏆',
      'frase': 'Perfect! Like new! Do you like your haircut?',
      'traduccion_pregunta': '¡Perfecto! ¡Como nuevo! ¿Le gusta su corte?',
      'cliente_dice': 'Perfect! Like new! Do you like your haircut?',
      'traduccion_cliente': '¡Perfecto! ¡Como nuevo! ¿Le gusta su corte?',
      'respuesta_correcta': 'Great job! Thank you!',
      'traduccion_respuesta': '¡Buen trabajo! ¡Gracias!',
      'opciones_barbero': [
        'Great job! Thank you!',
        'Cartoons on the phone.',
        'Be patient, please.',
      ],
      'contexto_es': 'La mamá está feliz con el corte',
    },

  ],
);
