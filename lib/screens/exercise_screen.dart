import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/lesson.dart';
import '../providers/progress_provider.dart';
import '../widgets/opciones_widget.dart';
import '../widgets/pronunciacion_widget.dart';
import '../widgets/parejas_widget.dart';
import '../widgets/completar_widget.dart';
import '../widgets/ordenar_widget.dart';
import '../widgets/traducir_widget.dart';
import '../widgets/dialogo_widget.dart';
import '../widgets/escuchar_widget.dart';
import '../widgets/dialogo_completo_widget.dart';

const _kGreen = Color(0xFF00FF87);

class ExerciseScreen extends ConsumerStatefulWidget {
  final Lesson lesson;
  final String sectionId;

  const ExerciseScreen({
    super.key,
    required this.lesson,
    required this.sectionId,
  });

  @override
  ConsumerState<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  int _index = 0;
  bool _resolved = false;
  bool _showIntro = true;

  List<Map<String, dynamic>> get _exercises => widget.lesson.exercises;
  Map<String, dynamic> get _current => _exercises[_index];

  bool get _hasIntro =>
      widget.lesson.descripcionEs != null ||
      widget.lesson.motivacionEs != null;

  void _onResolved() {
    if (!_resolved) setState(() => _resolved = true);
  }

  void _advance() {
    if (_index < _exercises.length - 1) {
      setState(() {
        _index++;
        _resolved = false;
      });
    } else {
      _complete();
    }
  }

  Future<void> _complete() async {
    await ref
        .read(progressProvider.notifier)
        .completeLesson(widget.sectionId, widget.lesson.id);
    if (mounted) _showCompletionDialog();
  }

