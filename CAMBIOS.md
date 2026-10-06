# CAMBIOS — sesión autónoma (2026-09-29)

Registro de lo encontrado y cambiado en los 4 bloques pedidos. Cada bloque
dice qué estaba mal, qué se cambió, qué archivos se tocaron, cómo probarlo y
el resultado de `flutter analyze`.

---

## Bloque 1 — Botón "FINALIZAR" de la lección no hace nada

### Qué encontré

Flujo al pulsar FINALIZAR en el ejercicio 20:
`_advance()` → `_complete()` (`lib/screens/exercise_screen.dart`). `_complete()`
es asíncrono y **no muestra nada hasta terminar de guardar**:

```dart
final rachaBonus = await ref.read(gamificationProvider.notifier).checkRacha();
await ref.read(progressProvider.notifier).completeLesson(...);
setState(() => _showCompletion = true);   // solo llega aquí si todo lo anterior acaba
```

Causas reales, de más a menos importante:

1. **Espera a la confirmación del servidor de Firestore.** `checkRacha()` y
   `completeLesson()` terminan en `GamificationService.save()` /
   `ProgressService.saveProgress()`, que hacían `await` del `.set()` de
   Firestore. Ese `Future` solo se completa cuando el servidor confirma; sin red
   o con red lenta no se completa nunca → la pantalla se queda en FINALIZAR sin
   reaccionar. *Ya corregido y desplegado en la sesión anterior* (se quitó
   `await remote;` y se añadió la protección `_completing`).
2. **Sin tope ni manejo de errores.** Si cualquier paso de guardado lanzaba una
   excepción o tardaba, el error se perdía en silencio (Future sin capturar) y
   la pantalla final no aparecía. Con la protección `_completing` de la sesión
   anterior, además, un segundo toque ya no reintentaba → quedaba bloqueado.
3. **Caché del navegador tras desplegar.** `firebase.json` no define cabeceras,
   así que Firebase Hosting sirve `main.dart.js` y `flutter_bootstrap.js` con
   `Cache-Control: max-age=3600`. Durante hasta 1 hora tras un deploy el
   navegador puede seguir ejecutando la versión vieja (la que todavía se colgaba),
   lo que explica que el bug "siga" después del arreglo de ayer.
4. **Texto confuso en la pantalla final.** El botón de la pantalla de resumen
   decía "Siguiente lección →" pero en realidad vuelve al menú (`Navigator.pop`).

### Qué cambié

- `_complete()` ya no puede quedarse colgado: el guardado va en `try/catch` con
  un tope de 5 s por paso; pase lo que pase se muestra la pantalla de resumen.
  El progreso queda marcado en memoria antes del guardado, así que el menú lo
  refleja aunque Firestore tarde.
- El botón de la pantalla de resumen ahora dice **"Volver a las lecciones"** y
  hace `Navigator.pop` → regresa a `SectionScreen` (menú de lecciones). No
  avanza automáticamente a la siguiente lección.
- `firebase.json`: cabeceras `Cache-Control: no-cache` para `index.html`,
  `flutter_bootstrap.js`, `main.dart.js`, `flutter_service_worker.js` y
  `version.json`, para que cada deploy se vea al recargar.

### Archivos tocados

- `lib/screens/exercise_screen.dart` (`_complete`, texto del botón de `_CompletionView`)
- `firebase.json` (bloque `headers`)
- (sesión anterior) `lib/services/gamification_service.dart`, `lib/services/progress_service.dart`

### Cómo probarlo

1. `flutter run -d chrome`, abre una lección y llega al ejercicio 20.
2. Resuélvelo → pulsa FINALIZAR → debe aparecer al instante la pantalla de
   resumen de XP.
3. Pulsa "Volver a las lecciones" → vuelves al menú de lecciones con la lección
   marcada como completada.
4. Repite con DevTools → Network → *Offline*: debe comportarse igual.
5. Pulsa FINALIZAR varias veces seguidas: el resumen debe mostrar +100 de
   lección una sola vez.

