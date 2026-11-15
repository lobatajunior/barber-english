// Comparación de texto para la pronunciación: normalización, puntaje y
// diferencias palabra por palabra. Dart puro (sin Flutter ni plugins) para
// poder probarlo con `flutter test` sin micrófono ni Whisper.
//
// El puntaje (scorePronunciation) es el mismo cálculo que antes vivía en
// SpeechService.calculateScore, movido sin cambios.

// Contracciones que se expanden en lo dicho y en el objetivo, para que
// "What's your name?" puntúe igual que "What is your name?".
const _contractions = {
  "what's": 'what is',
  "that's": 'that is',
  "it's": 'it is',
  "he's": 'he is',
  "she's": 'she is',
  "you're": 'you are',
  "we're": 'we are',
  "they're": 'they are',
  "i'm": 'i am',
  "don't": 'do not',
  "doesn't": 'does not',
  "didn't": 'did not',
  "can't": 'can not',
  "won't": 'will not',
  "let's": 'let us',
  "i'll": 'i will',
  "i've": 'i have',
};

final _contractionRe = RegExp(
    "\\b(${_contractions.keys.map(RegExp.escape).join('|')})(?![\\w'])");

/// Minúsculas, apóstrofes unificados, contracciones expandidas, sin
/// puntuación y con espacios simples.
String normalizePronunciation(String text) => text
    .toLowerCase()
    .replaceAll(RegExp('[‘’ʼ`]'), "'")
    .replaceAllMapped(_contractionRe, (m) => _contractions[m[1]]!)
    .replaceAll(RegExp(r'[^\w\s]'), '')
    .replaceAll(RegExp(r'\s+'), ' ')
    .trim();

List<String> _words(String text) =>
    normalizePronunciation(text).split(' ').where((w) => w.isNotEmpty).toList();

/// Une dos palabras dichas seguidas cuando juntas forman EXACTAMENTE una
/// palabra del objetivo ("side burns" → "sideburns"), porque Whisper a
/// veces parte palabras compuestas. No relaja nada más.
List<String> _joinSplitWords(List<String> spoken, List<String> target) {
  final targetSet = target.toSet();
  final out = <String>[];
  for (int i = 0; i < spoken.length; i++) {
    if (i + 1 < spoken.length &&
        !targetSet.contains(spoken[i]) &&
        targetSet.contains(spoken[i] + spoken[i + 1])) {
      out.add(spoken[i] + spoken[i + 1]);
      i++;
    } else {
      out.add(spoken[i]);
    }
  }
  return out;
}

/// Parejas (índice objetivo, índice dicho) de palabras que coinciden exactas
/// y en orden (subsecuencia común más larga): una palabra dicha cuenta una
/// sola vez, y palabras extra dichas por el alumno no restan.
List<(int, int)> _orderedExactMatches(
    List<String> spoken, List<String> target) {
  final t = target.length;
  final s = spoken.length;
  final lcs = List.generate(t + 1, (_) => List.filled(s + 1, 0));
  for (int i = t - 1; i >= 0; i--) {
    for (int j = s - 1; j >= 0; j--) {
      lcs[i][j] = target[i] == spoken[j]
          ? lcs[i + 1][j + 1] + 1
          : (lcs[i + 1][j] > lcs[i][j + 1] ? lcs[i + 1][j] : lcs[i][j + 1]);
    }
  }
  final pairs = <(int, int)>[];
  var i = 0;
  var j = 0;
  while (i < t && j < s) {
    if (target[i] == spoken[j]) {
      pairs.add((i, j));
      i++;
      j++;
    } else if (lcs[i + 1][j] >= lcs[i][j + 1]) {
      i++;
    } else {
      j++;
    }
  }
  return pairs;
}

/// Palabras del objetivo y de lo dicho, ya normalizadas y con las palabras
/// partidas unidas: exactamente lo que compara el puntaje.
(List<String> target, List<String> spoken) comparableWords(
    String spoken, String target) {
  final t = _words(target);
  return (t, _joinSplitWords(_words(spoken), t));
}