  void _showCompletionDialog() {
    final messages = [
      '¡Excelente trabajo!',
      '¡Increíble, lo lograste!',
      '¡Eres un crack en inglés!',
      '¡Genial, dominas esta lección!',
    ];
    final msg = messages[Random().nextInt(messages.length)];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 163, 176, 222),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.emoji_events_rounded, color: AppColors.gold, size: 80),
            const SizedBox(height: 16),
            Text(
              '¡LECCIÓN COMPLETADA!',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: Colors.white60, fontSize: 16),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  '¡A POR OTRA!',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroScreen() {
    final lesson = widget.lesson;
    return Container(
      decoration: AppTheme.backgroundDecoration,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white38, size: 22),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const Spacer(),
              // Emoji + title
              Center(
                child: Text(
                  lesson.emoji,
                  style: const TextStyle(fontSize: 64),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  lesson.title.toUpperCase(),
                  style: GoogleFonts.outfit(
                    color: AppColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Descripcion card
              if (lesson.descripcionEs != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('✂️', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          lesson.descripcionEs!,
                          style: GoogleFonts.outfit(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // Motivacion
              if (lesson.motivacionEs != null) ...[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.18),
                        AppColors.primary.withValues(alpha: 0.06),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    lesson.motivacionEs!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              // Start button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => setState(() => _showIntro = false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: AppColors.primary.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    '¡EMPEZAR!',
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _poseForTipo(String? tipo) {
    switch (tipo) {
      case 'opciones':
        return 'assets/pose1.png';
      case 'completar':
        return 'assets/pose2.png';
      case 'parejas':
        return 'assets/pose3.png';
      case 'ordenar':
        return 'assets/pose4.png';
      case 'traducir':
        return 'assets/pose5.png';
      case 'pronunciacion':
        return 'assets/pose6.png';
      case 'escuchar':
        return 'assets/pose2.png';
      case 'dialogo_completo':
        return 'assets/pose1.png';
      default:
        return 'assets/mascota.png';
    }
  }

  Widget _buildExercise() {
    final key = ValueKey('$_index-${_current['tipo']}');
    switch (_current['tipo']) {
      case 'opciones':
        return OpcionesWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'pronunciacion':
        return PronunciacionWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
          onContinuar: _advance,
        );
      case 'parejas':
        return ParejasWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'completar':
        return CompletarWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'ordenar':
        return OrdenarWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'traducir':
        return TraducirWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'dialogo':
        return DialogoWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'escuchar':
        return EscucharWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      case 'dialogo_completo':
        return DialogoCompletoWidget(
          key: key,
          ejercicio: _current,
          onResuelto: _onResolved,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_exercises.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: AppTheme.backgroundDecoration,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🚧', style: TextStyle(fontSize: 60)),
                const SizedBox(height: 16),
                Text(
                  'Lección en construcción',
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Volver',
                    style: GoogleFonts.outfit(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_showIntro && _hasIntro) {
      return Scaffold(body: _buildIntroScreen());
    }

    final progress = (_index + 1) / _exercises.length;

    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              // — Progress bar + close —
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 12, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white12,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                          minHeight: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white38,
                        size: 22,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              // — Lección info —
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      widget.lesson.emoji,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.lesson.title.toUpperCase(),
                      style: GoogleFonts.outfit(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${_index + 1}/${_exercises.length}',
                      style: GoogleFonts.outfit(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),

              // — Instrucción —
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  _current['instruccion']?.toString() ?? '',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
              ),

              // — Contenido del ejercicio —
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SceneCardWidget(
                        ejercicio: _current,
                        pose: _poseForTipo(_current['tipo']?.toString()),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: _buildExercise(),
                      ),
                    ],
                  ),
                ),
              ),

              // — Botones de acción —
              // Para pronunciacion los botones están dentro del widget.
              if (_current['tipo']?.toString() != 'pronunciacion')
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _resolved ? _advance : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _resolved
                                ? AppColors.success
                                : Colors.white12,
                            foregroundColor:
                                _resolved ? Colors.white : Colors.white24,
                            elevation: _resolved ? 8 : 0,
                            shadowColor:
                                AppColors.success.withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            _resolved
                                ? (_index == _exercises.length - 1
                                    ? 'FINALIZAR'
                                    : 'CONTINUAR')
                                : 'COMPROBAR',
                            style: GoogleFonts.outfit(
                              color:
                                  _resolved ? Colors.white : Colors.white24,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _advance,
                        child: Text(
                          'SALTAR',
                          style: GoogleFonts.outfit(
                            color: Colors.white30,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SceneCardWidget
// Muestra el contexto de la frase: avatar circular con borde verde, quién habla,
// frase en inglés y traducción al español.
//
// Campos del ejercicio que consume:
//   quien_habla        → etiqueta verde arriba (ej. "El cliente dice")
//   pregunta | frase   → frase en inglés (negrita blanca)
//   traduccion_pregunta → frase en español (fondo verde suave + 🇪🇸)
// ─────────────────────────────────────────────────────────────────────────────
class SceneCardWidget extends StatelessWidget {
  final Map<String, dynamic> ejercicio;
  final String pose;

  const SceneCardWidget({
    super.key,
    required this.ejercicio,
    required this.pose,
  });

  String get _phraseEn {
    final p = ejercicio['pregunta']?.toString() ?? '';
    if (p.isNotEmpty) return p;
    return ejercicio['frase']?.toString() ?? '';
  }

  String get _phraseEs =>
      ejercicio['traduccion_pregunta']?.toString() ?? '';

  String get _speaker =>
      ejercicio['quien_habla']?.toString() ?? '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border(
          top: const BorderSide(color: _kGreen, width: 2),
          left: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
          right: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06), width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Avatar circular con borde verde ──
            _AvatarCircle(pose: pose),
            const SizedBox(width: 14),

            // ── Contenido derecho ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quién habla
                  if (_speaker.isNotEmpty) ...[
                    Text(
                      _speaker,
                      style: GoogleFonts.outfit(
                        color: _kGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],

                  // Frase en inglés
                  if (_phraseEn.isNotEmpty) ...[
                    Text(
                      _phraseEn,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Traducción en español
                  if (_phraseEs.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: _kGreen.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _kGreen.withValues(alpha: 0.20),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('🇪🇸 ', style: TextStyle(fontSize: 13)),
                          Expanded(
                            child: Text(
                              _phraseEs,
                              style: GoogleFonts.outfit(
                                color: _kGreen.withValues(alpha: 0.85),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
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

class _AvatarCircle extends StatelessWidget {
  final String pose;
  const _AvatarCircle({required this.pose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: _kGreen, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: _kGreen.withValues(alpha: 0.25),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
            color: const Color(0xFF1A1A1A),
          ),
          child: ClipOval(
            child: Image.asset(
              pose,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Image.asset(
                'assets/mascota.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Icono 💈 pequeño abajo a la derecha
        Positioned(
          bottom: -4,
          right: -4,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              shape: BoxShape.circle,
              border: Border.all(color: _kGreen, width: 1.5),
            ),
            child: const Center(
              child: Text('💈', style: TextStyle(fontSize: 11)),
            ),
          ),
        ),
      ],
    );
  }
}
