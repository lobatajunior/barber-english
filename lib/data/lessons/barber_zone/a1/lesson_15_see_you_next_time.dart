import '../../../../models/lesson.dart';

// Palabras de REPASO (L01–L14):
//   L01: Good morning · Appointment · Welcome · Come in · Of course
//   L14: Done · Look · Great · New · Happy
//   (más L02–L13 siempre disponibles)
//
// Palabras NUEVAS L15 (en orden de enseñanza):
//   1. Goodbye    [ gud-BAI ]    → Adiós
//   2. See you    [ SI iu ]      → Nos vemos
//   3. Next time  [ NEKST taim ] → La próxima vez
//   4. Thank you  [ ZANK iu ]    → Gracias
//   5. Pleasure   [ PLE-zher ]   → Un gusto / Un placer

const lesson15SeeYouNextTime = Lesson(
  id: 15,
  title: 'See You Next Time',
  description: 'La despedida perfecta que hace volver al cliente',
  emoji: '👋',
  level: Level.A1,
  descripcionEs:
      'Aprenderás las palabras para despedirte del cliente: '
      'darle las gracias, decirle que fue un placer atenderlo '
      'y que lo esperas para la próxima cita.',
  motivacionEs:
      '¡Una despedida perfecta en inglés convierte a un cliente ocasional '
      'en uno de por vida! 👋',
  exercises: [

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 1 — Repaso L01–L14 (EJ 01–03)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 01 · PAREJAS REPASO ────────────────────────────────────────────
    // L14 · L13 · L09 ✓
    {
      'tipo': 'parejas',
      'instruccion': 'Repaso rápido — une cada frase con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Done · Natural · Street',
      'traduccion_pregunta': 'Listo · Natural · Calle',
      'parejas_ingles': ['Done', 'Natural', 'Street'],
      'parejas_espanol': ['Listo', 'Natural', 'Calle'],
      'contexto_es': '¿Recuerdas las lecciones anteriores?',
    },

    // ── EJ 02 · COMPLETAR REPASO L14 ──────────────────────────────────────
    {
      'tipo': 'completar',
      'instruccion': 'Completa el anuncio del final del servicio',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Look ___, like new!',
      'traduccion_pregunta': '¡Listo! ¡Se ve genial, como nuevo!',
      'respuesta_correcta': 'great',
      'opciones': ['great', 'done', 'look', 'happy'],
      'contexto_es': 'Repaso de L14 — el gran momento del resultado',
    },

    // ── EJ 03 · PRONUNCIACIÓN REPASO L14 ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia el anuncio completo del resultado',
      'quien_habla': 'Tú le dices',
      'frase': 'Done! Look great, like new, happy?',
      'respuesta_correcta': 'Done! Look great, like new, happy?',
      'fonetica': '[ DON, luk GREIT, laik NIU, JA-pi ]',
      'traduccion_pregunta': '¡Listo! Se ve genial, como nuevo, ¿contento?',
      'contexto_es': 'Repaso de L14 — el cierre perfecto del servicio',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 2 — Palabras nuevas L15 (EJ 04–13)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 04 · ESCUCHAR 🆕 ─ "Goodbye" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la despedida más universal',
      'quien_habla': 'Tú le dices',
      'frase': 'Goodbye',
      'fonetica': '[ gud-BAI ]',
      'traduccion_pregunta': 'Adiós',
      'contexto_es': 'La despedida que cierra cada servicio con elegancia',
      'es_palabra_nueva': true,
    },

    // ── EJ 05 · PRONUNCIACIÓN ─ "Goodbye" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Goodbye',
      'respuesta_correcta': 'Goodbye',
      'fonetica': '[ gud-BAI ]',
      'traduccion_pregunta': 'Adiós',
      'contexto_es': '"Goodbye!" — con una sonrisa, la mejor tarjeta de presentación',
    },

    // ── EJ 06 · ESCUCHAR 🆕 ─ "See you" ───────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la despedida que invita a volver',
      'quien_habla': 'Tú le dices',
      'frase': 'See you',
      'fonetica': '[ SI iu ]',
      'traduccion_pregunta': 'Nos vemos',
      'contexto_es': '"See you" — más cercano que goodbye, invita a volver',
      'es_palabra_nueva': true,
    },

    // ── EJ 07 · PRONUNCIACIÓN ─ "See you" ─────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'See you',
      'respuesta_correcta': 'See you',
      'fonetica': '[ SI iu ]',
      'traduccion_pregunta': 'Nos vemos',
      'contexto_es': '"See you next time" — nos vemos la próxima',
    },

    // ── EJ 08 · ESCUCHAR 🆕 ─ "Next time" ────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la frase que asegura que el cliente vuelve',
      'quien_habla': 'Tú le dices',
      'frase': 'Next time',
      'fonetica': '[ NEKST taim ]',
      'traduccion_pregunta': 'La próxima vez',
      'contexto_es': '"See you next time" — confirmas que habrá una próxima cita',
      'es_palabra_nueva': true,
    },

    // ── EJ 09 · PRONUNCIACIÓN ─ "Next time" ───────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Next time',
      'respuesta_correcta': 'Next time',
      'fonetica': '[ NEKST taim ]',
      'traduccion_pregunta': 'La próxima vez',
      'contexto_es': 'Dos palabras que valen más que cualquier tarjeta de fidelidad',
    },

    // ── EJ 10 · COMPLETAR ─────────────────────────────────────────────────
    // Disponibles L15: Goodbye · See you · Next time
    {
      'tipo': 'completar',
      'instruccion': 'Completa la despedida',
      'quien_habla': 'Tú le dices',
      'frase': '___ next time, goodbye!',
      'traduccion_pregunta': '¡Nos vemos la próxima vez, adiós!',
      'respuesta_correcta': 'see you',
      'opciones': ['see you', 'goodbye', 'next time', 'of course'],
      'contexto_es': 'La despedida completa en dos frases',
    },

    // ── EJ 11 · ESCUCHAR 🆕 ─ "Thank you" ────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha las dos palabras que más agradece el cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Thank you',
      'fonetica': '[ ZANK iu ]',
      'traduccion_pregunta': 'Gracias',
      'contexto_es': '"Thank you!" — muestra gratitud y profesionalismo',
      'es_palabra_nueva': true,
    },

    // ── EJ 12 · PRONUNCIACIÓN ─ "Thank you" ───────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Thank you',
      'respuesta_correcta': 'Thank you',
      'fonetica': '[ ZANK iu ]',
      'traduccion_pregunta': 'Gracias',
      'contexto_es': '"Thank you!" — el cliente también te lo dice a ti',
    },

    // ── EJ 13 · ESCUCHAR 🆕 ─ "Pleasure" ──────────────────────────────────
    {
      'tipo': 'escuchar',
      'instruccion': 'Escucha la respuesta elegante al "thank you" del cliente',
      'quien_habla': 'Tú le dices',
      'frase': 'Pleasure',
      'fonetica': '[ PLE-zher ]',
      'traduccion_pregunta': 'Un gusto / Un placer',
      'contexto_es': '"A pleasure" — la respuesta de clase al gracias del cliente',
      'es_palabra_nueva': true,
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 3 — Consolidación (EJ 14–19)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 14 · PRONUNCIACIÓN ─ "Pleasure" ────────────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Ahora repítela tú',
      'quien_habla': 'Tú le dices',
      'frase': 'Pleasure',
      'respuesta_correcta': 'Pleasure',
      'fonetica': '[ PLE-zher ]',
      'traduccion_pregunta': 'Un gusto / Un placer',
      'contexto_es': '"A pleasure!" — el toque final que convierte una visita en una experiencia',
    },

    // ── EJ 15 · PAREJAS ─ repaso total L15 ───────────────────────────────
    {
      'tipo': 'parejas',
      'instruccion': 'Une todas las palabras nuevas de hoy con su traducción',
      'quien_habla': 'Practica',
      'frase': 'Goodbye · See you · Next time · Thank you · Pleasure',
      'traduccion_pregunta': 'Adiós · Nos vemos · Próxima vez · Gracias · Un gusto',
      'parejas_ingles': ['Goodbye', 'See you', 'Next time', 'Thank you', 'Pleasure'],
      'parejas_espanol': ['Adiós', 'Nos vemos', 'Próxima vez', 'Gracias', 'Un gusto'],
      'contexto_es': '¿Ya las dominas?',
    },

    // ── EJ 16 · COMPLETAR ─────────────────────────────────────────────────
    // Las 5 palabras de L15 disponibles ✓
    {
      'tipo': 'completar',
      'instruccion': 'Completa la despedida de gratitud',
      'quien_habla': 'Tú le dices',
      'frase': '___ you! See you next time',
      'traduccion_pregunta': '¡Gracias! Nos vemos la próxima vez',
      'respuesta_correcta': 'thank',
      'opciones': ['thank', 'see', 'goodbye', 'pleasure'],
      'contexto_es': 'La despedida agradecida que cierra el servicio',
    },

    // ── EJ 17 · ORDENAR ───────────────────────────────────────────────────
    // Thank · you · see · you · next · time · goodbye (L15) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la despedida completa',
      'quien_habla': 'Tú le dices',
      'frase': 'Thank you, see you next time, goodbye',
      'traduccion_pregunta': 'Gracias, nos vemos la próxima, adiós',
      'palabras': ['thank', 'you', 'see', 'you', 'next', 'time', 'goodbye'],
      'respuesta_correcta': 'thank you see you next time goodbye',
      'contexto_es': 'La despedida perfecta en tres frases clave',
    },

    // ── EJ 18 · ORDENAR REPASO L01+L15 ────────────────────────────────────
    // Good morning (L01) + come in (L01) + thank you · goodbye (L15) ✓
    {
      'tipo': 'ordenar',
      'instruccion': 'Forma la secuencia de la primera y última palabra de la visita',
      'quien_habla': 'Tú le dices',
      'frase': 'Good morning, come in, thank you, goodbye',
      'traduccion_pregunta': 'Buenos días, pase, gracias, adiós',
      'palabras': ['Good', 'morning', 'come', 'in', 'thank', 'you', 'goodbye'],
      'respuesta_correcta': 'Good morning come in thank you goodbye',
      'contexto_es': 'Combinas L01 y L15 — desde la bienvenida hasta la despedida',
    },

    // ── EJ 19 · PRONUNCIACIÓN ─ frase completa L15 ────────────────────────
    {
      'tipo': 'pronunciacion',
      'instruccion': 'Pronuncia la despedida completa y elegante',
      'quien_habla': 'Tú le dices',
      'frase': 'Thank you! A pleasure. See you next time, goodbye!',
      'respuesta_correcta': 'Thank you! A pleasure. See you next time, goodbye!',
      'fonetica': '[ ZANK iu, a PLE-zher, SI iu NEKST taim, gud-BAI ]',
      'traduccion_pregunta': '¡Gracias! Un gusto. Nos vemos la próxima, ¡adiós!',
      'contexto_es': 'La despedida de clase que hace que el cliente ya quiera volver',
    },

    // ════════════════════════════════════════════════════════════════════════
    // BLOQUE 4 — Diálogo final 🏆 (EJ 20)
    // ════════════════════════════════════════════════════════════════════════

    // ── EJ 20 · DIÁLOGO FINAL ─────────────────────────────────────────────
    // Cliente se va satisfecho — opciones SOLO L01–L15 ✓
    // Respuesta correcta: A pleasure (L15) + See you next time (L15) + Goodbye (L15)
    {
      'tipo': 'dialogo',
      'instruccion': 'El cliente se va contento — ¿cómo le dices adiós?',
      'quien_habla': '¡El cliente se va! 👋',
      'frase': 'Thank you! Great haircut!',
      'traduccion_pregunta': '¡Gracias! ¡Corte genial!',
      'cliente_dice': 'Thank you! Great haircut!',
      'traduccion_cliente': '¡Gracias! ¡Corte genial!',
      'respuesta_correcta': 'A pleasure! See you next time, goodbye!',
      'traduccion_respuesta': '¡Un gusto! Nos vemos la próxima, ¡adiós!',
      'opciones_barbero': [
        'A pleasure! See you next time, goodbye!',
        'Do you have an appointment?',
        'Done! Look great, like new, happy?',
        'Water or coffee while you wait?',
      ],
      'contexto_es':
          'A pleasure (L15) + See you next time (L15) + Goodbye (L15) — '
          'la despedida perfecta que convierte al cliente en un fijo',
    },

  ],
);
