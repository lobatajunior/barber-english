# BARBER ENGLISH — CONTEXTO PERMANENTE PARA CLAUDE CODE

## SOBRE EL PROYECTO
App Flutter para que barberos hispanohablantes aprendan inglés.
Desarrollada por Junior — barbero con 16 años de experiencia.
Stack: Flutter + Firebase Auth + Firestore
Web: barber-english.web.app

---

## ARQUITECTURA
```
lib/
  core/          → app_colors.dart, app_theme.dart
  data/          → barber_zone_data.dart, street_english_data.dart
  data/lessons/  → barber_zone/a1/ barber_zone/a2/ etc
  models/        → section.dart, lesson.dart
  providers/     → auth_provider.dart, progress_provider.dart
  screens/       → exercise_screen.dart, home_screen.dart, etc
  services/      → speech_service.dart, progress_service.dart
  widgets/       → todos los widgets de ejercicios
```

---

## COLORES OFICIALES
```dart
fondo:        #080808
verde:        #00E676
cards:        #111111
verde glow:   rgba(0,230,118,0.12)
amarillo:     #FFD600
rojo:         #FF5252
texto blanco: #F5F5F5
texto gris:   #888888
```

---

## SECCIONES DE LA APP
1. BARBER ZONE — Inglés para la barbería
2. STREET ENGLISH — Inglés para la calle

Cada sección tiene 4 niveles: A1 (gratis), A2, B1, B2 (de pago)

---

## SISTEMA DE AUDIO
ResponsiveVoice integrado en web/index.html
Voz: 'US English Female'
Rate: 0.85, Pitch: 1.0, Volume: 1.0

Llamada desde Dart:
```dart
import 'dart:js' as js;
void speakText(String text) {
  js.context.callMethod('eval', ["""
    responsiveVoice.speak('$text', 'US English Female',
      {pitch:1, rate:0.85, volume:1});
  """);
}
```

---

## TIPOS DE EJERCICIOS DISPONIBLES (8)
escuchar, pronunciacion, parejas, completar, ordenar, opciones, dialogo, dialogo_completo
(detalle de campos en el CLAUDE.md de la raíz)

---

## SISTEMA DE PRONUNCIACIÓN
- 100%:   🏆 "¡Pronunciación perfecta!" → verde + confetti
- 70-89%: 👍 "¡Muy bien, se entiende!" → verde suave
- 50-69%: 💪 "Casi, sigue practicando" → amarillo
- 0-49%:  🎯 "Inténtalo de nuevo"      → rojo

---

## REGLAS PEDAGÓGICAS — BARBER ZONE (versión 2, reescritura desde cero)

Las lecciones antiguas L01-L16 se eliminaron (commit f8e3bb8) y se reescriben
con estas reglas. El vocabulario de las lecciones antiguas YA NO cuenta como
enseñado: solo cuenta lo que enseñen las lecciones nuevas.

### REGLA 1 — Estructura por lección
- L01-L02: 8 palabras nuevas, 20 ejercicios
- L03-L15: 5 palabras nuevas, 20 ejercicios
- L16: repaso general (sin palabras nuevas), 20 ejercicios
Total A1: 16 lecciones · 81 palabras nuevas (2×8 + 13×5) · 320 ejercicios

### REGLA 2 — Bloques temáticos
- Bloque 1 (L01-L05): Conversación 2 — corte clásico
- Bloque 2 (L06-L10): Conversación 1 — corte degradado
- Bloque 3 (L11-L15): Conversación 3 — corte de niño
- L16: repaso general de los 3 bloques
Fuente de vocabulario: SOLO `lib/data/conversaciones_raw.md`.

### REGLA 3 — Tipos de ejercicio
- pronunciacion: grupos de 2-3 palabras en lista vertical
  (`respuesta_correcta` = "wait, minutes, please",
   `fonetica` = "[ UEIT · MI-nets · PLIIS ]" — mismo número de partes;
   PronunciacionWidget lo muestra como lista palabra + fonética)
- parejas: grupos de 4 palabras
- opciones: 3 opciones siempre, y SIEMPRE en inglés (la voz las lee en
  inglés al tocarlas). La pregunta (`pregunta`) y `traduccion_pregunta`
  pueden ir en español: '¿Cómo se dice "No hay problema"?' → No problem
- ordenar: frases completas
- completar: desde L03 (no se usa en L01-L02)
- dialogo: el ejercicio 20 de cada lección
(escuchar y dialogo_completo no están en la lista de tipos de esta versión)

### REGLA 4 — Repetición
- Cada palabra nueva se repasa en las 3 lecciones siguientes como mínimo
  (palabra nueva de L04 → aparece también en L05, L06 y L07).
- Los distractores (opciones, completar, ordenar, dialogo) solo usan
  palabras ya enseñadas en lecciones anteriores o antes en la misma lección.

