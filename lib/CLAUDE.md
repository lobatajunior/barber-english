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

## TIPOS DE EJERCICIOS DISPONIBLES
escuchar, opciones, pronunciar, parejas, completar, ordenar

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
2. pronunciar la palabra sola
3. SOLO entonces usar en otros ejercicios

### REGLA 2 — Palabras nuevas por lección
A1: 2 palabras nuevas
A2: 2 palabras nuevas
B1: 2 palabras nuevas
B2: 2 palabras nuevas
Cada palabra nueva lleva badge: es_palabra_nueva: true

### REGLA 3 — Distractores
Los distractores en completar/opciones/ordenar
SOLO pueden ser palabras ya enseñadas en
lecciones anteriores o en la lección actual.
NUNCA palabras nuevas como distractores.

### REGLA 4 — Repetición espaciada
Cada lección incluye repaso de lecciones anteriores
en los ejercicios 1-3 (Bloque 1).

### REGLA 5 — Estructura obligatoria 20 ejercicios

Bloque 1 (01-03) Repaso:
  01 opciones  — repaso palabras anteriores
  02 parejas   — repaso palabras anteriores
  03 escuchar  — repaso palabras anteriores

Bloque 2 (04-13) Palabras nuevas:
  04 escuchar  — palabra1 🆕
  05 pronunciar — palabra1
  06 parejas   — palabra1
  07 escuchar  — palabra2 🆕
  08 pronunciar — palabra2
  09 parejas   — palabras1 y 2
  10 escuchar  — palabra3 🆕
  11 pronunciar — palabra3
  12 opciones  — las 3 palabras
  13 parejas   — las 3 palabras

Bloque 3 (14-19) Consolidación:
  14 completar  — frase simple
  15 ordenar    — frase simple
  16 opciones   — contexto
  17 completar  — frase rica
  18 ordenar    — frase compleja
  19 pronunciar — frase completa

Bloque 4 (20) Diálogo final:
  20 dialogo — Santiago y Barbara, máx 4 intercambios,
               solo palabras enseñadas hasta esa lección

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
| L06 | lesson_06_numbers.dart | Numbers & Lengths | Conv.1+2 | Number one, Number two, Short, Long, Same |
| L07 | lesson_07_waiting_time.dart | Waiting Time | Conv.2 | Water, Coffee, Drink, Sit, While |
| L08 | lesson_08_scissors.dart | Scissors Cut | Conv.2 | Scissors, Classic, Style, Comb, Neat |
| L09 | lesson_09_hair_wash.dart | Hair Wash | Conv.2 | Wash, Hair, Ready, Fresh, Street |
| L10 | lesson_10_be_patient.dart | Be Patient | Conv.3 | Still, Look down, Turn, Head, Careful |
| L11 | lesson_11_the_photo.dart | The Photo | Conv.3 | Like, Similar, Possible, Little, Different |
| L12 | lesson_12_beard_basics.dart | Beard Basics | Conv.1 | Beard, Sideburns, Shape, Clean, Line |
| L13 | lesson_13_style_talk.dart | Style Talk | Conv.1 | Volume, Texture, Product, Natural, Messy |
| L14 | lesson_14_the_finish.dart | The Finish | Conv.1+2+3 | Ready, Done, Look, Happy, Next time |
| L15 | lesson_15_goodbye.dart | See You Next Time | Conv.1+2+3 | Goodbye, See you, Next, Appointment, Thank you |
| L16 | lesson_16_full_review.dart | Full Review A1 | Conv.1+2+3 | Repaso completo de las 320 palabras A1 |

Total A1: 16 lecciones × 20 ejercicios = 320 ejercicios

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