/// Returns accuracy 0–100, estricto palabra por palabra: solo cuenta una
/// palabra si coincide EXACTA (sin tolerar terminaciones: want ≠ wanted,
/// side ≠ sides), en el mismo orden que la frase objetivo. Ignora
/// mayúsculas, puntuación y apóstrofes. 100 solo si coinciden todas; si
/// falta alguna, máximo 89.
double scorePronunciation(String spoken, String target) {
  final (targetWords, spokenWords) = comparableWords(spoken, target);
  if (targetWords.isEmpty) return 0;
  final matches = _orderedExactMatches(spokenWords, targetWords).length;
  final score = matches / targetWords.length * 100;
  if (matches < targetWords.length) return score.clamp(0.0, 89.0);
  return 100;
}

// ─────────────────────────────────────────────────────────────────────────────
// Diferencias palabra por palabra
// ─────────────────────────────────────────────────────────────────────────────

enum DiffKind { cambiada, falto, sobro }

class WordDiff {
  final DiffKind kind;

  /// Lo que se escuchó (vacío si faltó).
  final String heard;

  /// Lo que se esperaba (vacío si sobró).
  final String expected;

  /// Índice en las palabras del objetivo al que pertenece la diferencia: la
  /// primera palabra afectada, o para "sobró" la palabra esperada anterior
  /// (−1 si sobró antes de la primera). Sirve para repartirlas por unidad.
  final int targetIndex;

  const WordDiff(this.kind, this.heard, this.expected, this.targetIndex);

  /// Texto en español con las palabras en inglés entre comillas.
  String get texto => switch (kind) {
        DiffKind.cambiada => 'escuché "$heard", era "$expected"',
        DiffKind.falto => 'faltó "$expected"',
        DiffKind.sobro => 'sobró "$heard"',
      };

  @override
  String toString() => texto;
}

int _charDistance(String a, String b) {
  var prev = List<int>.generate(b.length + 1, (j) => j);
  for (var i = 1; i <= a.length; i++) {
    final cur = List<int>.filled(b.length + 1, 0)..[0] = i;
    for (var j = 1; j <= b.length; j++) {
      final sub = prev[j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1);
      final del = prev[j] + 1;
      final ins = cur[j - 1] + 1;
      cur[j] = sub < del ? (sub < ins ? sub : ins) : (del < ins ? del : ins);
    }
    prev = cur;
  }
  return prev[b.length];
}

