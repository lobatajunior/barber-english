# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Barber English: a Flutter app that teaches English to Spanish-speaking barbers. Web (barber-english.web.app) is the primary target; Android/iOS also build.

## Stack

- **Flutter** (Dart) + **Riverpod** (`StateNotifierProvider`) for state.
- **Firebase**: Auth, Firestore (offline persistence enabled in `main.dart`), Hosting (`build/web`).
- **ResponsiveVoice** (loaded in `web/index.html`) for TTS on web, with Web Speech API as fallback.
- **OpenAI Whisper** for speech-to-text in `pronunciacion` exercises.

## Commands

```bash
# Run (web is the primary target)
flutter run -d chrome

# Build web
flutter build web

# Check for build errors after creating/editing a lesson
flutter build web 2>&1 | grep -E "error:|Error:" | head -20

# Lint (known pre-existing noise: 2 allowInterop "errors" in tts_web.dart are
# web-only false positives; flutter build web compiles fine)
flutter analyze

# Tests
flutter test

# Deploy
flutter build web && firebase deploy --only hosting
```

The Whisper API key required for the STT feature in `pronunciacion` exercises lives in the `kWhisperApiKey` const in `lib/services/api_keys.dart` (git-ignored, so it never reaches git history; copy `api_keys.dart.example` to create it). No `--dart-define` flag is needed to build or run. Note this key still ends up in plaintext in the public `build/web/main.dart.js` bundle once deployed — hardcoding only keeps it out of git, not out of the shipped site.

## Architecture

```
lib/
  core/           → AppColors, AppTheme (dark theme, #080808 bg)
  models/         → Lesson, Section, Level enum (A1 free / A2-B2 paid)
  providers/      → Riverpod StateNotifierProviders for auth, progress, gamification
  services/       → GamificationService, ProgressService (Firestore + SharedPreferences fallback)
                    speech_service.dart (TTS/STT), api_keys.dart (git-ignored)
                    tts_web.dart / tts_stub.dart (conditional import pattern)
  screens/        → HomeScreen → SectionScreen → ExerciseScreen
  widgets/        → one widget per exercise type (see exercise types below)
  data/
    conversaciones_raw.md    → Junior's real barbershop conversations: the ONLY vocabulary source
    barber_zone_data.dart    → exports barberZoneLessons list
    street_english_data.dart → exports streetEnglishLessons list
    lessons/
      barber_zone/a1/        → lesson_01_first_contact.dart … lesson_16_full_review.dart
      street_english/a1/     → (empty for now)
```

### Data flow

`HomeScreen` shows sections → `SectionScreen` lists lessons from the section's data file → tapping pushes `ExerciseScreen(lesson, sectionId)`. After exercise 20, FINALIZAR shows the XP summary (`_CompletionView`), whose button pops back to the lesson list. Progress is stored in Firestore (`users/{uid}/progress/{section}`) with `SharedPreferences` as offline fallback. Firestore writes are fire-and-forget: never `await` a Firestore `.set()` in a UI path — its future only completes on server ack and hangs offline.

### Exercise data structure

Each lesson is a `const Lesson` with an `exercises` list of `Map<String, dynamic>`. The `'tipo'` key routes to the correct widget in `ExerciseScreen._buildExercise()`. The 8 exercise types used by lessons:

| tipo | Widget | Key fields |
|------|--------|------------|
| `escuchar` | `EscucharWidget` | `frase`, `fonetica` |
| `pronunciacion` | `PronunciacionWidget` | `frase`, `respuesta_correcta`, `fonetica` |
| `parejas` | `ParejasWidget` | `parejas_ingles`, `parejas_espanol` |
| `completar` | `CompletarWidget` | `frase` with `___`, `respuesta_correcta`, `opciones` |
| `ordenar` | `OrdenarWidget` | `palabras`, `respuesta_correcta` (words joined by spaces) |
| `opciones` | `OpcionesWidget` | `respuesta_correcta`, `opciones` |
| `dialogo` | `DialogoWidget` | `cliente_dice`, `traduccion_cliente`, `respuesta_correcta`, `traduccion_respuesta`, `opciones_barbero` |
| `dialogo_completo` | `DialogoCompletoWidget` | `intercambios` |

(`traducir` / `TraducirWidget` also exists in the router but no lesson uses it.)

Common keys across all exercise types: `tipo`, `instruccion`, `quien_habla`, `frase`, `traduccion_pregunta`, `contexto_es`. The `es_palabra_nueva: true` flag marks the `escuchar` that first introduces a word.