### REGLAS QUE SE MANTIENEN de la versión anterior
- NUNCA usar una palabra en un ejercicio antes de haberla enseñado.
- Sin cifras en frases ni respuestas (la voz y el reconocimiento fallan con "30").
- Nunca más de 2 ejercicios del mismo tipo consecutivos.
- ⚠️ parejas: dentro de un ejercicio no puede haber palabras repetidas ni una
  palabra inglesa idéntica a su traducción (ParejasWidget usa un solo Set).

---

## CONTENIDO BASE — CONVERSACIONES REALES DE JUNIOR

### CONVERSACIÓN 1 — CORTE DEGRADADO
Cliente con cita, fade con textura arriba, barba degradada.
Vocabulario: appointment, fade, sides, top, longer, texture,
razor, volume, product, beard, sideburns, modern touch

### CONVERSACIÓN 2 — CORTE CLÁSICO
Cliente sin cita, espera 30 min, corte con tijera, lavado al final.
Vocabulario: walk-in, schedule, wait, scissors only, not too short,
longer on top, messy style, hair wash, see you next time

### CONVERSACIÓN 3 — CORTE NIÑO
Madre trae a José, niño se mueve, corte por foto.
Vocabulario: son, appointment, move, patient, modern,
photo reference, number one, don't move, look down,
cartoons, next appointment

---

## MAPA DE LECCIONES A1 — BARBER ZONE (versión 2)

Lecciones pendientes de escribir. Al crear cada una, rellenar su fila con el
archivo, el título y las palabras nuevas.

| # | Bloque | Fuente | Palabras nuevas | Archivo | Título |
|---|--------|--------|-----------------|---------|--------|
| L01 | 1 | Conv.2 corte clásico | 8: Hello, Welcome, Come in, Appointment, Do you have, No problem, Please wait, Right now | lesson_01_first_words.dart | First Words |
| L02 | 1 | Conv.2 corte clásico | 8 | — | — |
| L03 | 1 | Conv.2 corte clásico | 5 | — | — |
| L04 | 1 | Conv.2 corte clásico | 5 | — | — |
| L05 | 1 | Conv.2 corte clásico | 5 | — | — |
| L06 | 2 | Conv.1 corte degradado | 5 | — | — |
| L07 | 2 | Conv.1 corte degradado | 5 | — | — |
| L08 | 2 | Conv.1 corte degradado | 5 | — | — |
| L09 | 2 | Conv.1 corte degradado | 5 | — | — |
| L10 | 2 | Conv.1 corte degradado | 5 | — | — |
| L11 | 3 | Conv.3 corte de niño | 5 | — | — |
| L12 | 3 | Conv.3 corte de niño | 5 | — | — |
| L13 | 3 | Conv.3 corte de niño | 5 | — | — |
| L14 | 3 | Conv.3 corte de niño | 5 | — | — |
| L15 | 3 | Conv.3 corte de niño | 5 | — | — |
| L16 | — | Conv.1+2+3 | 0 (repaso general) | — | — |

Total A1: 16 lecciones × 20 ejercicios = 320 ejercicios · 81 palabras nuevas
(la fuente de verdad son los comentarios de cabecera de cada archivo de lección)

---

## STREET ENGLISH — REGLAS PROPIAS

Las REGLAS PEDAGÓGICAS de arriba (20 ejercicios, escuchar → pronunciar,
máx. 5 palabras, máx. 2 del mismo tipo seguidos) son de BARBER ZONE.
Street English sigue sus propias reglas:

- 12 ejercicios por lección.
- Solo tipos: pronunciacion y ordenar.
- Vocabulario SOLO de la lista maestra `lib/data/street_english_vocab.dart`
  (`streetEnglishVocab`). Si una palabra no está, se añade a la lista primero.
  Pronombres (I, you, he, she, we, they) y auxiliares (do, does, don't, doesn't) se
  aceptan como palabras gramaticales.
- Cada lección enseña una regla gramatical, explicada en `descripcionEs`.
- Archivos: `lib/data/lessons/street_english/a1/`, registrados en
  `street_english_data.dart`. Constantes con prefijo `streetLesson`.

### MAPA DE LECCIONES A1 — STREET ENGLISH

