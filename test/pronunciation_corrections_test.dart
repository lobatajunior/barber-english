// Correcciones de pronunciación palabra por palabra.
// Ejecutar: flutter test test/pronunciation_corrections_test.dart
import 'package:barber_english/services/pronunciation_text.dart';
import 'package:flutter_test/flutter_test.dart';

// Mismos umbrales que pronunciacion_widget.dart (kScorePerfecto / kScorePasa).
const _perfecto = 90.0;
const _pasa = 60.0;

const _esperado = 'Low fade on the sides, longer on top, please';

String _mensaje(String escuchado, [String esperado = _esperado]) {
  final score = scorePronunciation(escuchado, esperado);
  final diffs = wordDiffs(escuchado, esperado);
  final fb = PronunciationFeedback.from(score, diffs,
      perfecto: _perfecto, pasa: _pasa);
  final linea = 'score=${score.round()} · diferencias=$diffs · '
      'mensaje=${fb?.text ?? '(sin lista: ¡Pronunciación perfecta!)'}';
  // ignore: avoid_print
  print('  $escuchado\n    → $linea');
  return fb?.text ?? '';
}

void main() {
  test('a) cambiada: phrase en vez de fade', () {
    final m = _mensaje('Low phrase on the sides, longer on top. Please');
    expect(m, 'Casi: escuché "phrase", era "fade"');
  });

  test('b) cambiada: side en vez de sides', () {
    final m = _mensaje('Low fade on the side, longer on top please');
    expect(m, 'Casi: escuché "side", era "sides"');
  });

  test('c) faltó "on top"', () {
    final m = _mensaje('Low fade on the sides longer please');
    expect(m, 'Casi: faltó "on top"');
  });

  test('d) sobró "thanks" (todas las esperadas acertadas → 100, sin lista)',
      () {
    final esc = 'Low fade on the sides, longer on top, please, thanks';
    expect(wordDiffs(esc, _esperado).map((d) => d.texto),
        ['sobró "thanks"']);
    // El puntaje no cambia: las palabras extra no restan, así que es 100.
    expect(scorePronunciation(esc, _esperado), 100);
    expect(_mensaje(esc), '');
  });

  test('e) muy distinto: más de 3 diferencias → repetir más despacio', () {
    final esc = 'Hello how are you';
    expect(wordDiffs(esc, _esperado).length, greaterThan(3));
    final m = _mensaje(esc);
    expect(m, startsWith('Inténtalo de nuevo: '));
    expect(m, endsWith('. $kMensajeMasDespacio'));
    // Solo las 3 primeras diferencias.
    expect(' · '.allMatches(m).length, 2);
  });

  test('f) igual al esperado → sin lista', () {
    expect(wordDiffs(_esperado, _esperado), isEmpty);
    expect(_mensaje(_esperado), '');
  });

  test('60-89 muestra como máximo 2 diferencias', () {
    final m = _mensaje('Low phrase on the side, longer on stop please');
    expect(m, startsWith('Casi: '));
    expect(' · '.allMatches(m).length, 1);
    expect(m, isNot(contains('dijiste')));
  });

  test('palabras partidas y contracciones no generan diferencias', () {
    expect(wordDiffs('side burns combed back', 'Sideburns, combed back'),
        isEmpty);
    expect(wordDiffs("What's your name", 'What is your name?'), isEmpty);
  });

  test('lista vertical: las diferencias se reparten por unidad', () {
    const units = ['Look down', 'Look to the side', 'Head up'];
    final target = units.join(', ');
    final diffs = wordDiffs('look down look to the sight head', target);
    final porUnidad = diffsByUnit(diffs, unitWordCounts(units));
    // ignore: avoid_print
    print('  vertical → $porUnidad');
    expect(porUnidad[0], isEmpty);
    expect(porUnidad[1].map((d) => d.texto), ['escuché "sight", era "side"']);
    expect(porUnidad[2].map((d) => d.texto), ['faltó "up"']);
  });

  test('puntajes sin cambios (mismo cálculo que antes)', () {
    expect(scorePronunciation(_esperado, _esperado), 100);
    expect(scorePronunciation('Low fade on the side, longer on top please',
            _esperado),
        closeTo(88.9, 0.1));
    expect(scorePronunciation('Hello how are you', _esperado), 0);
    expect(scorePronunciation('', _esperado), 0);
  });
}