### flutter analyze

**Sin problemas nuevos.** Salen 9 avisos, todos anteriores a esta sesión y en
archivos que este bloque no toca:

- 2 `error` en `lib/services/tts_web.dart:75-76` (`allowInterop` no definido).
  Es un falso positivo del analizador: ese archivo solo se compila para web vía
  import condicional, y `flutter build web` compila bien.
- 1 `warning` `unused_local_variable` en `lib/screens/section_screen.dart:53`.
- 6 `info` de estilo/deprecación (`dart:html`, `dart:js`, llaves en `for`, `__`).

---

## Bloque 2 — Refuerzo de XP solo para pronunciación

### Dónde vive la lógica de XP/puntuación (antes del cambio)

| Qué | Dónde |
|-----|-------|
| +10 XP al resolver **cualquier** ejercicio, animación flotante "+10 XP", mascota "¡Excelente!" | `ExerciseScreen._onResolved()` en `lib/screens/exercise_screen.dart` |
| Animación "+10 XP" (texto fijo) | `_FloatingXp` en `lib/screens/exercise_screen.dart` |
| +50 XP por pronunciación perfecta (100 %) | `_onPerfecto()` ← `PronunciacionWidget.onPerfecto` |
| Porcentaje de pronunciación (score 0-100, éxito ≥ 70) | `lib/widgets/pronunciacion_widget.dart` (ya exclusivo de pronunciación) |
| +100 XP por lección completa, +20 por racha | `_complete()` + `GamificationNotifier.checkRacha()` (`lib/providers/gamification_provider.dart`) |
| Suma de XP y nivel (umbrales 500/1500/3500/7000) | `GamificationNotifier.addXP()` + `GamificationService.getNivel()` |
| Desglose de XP en la pantalla final | `_CompletionView` ("Ejercicios completados") |
| Mascota que evoluciona en la home | `HomeScreen._mascotPose(total)` — depende del **nº de lecciones completadas**, no del XP |

Hallazgo extra: en pronunciación, "Continuar de todas formas" (score < 70)
llamaba a `onResuelto()` → daba el mismo XP que pronunciar bien.

### Cómo lo voy a modificar

1. `_onResolved()` comprueba el tipo del ejercicio actual:
   - `pronunciacion` → suma XP, muestra la animación "+N XP" y la mascota celebra.
   - los otros 7 tipos → solo marcan el ejercicio como resuelto (habilita
     CONTINUAR) y la mascota celebra; **sin XP ni animación de XP**.
2. `PronunciacionWidget._continuar()` deja de llamar a `onResuelto()` cuando el
   usuario salta sin llegar al 70 %: saltar ya no da XP (igual que SALTAR en los
   otros tipos).
3. `_FloatingXp` recibe la cantidad en vez de tener "+10 XP" fijo.
4. Pantalla final: la fila "Ejercicios completados" pasa a "Pronunciaciones
   correctas".

### Coherencia con nivel, racha y mascota

- **Nivel (depende del XP):** antes una lección daba 20 × 10 + 100 = **300 XP**.
  Si solo pronunciación diera +10, tras el bloque 3 (7 pronunciaciones por
  lección) quedaría en 7 × 10 + 100 = 170 XP y se tardaría casi el doble en
  subir de nivel. Para mantener el ritmo **sin tocar los umbrales** (tocarlos
  bajaría de nivel a usuarios existentes), cada pronunciación correcta da
  **+30 XP** (`_kXpPronunciacion`): 7 × 30 + 100 = **310 XP** por lección.
  Todo A1: antes 4 800 XP, ahora 15 × 310 + 190 (L16 tiene 3 pronunciaciones) = 4 840 XP.
- **Racha:** no cambia. Se calcula al completar la lección (fecha), no por
  ejercicio; el bonus +20 sigue igual.
- **Mascota de la home:** no cambia. Evoluciona por lecciones completadas.
- **+50 por pronunciación perfecta:** se mantiene.

### Qué cambié

