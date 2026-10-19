import '../models/lesson.dart';

// STREET ENGLISH · VOCAB — 20 bloques de vocabulario
// Cada bloque es una lección con UN ejercicio de parejas (5 parejas).
//   Bloques 1-6   → verbos
//   Bloques 7-14  → sustantivos
//   Bloques 15-20 → adjetivos
// Palabras SOLO de la lista maestra lib/data/street_english_vocab.dart.
// ⚠️ Dentro de un bloque las 10 palabras (inglés + español) deben ser
//    distintas: ParejasWidget las guarda en un solo Set.

const streetEnglishVocabLessons = <Lesson>[

  // ── BLOQUE 01 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 1,
    title: 'Block 1 · Verbs',
    description: 'work · live · like · want · need',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 1 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['work', 'live', 'like', 'want', 'need'],
        'parejas_espanol': ['trabajar', 'vivir', 'gustar', 'querer', 'necesitar'],
        'contexto_es': 'Bloque 1 · Verbos: work · live · like · want · need',
      },
    ],
  ),

  // ── BLOQUE 02 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 2,
    title: 'Block 2 · Verbs',
    description: 'go · get · see · say · come',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 2 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['go', 'get', 'see', 'say', 'come'],
        'parejas_espanol': ['ir', 'conseguir', 'ver', 'decir', 'venir'],
        'contexto_es': 'Bloque 2 · Verbos: go · get · see · say · come',
      },
    ],
  ),

  // ── BLOQUE 03 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 3,
    title: 'Block 3 · Verbs',
    description: 'have · do · make · take · give',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 3 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['have', 'do', 'make', 'take', 'give'],
        'parejas_espanol': ['tener', 'hacer', 'hacer / crear', 'tomar', 'dar'],
        'contexto_es': 'Bloque 3 · Verbos: have · do · make · take · give',
      },
    ],
  ),

  // ── BLOQUE 04 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 4,
    title: 'Block 4 · Verbs',
    description: 'know · think · feel · try · help',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 4 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['know', 'think', 'feel', 'try', 'help'],
        'parejas_espanol': ['saber', 'pensar', 'sentir', 'intentar', 'ayudar'],
        'contexto_es': 'Bloque 4 · Verbos: know · think · feel · try · help',
      },
    ],
  ),

  // ── BLOQUE 05 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 5,
    title: 'Block 5 · Verbs',
    description: 'call · use · find · look · talk',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 5 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['call', 'use', 'find', 'look', 'talk'],
        'parejas_espanol': ['llamar', 'usar', 'encontrar', 'mirar', 'hablar'],
        'contexto_es': 'Bloque 5 · Verbos: call · use · find · look · talk',
      },
    ],
  ),

  // ── BLOQUE 06 · VERBOS ─────────────────────────────────────────────
  Lesson(
    id: 6,
    title: 'Block 6 · Verbs',
    description: 'understand · love · ask · tell · be',
    emoji: '🏃',
    level: Level.A1,
    descripcionEs:
        'Bloque 6 de vocabulario: 5 verbos (acciones que usas todos los días). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['understand', 'love', 'ask', 'tell', 'be'],
        'parejas_espanol': ['entender', 'amar', 'preguntar', 'decir / contar', 'ser / estar'],
        'contexto_es': 'Bloque 6 · Verbos: understand · love · ask · tell · be',
      },
    ],
  ),

  // ── BLOQUE 07 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 7,
    title: 'Block 7 · Nouns',
    description: 'food · water · money · time · home',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 7 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['food', 'water', 'money', 'time', 'home'],
        'parejas_espanol': ['comida', 'agua', 'dinero', 'tiempo', 'casa'],
        'contexto_es': 'Bloque 7 · Sustantivos: food · water · money · time · home',
      },
    ],
  ),

  // ── BLOQUE 08 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 8,
    title: 'Block 8 · Nouns',
    description: 'day · week · year · night · work',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 8 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['day', 'week', 'year', 'night', 'work'],
        'parejas_espanol': ['día', 'semana', 'año', 'noche', 'trabajo'],
        'contexto_es': 'Bloque 8 · Sustantivos: day · week · year · night · work',
      },
    ],
  ),

  // ── BLOQUE 09 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 9,
    title: 'Block 9 · Nouns',
    description: 'family · friend · people · place · thing',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 9 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['family', 'friend', 'people', 'place', 'thing'],
        'parejas_espanol': ['familia', 'amigo', 'gente', 'lugar', 'cosa'],
        'contexto_es': 'Bloque 9 · Sustantivos: family · friend · people · place · thing',
      },
    ],
  ),

  // ── BLOQUE 10 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 10,
    title: 'Block 10 · Nouns',
    description: 'problem · phone · car · house · name',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 10 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['problem', 'phone', 'car', 'house', 'name'],
        'parejas_espanol': ['problema', 'teléfono', 'carro', 'casa', 'nombre'],
        'contexto_es': 'Bloque 10 · Sustantivos: problem · phone · car · house · name',
      },
    ],
  ),

  // ── BLOQUE 11 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 11,
    title: 'Block 11 · Nouns',
    description: 'life · world · job · idea · way',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 11 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['life', 'world', 'job', 'idea', 'way'],
        'parejas_espanol': ['vida', 'mundo', 'trabajo', 'una idea', 'manera'],
        'contexto_es': 'Bloque 11 · Sustantivos: life · world · job · idea · way',
      },
    ],
  ),

  // ── BLOQUE 12 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 12,
    title: 'Block 12 · Nouns',
    description: 'number · language · morning · afternoon · evening',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 12 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['number', 'language', 'morning', 'afternoon', 'evening'],
        'parejas_espanol': ['número', 'idioma', 'mañana', 'tarde', 'noche'],
        'contexto_es': 'Bloque 12 · Sustantivos: number · language · morning · afternoon · evening',
      },
    ],
  ),

  // ── BLOQUE 13 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 13,
    title: 'Block 13 · Nouns',
    description: 'weekend · person · question · answer · music',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 13 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['weekend', 'person', 'question', 'answer', 'music'],
        'parejas_espanol': ['fin de semana', 'persona', 'pregunta', 'respuesta', 'música'],
        'contexto_es': 'Bloque 13 · Sustantivos: weekend · person · question · answer · music',
      },
    ],
  ),

  // ── BLOQUE 14 · SUSTANTIVOS ─────────────────────────────────────────────
  Lesson(
    id: 14,
    title: 'Block 14 · Nouns',
    description: 'party · trip · city · country · street',
    emoji: '📦',
    level: Level.A1,
    descripcionEs:
        'Bloque 14 de vocabulario: 5 sustantivos (cosas, personas y lugares). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['party', 'trip', 'city', 'country', 'street'],
        'parejas_espanol': ['fiesta', 'viaje', 'ciudad', 'país', 'calle'],
        'contexto_es': 'Bloque 14 · Sustantivos: party · trip · city · country · street',
      },
    ],
  ),

  // ── BLOQUE 15 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 15,
    title: 'Block 15 · Adjectives',
    description: 'tired · happy · good · bad · new',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 15 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['tired', 'happy', 'good', 'bad', 'new'],
        'parejas_espanol': ['cansado', 'feliz', 'bueno', 'malo', 'nuevo'],
        'contexto_es': 'Bloque 15 · Adjetivos: tired · happy · good · bad · new',
      },
    ],
  ),

  // ── BLOQUE 16 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 16,
    title: 'Block 16 · Adjectives',
    description: 'old · big · small · easy · difficult',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 16 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['old', 'big', 'small', 'easy', 'difficult'],
        'parejas_espanol': ['viejo', 'grande', 'pequeño', 'fácil', 'difícil'],
        'contexto_es': 'Bloque 16 · Adjetivos: old · big · small · easy · difficult',
      },
    ],
  ),

  // ── BLOQUE 17 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 17,
    title: 'Block 17 · Adjectives',
    description: 'busy · ready · free · sure · important',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 17 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['busy', 'ready', 'free', 'sure', 'important'],
        'parejas_espanol': ['ocupado', 'listo', 'libre', 'seguro', 'importante'],
        'contexto_es': 'Bloque 17 · Adjetivos: busy · ready · free · sure · important',
      },
    ],
  ),

  // ── BLOQUE 18 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 18,
    title: 'Block 18 · Adjectives',
    description: 'different · same · right · wrong · early',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 18 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['different', 'same', 'right', 'wrong', 'early'],
        'parejas_espanol': ['diferente', 'mismo', 'correcto', 'incorrecto', 'temprano'],
        'contexto_es': 'Bloque 18 · Adjetivos: different · same · right · wrong · early',
      },
    ],
  ),

  // ── BLOQUE 19 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 19,
    title: 'Block 19 · Adjectives',
    description: 'late · possible · interesting · beautiful · sad',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 19 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['late', 'possible', 'interesting', 'beautiful', 'sad'],
        'parejas_espanol': ['tarde', 'posible', 'interesante', 'hermoso', 'triste'],
        'contexto_es': 'Bloque 19 · Adjetivos: late · possible · interesting · beautiful · sad',
      },
    ],
  ),

  // ── BLOQUE 20 · ADJETIVOS ─────────────────────────────────────────────
  Lesson(
    id: 20,
    title: 'Block 20 · Adjectives',
    description: 'hungry · hot · cold · fast · slow',
    emoji: '🎨',
    level: Level.A1,
    descripcionEs:
        'Bloque 20 de vocabulario: 5 adjetivos (palabras para describir). Une cada palabra en inglés con su traducción.',
    motivacionEs: '¡Toca cada palabra para escucharla y únela con su traducción! 🃏',
    exercises: [
      {
        'tipo': 'parejas',
        'instruccion': 'Une cada palabra con su traducción',
        'quien_habla': 'Practica',
        'parejas_ingles': ['hungry', 'hot', 'cold', 'fast', 'slow'],
        'parejas_espanol': ['hambriento', 'caliente', 'frío', 'rápido', 'lento'],
        'contexto_es': 'Bloque 20 · Adjetivos: hungry · hot · cold · fast · slow',
      },
    ],
  ),
];