/// Alinea lo esperado con lo escuchado y devuelve las diferencias en orden.
///
/// Las palabras acertadas son las MISMAS que cuenta el puntaje (subsecuencia
/// común más larga). Entre dos aciertos queda un hueco de palabras esperadas y
/// escuchadas: se emparejan como "cambiada" (eligiendo la posición que más se
/// parece letra a letra) y lo que sobra de un lado es "faltó" o "sobró",
/// agrupando palabras seguidas ("faltó "on top"").
List<WordDiff> wordDiffs(String spoken, String target) {
  final (t, s) = comparableWords(spoken, target);
  final anchors = [
    (-1, -1),
    ..._orderedExactMatches(s, t),
    (t.length, s.length),
  ];
  final out = <WordDiff>[];
  for (var a = 0; a + 1 < anchors.length; a++) {
    final (t0, s0) = anchors[a];
    final (t1, s1) = anchors[a + 1];
    final tg = t.sublist(t0 + 1, t1); // esperadas sin acertar
    final sg = s.sublist(s0 + 1, s1); // escuchadas sin acertar
    if (tg.isEmpty && sg.isEmpty) continue;
    final tBase = t0 + 1;

    if (tg.length >= sg.length) {
      // Elige dónde caen las escuchadas dentro de las esperadas.
      var best = 0;
      var bestCost = 1 << 30;
      for (var k = 0; k + sg.length <= tg.length; k++) {
        var cost = 0;
        for (var i = 0; i < sg.length; i++) {
          cost += _charDistance(sg[i], tg[k + i]);
        }
        if (cost < bestCost) {
          bestCost = cost;
          best = k;
        }
      }
      if (best > 0) {
        out.add(WordDiff(
            DiffKind.falto, '', tg.sublist(0, best).join(' '), tBase));
      }
      for (var i = 0; i < sg.length; i++) {
        out.add(WordDiff(
            DiffKind.cambiada, sg[i], tg[best + i], tBase + best + i));
      }
      final after = best + sg.length;
      if (after < tg.length) {
        out.add(WordDiff(DiffKind.falto, '', tg.sublist(after).join(' '),
            tBase + after));
      }
    } else {
      // Se escuchó más de lo esperado: elige qué escuchadas se emparejan.
      var best = 0;
      var bestCost = 1 << 30;
      for (var k = 0; k + tg.length <= sg.length; k++) {
        var cost = 0;
        for (var i = 0; i < tg.length; i++) {
          cost += _charDistance(sg[k + i], tg[i]);
        }
        if (cost < bestCost) {
          bestCost = cost;
          best = k;
        }
      }
      if (best > 0) {
        out.add(WordDiff(
            DiffKind.sobro, sg.sublist(0, best).join(' '), '', tBase - 1));
      }
      for (var i = 0; i < tg.length; i++) {
        out.add(
            WordDiff(DiffKind.cambiada, sg[best + i], tg[i], tBase + i));
      }
      final after = best + tg.length;
      if (after < sg.length) {
        out.add(WordDiff(DiffKind.sobro, sg.sublist(after).join(' '), '',
            tBase + tg.length - 1));
      }
    }
  }
  return out;
}

/// Número de palabras normalizadas de cada unidad de una lista vertical
/// ("Look down, Look to the side" → [2, 4]), para repartir diferencias.
List<int> unitWordCounts(List<String> units) =>
    [for (final u in units) _words(u).length];

/// Reparte las diferencias por unidad (índice de unidad → diferencias).
List<List<WordDiff>> diffsByUnit(List<WordDiff> diffs, List<int> counts) {
  final out = [for (final _ in counts) <WordDiff>[]];
  if (counts.isEmpty) return out;
  for (final d in diffs) {
    var idx = d.targetIndex < 0 ? 0 : d.targetIndex;
    var unit = 0;
    while (unit < counts.length - 1 && idx >= counts[unit]) {
      idx -= counts[unit];
      unit++;
    }
    out[unit].add(d);
  }
  return out;
}

// ─────────────────────────────────────────────────────────────────────────────
// Mensaje de corrección
// ─────────────────────────────────────────────────────────────────────────────

const kMensajeMasDespacio = 'Escucha de nuevo y repite más despacio';

class PronunciationFeedback {
  /// "Casi: " (60-89) o "Inténtalo de nuevo: " (< 60).
  final String prefix;

  /// Hasta 2 (60-89) o 3 (< 60) diferencias ya redactadas.
  final List<String> items;

  /// Hay más de 3 diferencias: se pide repetir más despacio.
  final bool slowDown;

  const PronunciationFeedback(this.prefix, this.items, this.slowDown);

  /// null con 90-100 (pronunciación perfecta) o si no hay diferencias.
  static PronunciationFeedback? from(
    double score,
    List<WordDiff> diffs, {
    required double perfecto,
    required double pasa,
  }) {
    if (score >= perfecto || diffs.isEmpty) return null;
    final casi = score >= pasa;
    return PronunciationFeedback(
      casi ? 'Casi: ' : 'Inténtalo de nuevo: ',
      [for (final d in diffs.take(casi ? 2 : 3)) d.texto],
      diffs.length > 3,
    );
  }

  String get text =>
      '$prefix${items.join(' · ')}${slowDown ? '. $kMensajeMasDespacio' : ''}';

  @override
  String toString() => text;
}