- `_onResolved()`: si el ejercicio es `pronunciacion` suma `_kXpPronunciacion`
  (30) y muestra la animación; en los otros 7 tipos solo marca resuelto (la
  mascota sigue diciendo "¡Excelente!", que no es XP).
- Nueva constante `_kXpPronunciacion = 30`; `_FloatingXp` muestra `+30 XP`.
- `_CompletionView`: la fila "Ejercicios completados" pasa a
  "Pronunciaciones correctas".
- `PronunciacionWidget._continuar()` ya no marca como resuelto al saltar con
  < 70 %; solo avanza.

### Archivos tocados

- `lib/screens/exercise_screen.dart`
- `lib/widgets/pronunciacion_widget.dart`

### Cómo probarlo

1. Resuelve un `opciones`/`completar`/`parejas`: la mascota celebra, CONTINUAR
   se activa, **no** aparece "+XP" y la barra de XP de la home no cambia.
2. Pronuncia bien (≥ 70 %): aparece "+30 XP" flotando.
3. Pronuncia mal y pulsa "Continuar de todas formas": avanza sin XP.
4. Al terminar, el resumen muestra "Pronunciaciones correctas +N", "Lección
   completa +100" y, si aplica, la racha.

### flutter analyze

**Sin problemas nuevos.** Salen los mismos 9 avisos que en el bloque 1, todos
anteriores a esta sesión.

---

## Bloque 3 — Fuera "escuchar y pronunciar palabras sueltas", entran oraciones completas

### Qué encontré

En L01–L15 cada palabra nueva seguía el par `escuchar` (palabra sola) →
`pronunciacion` (**la misma palabra sola**). `PronunciacionWidget` reproduce el
modelo y luego graba, así que ese ejercicio era literalmente "escuchar y
pronunciar una palabra suelta". Son **75 ejercicios** (5 por lección en
L01–L15). L16 ya usaba solo frases.

### Decisión de implementación

- Se reemplaza cada `pronunciacion` de palabra suelta por una `pronunciacion`
  de **oración completa** que contiene la palabra nueva. Mismo tipo y misma
  posición, así que cada lección sigue teniendo **20 ejercicios** y el orden
  de tipos no cambia.
- El `escuchar` de la palabra nueva **se mantiene**: es la presentación de la
  palabra y mantiene la regla escuchar → pronunciar (bloque 4).
- Cada oración usa solo: la palabra nueva, palabras de lecciones anteriores,
  palabras nuevas ya presentadas antes en la misma lección y palabras
  gramaticales que las lecciones ya usaban (the, a, on, to, your, my, please,
  and, for, not, this…). Nombre propio permitido: "Junior".
- No se usan cifras ("30 minutes") para que la voz y el reconocimiento no fallen.

### Qué cambié

En los 75 ejercicios (L01–L15, EJ 05/07/09/12/14; en L01 EJ 02/04/07/09/12)
se cambiaron `instruccion` ("Ahora dilo en una frase completa"), `frase`,
`respuesta_correcta`, `fonetica`, `traduccion_pregunta` y `contexto_es`. El
comentario de cabecera de cada uno pasa a `PRONUNCIACIÓN FRASE`. Ejemplos:

| Lección | Antes | Ahora |
|---------|-------|-------|
| L02 EJ05 | Sit down | Welcome! Come in and sit down |
| L03 EJ09 | Sides | A fade on the sides, please |
| L07 EJ12 | While | Water or coffee while you wait? |
| L12 EJ14 | Line | Clean line on the beard |
| L15 EJ14 | Pleasure | Thank you, a pleasure! Goodbye |

Verificación automática (script): las 75 oraciones contienen su palabra nueva y
solo usan vocabulario ya enseñado + palabras gramaticales. Única excepción
aceptada: "have" en L01 EJ04 ("Good morning, I have an appointment"), que
formalmente se enseña en L04, pero L01 ya usaba esa misma frase en su EJ 10.

### Nueva estructura de 20 ejercicios (L02–L15)

