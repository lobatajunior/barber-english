import 'package:barber_english/services/stats_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('statsDocId', () {
    test('minúsculas, sin puntuación, palabras unidas con _', () {
      expect(statsDocId('Yes, please.'), 'yes_please');
      expect(statsDocId('  Would you like water or coffee? Yes, please. '),
          'would_you_like_water_or_coffee_yes_please');
      expect(statsDocId("What's your name?"), "what's_your_name");
    });

    test('la misma frase con distinta puntuación comparte id', () {
      expect(statsDocId('Ready! Perfect.'), statsDocId('ready perfect'));
    });

    test('vacío o solo signos → id vacío (no se guarda)', () {
      expect(statsDocId(''), '');
      expect(statsDocId('¿?!.'), '');
    });

    test('nunca contiene "/" y se recorta a 120 caracteres', () {
      final largo = List.filled(60, 'word/x').join(' ');
      final id = statsDocId(largo);
      expect(id.contains('/'), isFalse);
      expect(id.length, lessThanOrEqualTo(120));
    });
  });

  test('sin Firebase las escrituras se ignoran sin lanzar errores', () {
    expect(() => StatsService.registrarTipo('opciones', acierto: true),
        returnsNormally);
    expect(
        () => StatsService.registrarPronunciacion(
            texto: 'Yes, please.', puntaje: 72, acierto: true),
        returnsNormally);
    expect(() => StatsService.registrarDia(xp: 30, ejercicios: 1),
        returnsNormally);
  });
}
