# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run (web is the primary target)
flutter run -d chrome --dart-define=WHISPER_KEY=<key>

# Build web
flutter build web --dart-define=WHISPER_KEY=<key>

# Check for build errors after creating/editing a lesson
flutter build web 2>&1 | grep -E "error:|Error:" | head -20

# Lint
flutter analyze

# Tests
flutter test
```

The `WHISPER_KEY` is required for the Whisper STT feature in `pronunciacion` exercises. It is injected via `--dart-define` and read via `String.fromEnvironment('WHISPER_KEY', ...)` in `lib/services/speech_service.dart`. Without it, Whisper calls fail silently (empty transcription).

## Architecture

```
lib/
  core/           → AppColors, AppTheme (dark theme, #080808 bg)
  models/         → Lesson, Section, Level enum (A1 free / A2-B2 paid)
  providers/      → Riverpod StateNotifierProviders for auth, progress, gamification
  services/       → GamificationService (Firestore + SharedPreferences fallback)
                    speech_service.dart (git-ignored, contains API key constant)
                    tts_web.dart / tts_stub.dart (conditional import pattern)
  screens/        → HomeScreen → SectionScreen → ExerciseScreen
  widgets/        → one widget per exercise type (see exercise types below)
  data/
    barber_zone_data.dart    → exports barberZoneLessons list
    street_english_data.dart → exports streetEnglishLessons list
    lessons/
      barber_zone/a1/        → lesson_01_first_contact.dart … lesson_16_full_review.dart
      street_english/a1/     → lesson_01_la_apuesta.dart …
```

### Data flow

`HomeScreen` shows sections → `SectionScreen` lists lessons from the section's data file → tapping opens `ExerciseScreen(lesson, sectionId)`. Progress is stored in Firestore (`users/{uid}`) with `SharedPreferences` as offline fallback. Gamification (XP, racha, nivel 1-5) uses the same dual-persistence pattern.

### Exercise data structure

Each lesson is a `const Lesson` with an `exercises` list of `Map<String, dynamic>`. The `'tipo'` key routes to the correct widget in `ExerciseScreen._buildExercise()`:

| tipo | Widget |
|------|--------|
| `escuchar` | `EscucharWidget` |
| `pronunciacion` | `PronunciacionWidget` |
| `parejas` | `ParejasWidget` |
| `completar` | `CompletarWidget` |
| `ordenar` | `OrdenarWidget` |
| `opciones` | `OpcionesWidget` |
| `dialogo` | `DialogoWidget` |
| `dialogo_completo` | `DialogoCompletoWidget` |

Common keys across all exercise types: `tipo`, `instruccion`, `quien_habla`, `traduccion_pregunta`. The `es_palabra_nueva: true` flag marks first-introduction exercises.

### TTS (Text-to-Speech)

`tts_web.dart` and `tts_stub.dart` are conditionally imported — web uses ResponsiveVoice (loaded in `web/index.html`) with Web Speech API as fallback. Speech ends fire a custom `rvSpeechEnd` DOM event listened to by Dart. STT uses OpenAI Whisper via `tts_web.dart:startWebRecording()` — auto-stops after 1 s of silence.

### Gamification

XP thresholds: 0→500 (Apprentice), 500→1500 (Junior), 1500→3500 (Barber), 3500→7000 (Senior), 7000+ (Master Barber). Per lesson: +10 XP per exercise resolved, +50 per perfect pronunciation, +100 lesson completion, +20 daily streak bonus.

## Creating new lessons

Full pedagogical rules and the A1 lesson map are in `lib/CLAUDE.md`. The mandatory structure is:

1. Read `lib/CLAUDE.md` to know which words are already taught.
2. 20 exercises in 4 blocks (Repaso → Palabras nuevas → Consolidación → Diálogo final).
3. Never use an unintroduced word as a distractor. Each new word must appear in `escuchar` → `pronunciacion` before any other exercise type.
4. Export the lesson constant and add it to the section data file (`barber_zone_data.dart` or `street_english_data.dart`).
5. Run `flutter build web 2>&1 | grep -E "error:|Error:" | head -20` to verify.