| # | tipo | contenido |
|---|------|-----------|
| 01 | parejas | repaso de 3 palabras anteriores |
| 02 | completar | repaso |
| 03 | pronunciacion | frase de repaso |
| 04 | escuchar 🆕 | palabra 1 sola |
| 05 | pronunciacion | **oración** con palabra 1 |
| 06 | escuchar 🆕 | palabra 2 sola |
| 07 | pronunciacion | **oración** con palabra 2 |
| 08 | escuchar 🆕 | palabra 3 sola |
| 09 | pronunciacion | **oración** con palabra 3 |
| 10 | completar | palabras 1-3 |
| 11 | escuchar 🆕 | palabra 4 sola |
| 12 | pronunciacion | **oración** con palabra 4 |
| 13 | escuchar 🆕 | palabra 5 sola |
| 14 | pronunciacion | **oración** con palabra 5 |
| 15 | parejas | las 5 nuevas |
| 16 | completar | frase con nuevas |
| 17 | ordenar | frase simple |
| 18 | ordenar | repaso + nuevas |
| 19 | pronunciacion | frase larga |
| 20 | dialogo | diálogo final |

L01 mantiene su orden propio (EJ 02/04/07/09/12 ahora son oraciones) y L16
(repaso total) no cambia. Las 16 lecciones siguen con 20 ejercicios.

### Archivos tocados

`lib/data/lessons/barber_zone/a1/lesson_01` … `lesson_15` (15 archivos).
`lesson_16_full_review.dart` no se tocó.

### Cómo probarlo

1. Abre cualquier lección L02–L15: tras cada `escuchar` 🆕 de una palabra, el
   siguiente ejercicio pide pronunciar una oración que la contiene.
2. Pronuncia la oración: con ≥ 70 % de palabras reconocidas se resuelve y da +30 XP.
3. El contador de arriba sigue en `x/20`.

### flutter analyze

**Sin problemas nuevos** (los mismos 9 avisos anteriores). Además,
`flutter build web` compila bien y `flutter test` pasa (1/1).

---

## Bloque 4 — CLAUDE.md y skill /nueva-leccion

### Qué encontré

- `CLAUDE.md` (raíz) describía XP "+10 por ejercicio" y no tenía las reglas
  pedagógicas; remitía a `lib/CLAUDE.md`.
- `lib/CLAUDE.md` **contradecía las lecciones reales**: decía 2 palabras nuevas
  por lección (las lecciones usan 5), una estructura de 20 ejercicios distinta
  a la que siguen L02–L15, "pronunciar la palabra sola", 6 tipos de ejercicio,
  y un mapa A1 con palabras y nombres de archivo que no coincidían (L06, L07,
  L09, L11, L14, L15).
- No existía ninguna skill en `.claude/skills/`.

### Qué cambié

- **`CLAUDE.md` (raíz)**, en inglés como estaba: stack (Flutter, Riverpod,
  Firebase Auth/Firestore/Hosting, ResponsiveVoice, Whisper), comandos de
  build/analyze/test/deploy, arquitectura, tabla de los 8 tipos con sus campos,
  gamificación nueva (XP solo pronunciación), reglas pedagógicas (máx 5
  palabras nuevas, escuchar → pronunciar oración, distractores solo de
  vocabulario enseñado, repaso espaciado en EJ 01–03 al abrir la lección) y la
  tabla de 20 ejercicios. Aviso de no hacer `await` a escrituras de Firestore
  en la UI (causa del bug del bloque 1).
- **`lib/CLAUDE.md`**: REGLA 1 (oración, no palabra suelta), REGLA 2 (máx 5),
  REGLA 5 (estructura real), nueva REGLA 6 (qué puede llevar una oración),
  lista de los 8 tipos y mapa A1 corregido con las palabras reales.
- **Skill `/nueva-leccion`** en `.claude/skills/nueva-leccion/SKILL.md`: lee
  las reglas, el mapa, `conversaciones_raw.md` y las cabeceras de las lecciones
  existentes → elige hasta 5 palabras nuevas → escribe los 20 ejercicios con la
  plantilla → crea el archivo, lo registra en `*_data.dart`, actualiza el mapa
  → verifica (20 ejercicios, secuencia escuchar → pronunciar, distractores) y
  ejecuta `flutter build web`.

