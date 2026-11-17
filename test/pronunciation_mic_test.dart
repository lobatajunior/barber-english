import 'package:barber_english/providers/progress_provider.dart';
import 'package:barber_english/services/pronunciation_text.dart' as pt;
import 'package:barber_english/services/speech_service.dart';
import 'package:barber_english/widgets/pronunciacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

/// SpeechService falso: guarda los callbacks de la escucha para dispararlos
/// a mano. Nunca llama a Whisper.
class _FakeSpeech implements SpeechService {
  void Function(String)? onResult;
  void Function()? onDone, onStopped, onNoVoice, onCancelled, onUnsupported;
  bool lista = false;
  String owner = '';
  int finish = 0, stop = 0;
  final released = <String>[];

  @override
  Stream<void> get onPlayComplete => const Stream.empty();

  @override
  Future<bool> startListening({
    required void Function(String words) onResult,
    required void Function() onDone,
    void Function(double level)? onSoundLevel,
    void Function()? onStopped,
    void Function()? onNoVoice,
    void Function()? onCancelled,
    void Function()? onUnsupported,
    String target = '',
    bool listaDePalabras = false,
    String owner = '',
  }) async {
    this.onResult = onResult;
    this.onDone = onDone;
    this.onStopped = onStopped;
    this.onNoVoice = onNoVoice;
    this.onCancelled = onCancelled;
    this.onUnsupported = onUnsupported;
    lista = listaDePalabras;
    this.owner = owner;
    return true;
  }

  @override
  Future<void> finishListening() async => finish++;
  @override
  Future<void> stopListening() async => stop++;
  @override
  void releaseMic(String owner) => released.add(owner);
  @override
  double calculateScore(String spoken, String target) =>
      pt.scorePronunciation(spoken, target);
  @override
  List<pt.WordDiff> wordDiffs(String spoken, String target) =>
      pt.wordDiffs(spoken, target);
  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

const _frase = {
  'tipo': 'pronunciacion',
  'respuesta_correcta': 'Yes, please.',
  'fonetica': '[ IES · plis ]',
};
const _lista = {
  'tipo': 'pronunciacion',
  'respuesta_correcta': 'Yes, No, Hair wash',
  'fonetica': '[ IES · NOU · JER UOSH ]',
};

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  late _FakeSpeech fake;
  late List<double> intentos;
  late int fallos;

  Future<void> montar(WidgetTester t, Map<String, dynamic> ej) async {
    fake = _FakeSpeech();
    intentos = [];
    fallos = 0;
    await t.pumpWidget(ProviderScope(
      overrides: [speechServiceProvider.overrideWithValue(fake)],
      child: MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PronunciacionWidget(
              ejercicio: ej,
              onResuelto: () {},
              onFallo: () => fallos++,
              onIntento: intentos.add,
              onContinuar: () {},
            ),
          ),
        ),
      ),
    ));
  }

  GestureDetector mic(WidgetTester t, IconData icono) => t.widget<GestureDetector>(
      find.ancestor(of: find.byIcon(icono), matching: find.byType(GestureDetector)).first);

  testWidgets('al parar pasa a "Procesando…" y no se puede tocar', (t) async {
    await montar(t, _frase);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    expect(find.text('🔴  Escuchando… toca para terminar'), findsOneWidget);
    expect(fake.lista, isFalse);
    expect(fake.owner, isNotEmpty);

    fake.onStopped!();
    await t.pump();
    expect(find.text('Procesando…'), findsOneWidget);
    expect(find.text('🔴  Escuchando… toca para terminar'), findsNothing);
    expect(mic(t, Icons.hourglass_top_rounded).onTap, isNull);

    fake.onResult!('Yes, please.');
    fake.onDone!();
    await t.pump();
    expect(find.text('Procesando…'), findsNothing);
    expect(intentos, [100]);
  });

  testWidgets('tocar mientras graba termina la grabación', (t) async {
    await montar(t, _frase);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    await t.tap(find.byIcon(Icons.mic));
    await t.pump();
    expect(fake.finish, 1);

    // Sin voz: el servicio cancela y la interfaz vuelve a su estado normal.
    fake.onCancelled!();
    fake.onDone!();
    await t.pump();
    expect(find.text('🎙️  Ahora pronuncia tú'), findsOneWidget);
    expect(intentos, isEmpty);
    expect(fallos, 0);
  });

  testWidgets('sin voz: aviso, sin intento, sin 0 % y sin fallo', (t) async {
    await montar(t, _frase);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    fake.onNoVoice!();
    fake.onDone!();
    await t.pump();
    expect(find.text('No te escuché, inténtalo de nuevo'), findsOneWidget);
    expect(find.textContaining('%'), findsNothing);
    expect(intentos, isEmpty);
    expect(fallos, 0);
    // El micrófono vuelve a estar disponible.
    expect(mic(t, Icons.mic_none_rounded).onTap, isNotNull);
  });

  testWidgets('navegador sin formato de grabación: mensaje claro', (t) async {
    await montar(t, _frase);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    fake.onUnsupported!();
    fake.onDone!();
    await t.pump();
    expect(find.textContaining('Este navegador no puede grabar audio'),
        findsOneWidget);
  });

  testWidgets('las listas de palabras usan el silencio largo', (t) async {
    await montar(t, _lista);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    expect(fake.lista, isTrue);
  });

  testWidgets('al salir del ejercicio se corta la grabación y se cierra el micro',
      (t) async {
    await montar(t, _frase);
    await t.tap(find.byIcon(Icons.mic_none_rounded));
    await t.pump();
    final owner = fake.owner;
    await t.pumpWidget(const SizedBox());
    expect(fake.stop, 1);
    expect(fake.released, [owner]);
  });
}