| # | Archivo | Título | Regla | Palabras nuevas |
|---|---------|--------|-------|-----------------|
| L01 | lesson_01_present_simple.dart | Present Simple | Presente afirmativo (he/she + s) | work, live, like, want, every, day, here, food |
| L02 | lesson_02_present_negative.dart | Present Negative | Presente negativo (don't / doesn't + verbo) | need, have, time, money, water, now |
| L03 | lesson_03_present_question.dart | Present Questions | Preguntas (Do / Does + sujeto + verbo sin s) | do, does (auxiliares) |
| L04 | lesson_04_questions_answers.dart | Questions & Answers | Respuestas cortas y largas (Yes, I do / No, I don't) | yes, no |
| L05 | lesson_05_review_block1.dart | Review Block 1 | Repaso: afirmativo, negativo, pregunta y respuesta | ninguna (repaso) |
| L06 | lesson_06_past_was_were.dart | Past: Was / Were | Pasado de to be (was con I/he/she, were con you/we/they) | was, were, tired, happy, good, bad, yesterday, last (+ at) |
| L07 | lesson_07_past_regular_verbs.dart | Past: Regular Verbs | Pasado regular (verbo + -ed, igual para todas las personas) | worked, lived, liked, wanted, needed |
| L08 | lesson_08_past_irregular_verbs.dart | Past: Irregular Verbs | Pasado irregular (go→went, get→got, see→saw, say→said, come→came) | went, got, saw, said, came (+ to, her) |
| L09 | lesson_09_past_negative.dart | Past Negative | Pasado negativo (didn't + verbo base) | didn't |
| L10 | lesson_10_past_question.dart | Past Questions | Pasado interrogativo (Did + sujeto + verbo base) | did (auxiliar) |
| L11 | lesson_11_review_block2.dart | Review Block 2 | Repaso del pasado: was/were, regulares, irregulares, negativo y pregunta | ninguna (repaso; weren't aparece en EJ 12) |
| L12 | lesson_12_wh_questions.dart | Wh- Questions | Where/What/When + did + sujeto + verbo base; Who sujeto sin did | where, what, when, who |
| L13 | lesson_13_review_block3.dart | Review Block 3 | Repaso: Where/What/When/Who en presente (do) y pasado (did) | ninguna (repaso) |
| L14 | lesson_14_review_general_a1.dart | General Review A1 | Repaso general: presente, pasado y preguntas WH | ninguna (repaso; there aparece en EJ 03) |

Las reglas de arriba (12 ejercicios, solo pronunciacion y ordenar) son de
STREET ENGLISH · GRAMMAR. VOCAB tiene las suyas:

### STREET ENGLISH · VOCAB — REGLAS PROPIAS

- Archivo único: `lib/data/street_english_vocab_lessons.dart`
  (`streetEnglishVocabLessons`), 15 bloques = 15 lecciones de 10 palabras.
- Cada bloque tiene 4 ejercicios:
  1. `parejas` palabras 1-5 · 2. `parejas` palabras 6-10
  3. `pronunciacion` palabras 1-5 · 4. `pronunciacion` palabras 6-10
  La pronunciación va en grupos de 5 (`frase` = "work, food, tired, go, happy",
  `fonetica` = "[ UORK · FUUD · … ]"): la grabación se corta tras 1 s de
  silencio (`SILENCE_MS` en `tts_web.dart`), con 10 palabras se cortaría.
- Bloques 3, 6, 9, 12 = repaso de los dos anteriores; 15 = repaso general.
- Progreso en su propia sección: id `street_english_vocab`
  (`users/{uid}/progress/street_english_vocab`), registrada en
  `ProgressNotifier._sections`.
- Palabras SOLO de la lista maestra `streetEnglishVocab` (añadirlas primero).
- ⚠️ Limitación de `ParejasWidget`: guarda las palabras emparejadas en un
  solo Set (inglés + español juntos). En un mismo ejercicio de parejas NO puede
  haber palabras repetidas (do/hacer + make/hacer → make = "hacer / crear"),
  ni una palabra inglesa idéntica a su traducción (idea → "una idea").

---

## FONÉTICA EN ESPAÑOL — REFERENCIA

| Palabra | Fonética |
|---------|----------|
| Good morning | [ gud MOR-ning ] |
| Appointment | [ a-POINT-ment ] |
| Welcome | [ WEL-kom ] |
| Come in | [ kom IN ] |
| Of course | [ of KORS ] |
| Sit down | [ SIT daun ] |
| My name is | [ mai NEIM is ] |
| What's your name | [ wots ior NEIM ] |
| Nice to meet you | [ nais tu miit IU ] |
| Take a seat | [ teik a SIIT ] |
| Haircut | [ JEAR-kat ] |
| Fade | [ FEID ] |
| Sides | [ SAIDS ] |
| Top | [ TOP ] |
| Longer | [ LON-ger ] |
| Do you have | [ du iu JAV ] |
| Wait | [ WEIT ] |
| Minutes | [ MI-nets ] |
| No problem | [ nou PROB-lem ] |
| Please wait | [ pliis WEIT ] |
| Son | [ SON ] |
| Move | [ MUUV ] |
| Patient | [ PEI-shent ] |
| Photo | [ FOU-tou ] |
| Modern | [ MOD-ern ] |
| Scissors | [ SI-sors ] |
| Beard | [ BIRD ] |
| Wash | [ WOSH ] |
| Ready | [ RE-di ] |
| Thank you | [ ZANK IU ] |

---

## INSTRUCCIONES PARA GENERAR LECCIONES

Cuando te pida crear una lección nueva:
1. Lee este archivo primero
2. Revisa qué palabras ya fueron enseñadas
3. Usa SOLO esas palabras como distractores
4. Sigue la estructura de 20 ejercicios
5. Verifica antes de entregar que ningún
   ejercicio usa palabras no enseñadas
6. Confirma el total de ejercicios
   y palabras nuevas introducidas

Cuando termines una lección ejecuta:
flutter build web 2>&1 | grep -E "error:|Error:" | head -20