### Archivos tocados

- `CLAUDE.md`
- `lib/CLAUDE.md`
- `.claude/skills/nueva-leccion/SKILL.md` (nuevo)

### Cómo probarlo

- Abre una sesión nueva de Claude Code en el proyecto y escribe
  `/nueva-leccion barber_zone a2 17` (o `/nueva-leccion` sin argumentos).
  Debe aparecer en el autocompletado de `/`.

### flutter analyze

**Sin problemas nuevos:** este bloque solo toca documentación (mismos 9 avisos
anteriores).

---

## Resumen final

| Bloque | Estado | Resultado |
|--------|--------|-----------|
| 1. FINALIZAR no hace nada | ✅ | Ya no se cuelga esperando a Firestore: guardado con tope de 5 s + try/catch, protección contra doble toque, botón "Volver a las lecciones" que regresa al menú, y cabeceras no-cache en hosting |
| 2. XP solo en pronunciación | ✅ | +30 XP y animación solo en `pronunciacion`; los otros 7 tipos solo avanzan; saltar pronunciación no da XP; ritmo de niveles igual (~310 XP/lección) |
| 3. Fuera palabras sueltas | ✅ | 75 pronunciaciones de palabra suelta → oraciones completas; 20 ejercicios por lección; vocabulario verificado por script |
| 4. CLAUDE.md + skill | ✅ | Reglas unificadas en ambos CLAUDE.md; skill `/nueva-leccion` creada |

Verificación: `flutter analyze` sin problemas nuevos en los 4 bloques,
`flutter build web` compila bien y `flutter test` pasa. **No se ha desplegado
ni commiteado nada** en esta sesión.

## Pendiente / dudoso — para revisar

1. **Pantalla de resumen antes del menú (bloque 1).** Al pulsar FINALIZAR
   aparece primero el resumen de XP (subida de nivel, racha) y su botón
   "Volver a las lecciones" lleva al menú. Si quieres que FINALIZAR vaya
   directo al menú sin resumen, es un cambio de 1 línea, pero se perdería el
   resumen de XP.
2. **No probado en el navegador.** Ni FINALIZAR sin red ni las oraciones con
   el micrófono. Frases más largas pueden bajar el % de reconocimiento de
   Whisper; el umbral sigue en 70 %.
3. **+30 XP por pronunciación (bloque 2)** es decisión mía para no frenar el
   ritmo de niveles. Si prefieres +10, cambia `_kXpPronunciacion` en
   `lib/screens/exercise_screen.dart`, pero se tardará casi el doble en subir
   de nivel.
4. **Refuerzo que queda en los otros 7 tipos:** la mascota sigue celebrando
   ("¡Excelente!") al acertar, porque no es XP ni porcentaje. Si también
   debe quitarse, está en `_onResolved()`.
5. **Oraciones nuevas:** revisa que suenen naturales para tus clientes (las 75
   están en el diff de `lib/data/lessons`). Caso límite: "have" en L01 EJ04.
6. **Cambios del bloque 1 del despliegue anterior:** el deploy de ayer ya
   incluía el arreglo de Firestore; si el bug seguía, lo más probable era la
   caché de 1 h de `main.dart.js` (ahora con no-cache). Hay que volver a
   desplegar para que se apliquen las cabeceras: `flutter build web &&
   firebase deploy --only hosting`.
7. **`traducir`**: el widget existe y está en el router, pero ninguna lección
   lo usa y no cuenta entre los 8 tipos. ¿Eliminarlo?
8. **Street English A1** está vacío; `street_english/a1/` no tiene lecciones.
9. **Avisos previos de `flutter analyze`** (no tocados): `index` sin usar en
   `section_screen.dart:53`, APIs deprecadas `dart:html`/`dart:js` en
   `tts_web.dart`.
