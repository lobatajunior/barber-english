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

## REGLAS PEDAGÓGICAS — OBLIGATORIAS SIEMPRE

### REGLA 1 — Orden de enseñanza
NUNCA usar una palabra en un ejercicio antes de haberla enseñado.
Orden obligatorio por palabra nueva:
1. escuchar la palabra sola
2. pronunciar una ORACIÓN COMPLETA que la contenga
   (nunca pronunciar la palabra suelta)
3. SOLO entonces usar en otros ejercicios

### REGLA 2 — Palabras nuevas por lección
Máximo 5 palabras/expresiones nuevas por lección (todos los niveles).
Cada palabra nueva lleva badge: es_palabra_nueva: true
(en su ejercicio escuchar)

### REGLA 3 — Distractores
Los distractores en completar/opciones/ordenar
SOLO pueden ser palabras ya enseñadas en
lecciones anteriores o en la lección actual.
NUNCA palabras nuevas como distractores.

### REGLA 4 — Repetición espaciada
Cada lección incluye repaso de lecciones anteriores
en los ejercicios 1-3 (Bloque 1).

### REGLA 5 — Estructura obligatoria 20 ejercicios
(la que siguen L02–L15; L01 y L16 son excepciones)

Bloque 1 (01-03) Repaso al abrir la lección:
  01 parejas       — 3 palabras de lecciones anteriores
  02 completar     — frase de repaso
  03 pronunciacion — frase de repaso

Bloque 2 (04-14) Palabras nuevas:
  04 escuchar 🆕    — palabra1 sola
  05 pronunciacion — ORACIÓN con palabra1
  06 escuchar 🆕    — palabra2 sola
  07 pronunciacion — ORACIÓN con palabra2
  08 escuchar 🆕    — palabra3 sola
  09 pronunciacion — ORACIÓN con palabra3
  10 completar     — palabras 1-3
  11 escuchar 🆕    — palabra4 sola
  12 pronunciacion — ORACIÓN con palabra4
  13 escuchar 🆕    — palabra5 sola
  14 pronunciacion — ORACIÓN con palabra5

Bloque 3 (15-19) Consolidación:
  15 parejas       — las 5 palabras nuevas
  16 completar     — frase con palabras nuevas
  17 ordenar       — frase simple
  18 ordenar       — frase que mezcla repaso + nuevas
  19 pronunciacion — frase larga

Bloque 4 (20) Diálogo final:
  20 dialogo — solo palabras enseñadas hasta esa lección

### REGLA 6 — Oraciones de pronunciación
Pueden usar: la palabra nueva, vocabulario ya enseñado, palabras
gramaticales básicas que ya usan las lecciones (the, a, on, to, your,
my, please, and, for, not, this…) y el nombre propio "Junior".
Sin cifras (la voz y el reconocimiento fallan con "30").

REGLA ADICIONAL: nunca 2 escuchares seguidos,
nunca más de 2 del mismo tipo consecutivos.

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

## MAPA DE LECCIONES A1 — BARBER ZONE

| # | Archivo | Título | Fuente | Palabras clave |
|---|---------|--------|--------|----------------|
| L01 | lesson_01_first_contact.dart | First Contact | Conv.1 | Good morning, Appointment, Welcome, Come in, Of course |
| L02 | lesson_02_take_a_seat.dart | Take a Seat | Conv.1 | Sit down, My name is, What's your name, Nice to meet you, Take a seat |
| L03 | lesson_03_the_cut.dart | The Cut | Conv.1 | Haircut, Fade, Sides, Top, Longer |
| L04 | lesson_04_no_appointment.dart | No Appointment | Conv.2 | Do you have, Wait, Minutes, No problem, Please wait |
| L05 | lesson_05_the_kid.dart | The Kid | Conv.3 | Son, Move, Patient, Photo, Modern |
| L06 | lesson_06_numbers_lengths.dart | Numbers & Lengths | Conv.1+2 | Number one, Short, Long, Same, Little |
| L07 | lesson_07_waiting_time.dart | Waiting Time | Conv.2 | Water, Coffee, Drink, While, Something |
| L08 | lesson_08_scissors_cut.dart | Scissors Cut | Conv.2 | Scissors, Classic, Style, Comb, Neat |
| L09 | lesson_09_hair_wash.dart | Hair Wash | Conv.2 | Wash, Hair, Fresh, Ready, Street |
| L10 | lesson_10_be_patient.dart | Be Patient | Conv.3 | Still, Look down, Turn, Head, Careful |
| L11 | lesson_11_the_photo.dart | The Photo | Conv.3 | Like, Similar, Possible, Different, Close |
| L12 | lesson_12_beard_basics.dart | Beard Basics | Conv.1 | Beard, Sideburns, Shape, Clean, Line |
| L13 | lesson_13_style_talk.dart | Style Talk | Conv.1 | Volume, Texture, Product, Natural, Messy |
| L14 | lesson_14_the_finish.dart | The Finish | Conv.1+2+3 | Done, Look, Great, New, Happy |
| L15 | lesson_15_see_you_next_time.dart | See You Next Time | Conv.1+2+3 | Goodbye, See you, Next time, Thank you, Pleasure |
| L16 | lesson_16_full_review.dart | Full Review A1 | Conv.1+2+3 | Repaso de las 75 palabras de L01–L15 (sin palabras nuevas) |

Total A1: 16 lecciones × 20 ejercicios = 320 ejercicios
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
