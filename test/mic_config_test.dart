import 'package:barber_english/services/mic_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('kMicDebug está apagado para publicar', () {
    expect(kMicDebug, isFalse);
  });

  test('micPalabras cuenta palabras de frases y listas', () {
    expect(micPalabras('Yes, please.'), 2);
    expect(micPalabras('Yes, No, Hair wash'), 4);
    expect(micPalabras('[ IES · plis ]'), 2);
    expect(micPalabras(''), 0);
  });

  test('tope: 5 s + 0,6 s por palabra, máximo 12 s', () {
    expect(micTopeMs('Yes, please.'), 6200);
    expect(micTopeMs('Would you like water or coffee? Yes, please.'), 9800);
    expect(
        micTopeMs('Hello! Do you have an appointment right now? '
            'No problem! Please wait.'),
        12000);
    expect(micTopeMs(''), 5000);
  });

  test('silencio: 650 ms en frases, 1000 ms en listas de palabras', () {
    expect(micSilencioMs(listaDePalabras: false), 650);
    expect(micSilencioMs(listaDePalabras: true), 1000);
  });

  test('formatos en el orden pedido (Safari/iOS usa mp4)', () {
    expect(kMicFormatos,
        ['audio/webm;codecs=opus', 'audio/mp4', 'audio/ogg;codecs=opus']);
  });

  test('umbrales coherentes', () {
    expect(kMicUmbralSilencioMin, lessThan(kMicUmbralVozMin));
    expect(kMicFactorSilencio, lessThan(kMicFactorVoz));
    expect(kMicMinAntesDePararMs, lessThan(kMicSinVozMs));
    expect(kMicCalibracionMs, lessThan(kMicMinAntesDePararMs));
  });
}
