import 'dart:math' as math;

import 'package:barber_english/screens/home_screen.dart' show capitalizeWords;
import 'package:barber_english/widgets/pronunciacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  // En los tests cada glifo es un cuadrado del tamaño de la fuente (más ancho
  // que Outfit), así que si cabe aquí también cabe con la fuente real.
  for (final score in [100.0, 89.0, 5.0]) {
    testWidgets('ScoreCircle muestra ${score.round()}% completo dentro del anillo',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: Center(child: ScoreCircle(score: score))),
      ));

      final label = '${score.round()}%';
      final text = find.text(label);
      expect(text, findsOneWidget);
      expect(tester.takeException(), isNull); // sin desbordes de layout

      // Rectángulo real del texto en pantalla (incluye el escalado de FittedBox).
      final textRect = tester.getRect(text);
      final circle = tester.getRect(find.byType(ScoreCircle));
      expect(circle.width, kScoreCircleSize);

      // Las cuatro esquinas del texto deben quedar dentro del hueco del anillo
      // (radio exterior − grosor del trazo), así se ve el "1" y el "%".
      final innerRadius = circle.width / 2 - 6;
      final c = circle.center;
      for (final p in [
        textRect.topLeft,
        textRect.topRight,
        textRect.bottomLeft,
        textRect.bottomRight,
      ]) {
        final d = math.sqrt(math.pow(p.dx - c.dx, 2) + math.pow(p.dy - c.dy, 2));
        expect(d, lessThanOrEqualTo(innerRadius),
            reason: '$label: esquina $p fuera del anillo (r=$innerRadius)');
      }
    });
  }

  test('capitalizeWords pone la inicial de cada palabra en mayúscula', () {
    expect(capitalizeWords('junior'), 'Junior');
    expect(capitalizeWords('junior lobata'), 'Junior Lobata');
    expect(capitalizeWords('José'), 'José');
    expect(capitalizeWords('ángel  núñez'), 'Ángel  Núñez');
    expect(capitalizeWords(''), '');
  });
}