### TTS (Text-to-Speech)

`tts_web.dart` and `tts_stub.dart` are conditionally imported — web uses ResponsiveVoice (voice 'US English Female', rate 0.85) with Web Speech API as fallback. Speech ends fire a custom `rvSpeechEnd` DOM event listened to by Dart. STT uses OpenAI Whisper via `tts_web.dart:startWebRecording()` — auto-stops after 1 s of silence. `SpeechService.calculateScore()` returns 0-100; ≥ 70 counts as resolved.

### Gamification

XP thresholds: 0→500 (Apprentice), 500→1500 (Junior), 1500→3500 (Barber), 3500→7000 (Senior), 7000+ (Master Barber).
**Only `pronunciacion` gives per-exercise XP and the floating "+XP" animation**; the other 7 types just unlock CONTINUAR.
Per lesson: +30 XP per pronunciation ≥ 70 % (`_kXpPronunciacion` in `exercise_screen.dart`), +50 per perfect (100 %) pronunciation, +100 lesson completion, +20 daily streak bonus. Skipping a pronunciation gives no XP. A normal lesson (7 pronunciations) ≈ 310 XP.
The home mascot evolves by number of completed lessons, not XP. The streak is based on the date a lesson is completed.

## Pedagogical rules (mandatory for every lesson)

1. **Vocabulary source:** new words come from `lib/data/conversaciones_raw.md`. The A1 lesson map with the words already taught is in `lib/CLAUDE.md`.
2. **Max 5 new words/expressions per lesson.**
3. **Listen → pronounce sequence:** each new word first appears in an `escuchar` (word alone, `es_palabra_nueva: true`), immediately followed by a `pronunciacion` of a **full sentence** that contains it. Only after that can the word appear in any other exercise type. Never a `pronunciacion` of an isolated word.
4. **Distractors only from taught vocabulary:** options in `completar`/`opciones`/`ordenar`/`dialogo` may only use words taught in previous lessons or already introduced earlier in the current lesson. Never an unintroduced word as a distractor.
5. **Spaced repetition when opening a lesson:** exercises 01-03 review vocabulary from previous lessons.
6. **Sentences** may use the new word, taught vocabulary, basic grammar words already used by lessons (the, a, on, to, your, my, please, and, for, not, this…) and the proper name "Junior". No digits (TTS/STT mismatch).
7. Never 2 `escuchar` in a row; never more than 2 consecutive exercises of the same type.

### Mandatory 20-exercise structure (L02-L15 pattern)

| # | tipo | Content |
|---|------|---------|
| 01 | parejas | Review: 3 words from previous lessons |
| 02 | completar | Review sentence |
| 03 | pronunciacion | Review sentence |
| 04 | escuchar 🆕 | New word 1 alone |
| 05 | pronunciacion | Full sentence with word 1 |
| 06 | escuchar 🆕 | New word 2 alone |
| 07 | pronunciacion | Full sentence with word 2 |
| 08 | escuchar 🆕 | New word 3 alone |
| 09 | pronunciacion | Full sentence with word 3 |
| 10 | completar | Words 1-3 |
| 11 | escuchar 🆕 | New word 4 alone |
| 12 | pronunciacion | Full sentence with word 4 |
| 13 | escuchar 🆕 | New word 5 alone |
| 14 | pronunciacion | Full sentence with word 5 |
| 15 | parejas | The 5 new words |
| 16 | completar | Sentence with new words |
| 17 | ordenar | Simple sentence |
| 18 | ordenar | Sentence mixing review + new words |
| 19 | pronunciacion | Long sentence combining the new words |
| 20 | dialogo | Final dialogue using only taught words |

L01 (no previous vocabulary) and L16 (full review, no new words) are the exceptions.

## Creating new lessons

Use the `/nueva-leccion` skill (`.claude/skills/nueva-leccion/SKILL.md`), which applies all the rules above. Manual steps:

1. Read `lib/CLAUDE.md` (lesson map) and `lib/data/conversaciones_raw.md`.
2. Write the 20 exercises following the structure and rules above.
3. Export the lesson constant and add it to the section data file (`barber_zone_data.dart` or `street_english_data.dart`).
4. Update the lesson map in `lib/CLAUDE.md`.
5. Run `flutter build web 2>&1 | grep -E "error:|Error:" | head -20` to verify.
