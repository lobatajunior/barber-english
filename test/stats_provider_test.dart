import 'package:barber_english/providers/stats_provider.dart';
import 'package:barber_english/screens/practice_screen.dart';
import 'package:barber_english/widgets/stats_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

WordStat _w(String t, int intentos, int suma) =>
    WordStat(id: t, texto: t, intentos: intentos, sumaPuntajes: suma);

void main() {
  group('puntosDebiles', () {
    test('ordena por peor promedio y exige al menos 2 intentos', () {
      final lista = [
        _w('a', 2, 180), // 90
        _w('b', 1, 10), // 1 intento: fuera
        _w('c', 3, 120), // 40
        _w('d', 2, 100), // 50
      ];
      expect(puntosDebiles(lista).map((w) => w.texto), ['c', 'd', 'a']);
    });

    test('como máximo 5', () {
      final lista = [for (var i = 0; i < 9; i++) _w('$i', 2, i * 10)];
      expect(puntosDebiles(lista), hasLength(5));
      expect(puntosDebiles(lista).first.texto, '0');
    });

    test('sin datos suficientes → lista vacía', () {
      expect(puntosDebiles([_w('x', 1, 50)]), isEmpty);
      expect(puntosDebiles(const []), isEmpty);
    });
  });

  test('precisionMedia pondera por intentos y es null sin datos', () {
    expect(precisionMedia(const []), isNull);
    expect(precisionMedia([_w('a', 1, 100), _w('b', 3, 120)]), 55);
  });

  test('ultimos7Dias rellena con ceros y termina hoy', () {
    final dias = ultimos7Dias(
      const [DayStat(fecha: '2026-11-15', xp: 40, ejercicios: 3)],
      DateTime(2026, 11, 17),
    );
    expect(dias.map((d) => d.fecha), [
      '2026-11-11', '2026-11-12', '2026-11-13', '2026-11-14',
      '2026-11-15', '2026-11-16', '2026-11-17',
    ]);
    expect(dias[4].xp, 40);
    expect(dias.where((d) => d.xp == 0), hasLength(6));
  });

  test('colorPorcentaje: rojo < 60, amarillo 60-79, verde ≥ 80', () {
    expect(colorPorcentaje(59.9), kStatsRojo);
    expect(colorPorcentaje(60), kStatsGold);
    expect(colorPorcentaje(79), kStatsGold);
    expect(colorPorcentaje(80), kStatsVerde);
  });

  test('el repaso crea ejercicios de pronunciación con frase y fonética', () {
    final ej = PracticeScreen.ejerciciosDeRepaso([
      const WordStat(
          id: 'yes_please',
          texto: 'Yes, please.',
          fonetica: '[ IES · plis ]',
          traduccion: 'Sí, por favor.',
          intentos: 2,
          sumaPuntajes: 80),
    ]);
    expect(ej, hasLength(1));
    expect(ej.first['tipo'], 'pronunciacion');
    expect(ej.first['respuesta_correcta'], 'Yes, please.');
    expect(ej.first['fonetica'], '[ IES · plis ]');
    expect(ej.first['traduccion_pregunta'], 'Sí, por favor.');
  });
}
