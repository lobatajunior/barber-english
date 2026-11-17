import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/lesson.dart';
import '../providers/stats_provider.dart';
import '../widgets/stats_widgets.dart';
import 'exercise_screen.dart';

/// Pestaña Práctica: las frases con peor puntaje medio de pronunciación y un
/// repaso que reutiliza el ejercicio de pronunciación existente.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  /// Ejercicios de pronunciación para repasar [frases] (mismo formato que en
  /// las lecciones, para reutilizar PronunciacionWidget tal cual).
  static List<Map<String, dynamic>> ejerciciosDeRepaso(List<WordStat> frases) => [
        for (final f in frases)
          {
            'tipo': 'pronunciacion',
            'instruccion': 'Repasa tu punto débil',
            'quien_habla': 'REPASO',
            'frase': f.texto,
            'respuesta_correcta': f.texto,
            'fonetica': f.fonetica,
            'traduccion_pregunta': f.traduccion,
          },
      ];

  void _empezarRepaso(BuildContext context, List<WordStat> frases) {
    final repaso = Lesson(
      id: 0,
      title: 'Repaso',
      description: 'Tus puntos débiles',
      emoji: '🎯',
      level: Level.A1,
      exercises: ejerciciosDeRepaso(frases),
    );
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) =>
          ExerciseScreen(lesson: repaso, sectionId: 'practica', repaso: true),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(wordStatsProvider);
    final debiles = puntosDebiles(stats.valueOrNull ?? const []);

    return Container(
      color: kStatsFondo,
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text('Práctica', style: estiloTituloPantalla()),
            const SizedBox(height: 16),
            StatsCard(
              titulo: 'Tus puntos débiles',
              icono: Icons.gps_fixed_rounded,
              child: stats.isLoading && !stats.hasValue
                  ? const CargandoStats()
                  : debiles.isEmpty
                      ? const SinDatos(
                          'Aún no hay datos. Haz tu primera lección y vuelve aquí.')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (final f in debiles)
                              FilaPuntaje(
                                texto: f.texto,
                                subtitulo: f.traduccion,
                                porcentaje: f.promedio,
                                detalle: '${f.intentos} intentos',
                              ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 44,
                              child: ElevatedButton.icon(
                                onPressed: () => _empezarRepaso(context, debiles),
                                icon: const Icon(Icons.play_arrow_rounded,
                                    size: 20),
                                label: Text('Empezar repaso',
                                    style: GoogleFonts.outfit(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kStatsVerde,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
