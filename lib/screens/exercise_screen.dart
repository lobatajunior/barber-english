import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/lesson.dart';
import '../providers/progress_provider.dart';
import '../providers/gamification_provider.dart';
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
  bool _showCompletion = false;

  // XP tracking for completion screen
  int _nivelAlEmpezar = -1; // -1 = not yet captured
  int _nivelAlTerminar = 1;
  String _nombreNivelNuevo = 'Apprentice Barber';
  int _xpEjerciciosTotal = 0;    // +10 per exercise resolved
  int _xpPronunciacionTotal = 0; // +50 per perfect pronunciation
  int _xpRachaGanado = 0;        // 0 or 20

  List<Map<String, dynamic>> get _exercises => widget.lesson.exercises;
  Map<String, dynamic> get _current => _exercises[_index];

  bool get _hasIntro =>
      widget.lesson.descripcionEs != null ||
      widget.lesson.motivacionEs != null;

  void _onResolved() {
    if (!_resolved) {
      // Capture the nivel before any exercise XP is added (only on first call)
      if (_nivelAlEmpezar == -1) {
        _nivelAlEmpezar = ref.read(gamificationProvider).nivel;
      }
      setState(() {
        _resolved = true;
        _xpEjerciciosTotal += 10;
      });
      ref.read(gamificationProvider.notifier).addXP(10);
    }
  }

  void _onPerfecto() {
    setState(() => _xpPronunciacionTotal += 50);
    ref.read(gamificationProvider.notifier).addXP(50);
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
    // Capture starting nivel if no exercises were resolved before completion
    if (_nivelAlEmpezar == -1) {
      _nivelAlEmpezar = ref.read(gamificationProvider).nivel;
    }

    // Award lesson completion XP (synchronous state update)
    ref.read(gamificationProvider.notifier).addXP(100);

    // Check and award daily streak bonus
    final rachaBonus = await ref.read(gamificationProvider.notifier).checkRacha();
    if (!mounted) return;

    final gam = ref.read(gamificationProvider);

    // Save lesson progress
    await ref.read(progressProvider.notifier).completeLesson(widget.sectionId, widget.lesson.id);
    if (!mounted) return;

    setState(() {
      _xpRachaGanado = rachaBonus;
      _nivelAlTerminar = gam.nivel;
      _nombreNivelNuevo = gam.nombreNivel;
      _showCompletion = true;
    });
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
              // Avatar mascota completo, sin recorte
              Center(
                child: Image.asset(
                  'assets/mascota.png',
                  height: 150,
                  fit: BoxFit.contain,
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
          onPerfecto: _onPerfecto,
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
    if (_showCompletion) {
      return _CompletionView(
        lessonTitle: widget.lesson.title,
        lessonEmoji: widget.lesson.emoji,
        onNext: () => Navigator.of(context).pop(),
        xpEjercicios: _xpEjerciciosTotal,
        xpPronunciacion: _xpPronunciacionTotal,
        xpRacha: _xpRachaGanado,
        nivelAntes: _nivelAlEmpezar.clamp(1, 5),
        nivelDespues: _nivelAlTerminar,
        nombreNivelNuevo: _nombreNivelNuevo,
      );
    }

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
// CompletionView — pantalla de celebración al acabar la lección
// ─────────────────────────────────────────────────────────────────────────────
class _CompletionView extends StatefulWidget {
  final String lessonTitle;
  final String lessonEmoji;
  final VoidCallback onNext;
  final int xpEjercicios;      // +10 × N exercises
  final int xpPronunciacion;   // +50 × N perfect pronunciations
  final int xpRacha;           // 0 or 20
  final int nivelAntes;        // nivel before lesson started
  final int nivelDespues;      // nivel after all XP awarded
  final String nombreNivelNuevo;

  const _CompletionView({
    required this.lessonTitle,
    required this.lessonEmoji,
    required this.onNext,
    required this.xpEjercicios,
    required this.xpPronunciacion,
    required this.xpRacha,
    required this.nivelAntes,
    required this.nivelDespues,
    required this.nombreNivelNuevo,
  });

  @override
  State<_CompletionView> createState() => _CompletionViewState();
}

class _CompletionViewState extends State<_CompletionView>
    with TickerProviderStateMixin {
  late AnimationController _entradaCtrl;
  late Animation<double> _scale;
  late Animation<double> _fade;

  late AnimationController _levelUpCtrl;
  late Animation<double> _levelUpScale;
  late Animation<double> _levelUpFade;

  static const _kCelebGreen = Color(0xFF00E676);
  static const _kCelebBg = Color(0xFF080808);
  static const _kGold = Color(0xFFFFD600);

  int get _xpTotal => widget.xpEjercicios + widget.xpPronunciacion + 100 + widget.xpRacha;
  bool get _subioDeNivel => widget.nivelDespues > widget.nivelAntes;

  @override
  void initState() {
    super.initState();

    _entradaCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _scale = CurvedAnimation(parent: _entradaCtrl, curve: Curves.elasticOut);
    _fade = CurvedAnimation(parent: _entradaCtrl, curve: Curves.easeIn);
    _entradaCtrl.forward();

    _levelUpCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _levelUpScale = CurvedAnimation(parent: _levelUpCtrl, curve: Curves.elasticOut);
    _levelUpFade = CurvedAnimation(parent: _levelUpCtrl, curve: Curves.easeIn);

    if (_subioDeNivel) {
      Future.delayed(const Duration(milliseconds: 1600), () {
        if (mounted) _levelUpCtrl.forward();
      });
    }
  }

  @override
  void dispose() {
    _entradaCtrl.dispose();
    _levelUpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kCelebBg,
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: _CompletionConfetti()),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 36),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Trofeo con entrada elástica
                  ScaleTransition(
                    scale: _scale,
                    child: FadeTransition(
                      opacity: _fade,
                      child: const Text('🏆', style: TextStyle(fontSize: 76)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  FadeTransition(
                    opacity: _fade,
                    child: Text(
                      '¡Lección completada!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  FadeTransition(
                    opacity: _fade,
                    child: Text(
                      '${widget.lessonEmoji}  ${widget.lessonTitle}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        color: Colors.white38,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // XP Badge — animated counter + breakdown
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: _kCelebGreen.withValues(alpha: 0.40),
                        width: 1.5,
                      ),
                      color: _kCelebGreen.withValues(alpha: 0.06),
                      boxShadow: [
                        BoxShadow(
                          color: _kCelebGreen.withValues(alpha: 0.14),
                          blurRadius: 36,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Animated total counter
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: _xpTotal.toDouble()),
                          duration: const Duration(milliseconds: 1300),
                          curve: Curves.easeOutCubic,
                          builder: (_, xp, __) => Text(
                            '+${xp.round()} XP',
                            style: GoogleFonts.outfit(
                              color: _kCelebGreen,
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              height: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'XP ganados esta lección',
                          style: GoogleFonts.outfit(
                            color: _kCelebGreen.withValues(alpha: 0.50),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Divider
                        Divider(color: _kCelebGreen.withValues(alpha: 0.18), height: 1),
                        const SizedBox(height: 14),

                        // Breakdown rows
                        _XpRow(label: 'Ejercicios completados', xp: widget.xpEjercicios),
                        if (widget.xpPronunciacion > 0)
                          _XpRow(
                            label: 'Pronunciación perfecta ⭐',
                            xp: widget.xpPronunciacion,
                          ),
                        _XpRow(label: 'Lección completa', xp: 100, highlight: true),
                        if (widget.xpRacha > 0)
                          _XpRow(label: 'Racha diaria 🔥', xp: widget.xpRacha),
                      ],
                    ),
                  ),

                  // Level-up banner (appears after XP counter finishes)
                  if (_subioDeNivel) ...[
                    const SizedBox(height: 20),
                    ScaleTransition(
                      scale: _levelUpScale,
                      child: FadeTransition(
                        opacity: _levelUpFade,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: [
                                _kGold.withValues(alpha: 0.22),
                                _kGold.withValues(alpha: 0.08),
                              ],
                            ),
                            border: Border.all(
                              color: _kGold.withValues(alpha: 0.55),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '⭐ ¡SUBISTE DE NIVEL! ⭐',
                                style: GoogleFonts.outfit(
                                  color: _kGold,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.nombreNivelNuevo,
                                style: GoogleFonts.outfit(
                                  color: Colors.white.withValues(alpha: 0.85),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Siguiente lección button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _kCelebGreen,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 8,
                        shadowColor: _kCelebGreen.withValues(alpha: 0.4),
                      ),
                      child: Text(
                        'Siguiente lección →',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _XpRow extends StatelessWidget {
  final String label;
  final int xp;
  final bool highlight;

  const _XpRow({required this.label, required this.xp, this.highlight = false});

  static const _kCelebGreen = Color(0xFF00E676);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(
              color: highlight ? Colors.white70 : Colors.white38,
              fontSize: 12,
              fontWeight: highlight ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            '+$xp XP',
            style: GoogleFonts.outfit(
              color: highlight
                  ? _kCelebGreen
                  : _kCelebGreen.withValues(alpha: 0.65),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Confetti en bucle para la pantalla de celebración
// ─────────────────────────────────────────────────────────────────────────────
class _CompletionConfetti extends StatefulWidget {
  const _CompletionConfetti();

  @override
  State<_CompletionConfetti> createState() => _CompletionConfettiState();
}

class _CompletionConfettiState extends State<_CompletionConfetti>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<_CParticle> _particles;

  static const _colors = [
    Color(0xFF00E676),
    Color(0xFFFFD600),
    Color(0xFFFF5252),
    Colors.white,
    Color(0xFF40C4FF),
    Color(0xFFFF80AB),
  ];

  @override
  void initState() {
    super.initState();
    final rnd = Random();
    _particles = List.generate(60, (_) => _CParticle(
      x: rnd.nextDouble(),
      speed: 0.25 + rnd.nextDouble() * 0.55,
      phase: rnd.nextDouble(),
      sway: (rnd.nextDouble() - 0.5) * 2,
      freq: 1.0 + rnd.nextDouble() * 3.0,
      color: _colors[rnd.nextInt(_colors.length)],
      w: 5.0 + rnd.nextDouble() * 7,
      h: 4.0 + rnd.nextDouble() * 5,
      angle: rnd.nextDouble() * 2 * pi,
      spin: (rnd.nextDouble() - 0.5) * 8,
    ));
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 4))
      ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => CustomPaint(
        painter: _CConfettiPainter(_ctrl.value, _particles),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _CParticle {
  final double x, speed, phase, sway, freq, w, h, angle, spin;
  final Color color;
  const _CParticle({
    required this.x,
    required this.speed,
    required this.phase,
    required this.sway,
    required this.freq,
    required this.color,
    required this.w,
    required this.h,
    required this.angle,
    required this.spin,
  });
}

class _CConfettiPainter extends CustomPainter {
  final double progress;
  final List<_CParticle> particles;
  _CConfettiPainter(this.progress, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      // Cada partícula tiene su propia fase para que el bucle sea continuo
      final t = ((progress * p.speed + p.phase) % 1.0);
      final opacity = t < 0.85 ? 1.0 : (1.0 - (t - 0.85) / 0.15);
      if (opacity <= 0) continue;
      final x = p.x * size.width + p.sway * sin(progress * p.freq * pi * 2) * 28;
      final y = -12.0 + (size.height + 30) * t;
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.angle + progress * p.spin);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.w, height: p.h),
        Paint()..color = p.color.withValues(alpha: opacity * 0.75),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_CConfettiPainter old) => true;
}

// ─────────────────────────────────────────────────────────────────────────────
// SceneCardWidget — avatar + speaker label + Spanish translation
// Para 'parejas' solo muestra avatar + speaker label (sin texto de palabras).
// ─────────────────────────────────────────────────────────────────────────────
class SceneCardWidget extends StatelessWidget {
  final Map<String, dynamic> ejercicio;
  final String pose;

  const SceneCardWidget({
    super.key,
    required this.ejercicio,
    required this.pose,
  });

  String get _phraseEs =>
      ejercicio['traduccion_pregunta']?.toString() ?? '';

  String get _speaker =>
      ejercicio['quien_habla']?.toString() ?? '';

  bool get _showText => ejercicio['tipo'] != 'parejas';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AvatarCircle(pose: pose),
                  const SizedBox(width: 14),
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
                        // Traducción en español (todos los tipos excepto parejas)
                        if (_showText && _phraseEs.isNotEmpty)
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
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                color: _kGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  final String pose;
  const _AvatarCircle({required this.pose});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Image.asset(
        pose,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => Image.asset(
          'assets/mascota.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
