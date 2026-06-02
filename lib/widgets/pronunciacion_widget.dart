import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/progress_provider.dart';

// ── Colores exactos (CAMBIO 6) ───────────────────────────────────────────────
const _kGreen = Color(0xFF00E676);
const _kGreenGlow = Color(0x1F00E676); // rgba(0,230,118,0.12)
const _kYellow = Color(0xFFFFD600);
const _kRed = Color(0xFFFF5252);

// ─────────────────────────────────────────────────────────────────────────────
class PronunciacionWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;
  final VoidCallback onContinuar;

  const PronunciacionWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
    required this.onContinuar,
  });

  @override
  ConsumerState<PronunciacionWidget> createState() =>
      _PronunciacionWidgetState();
}

class _PronunciacionWidgetState extends ConsumerState<PronunciacionWidget>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  bool _modelPlayed = false;
  bool _isListening = false;
  double? _score;
  String _spokenText = '';
  bool _resolved = false;
  StreamSubscription<void>? _completeSub;
  late AnimationController _micPulseCtrl;

  String get _target =>
      widget.ejercicio['respuesta_correcta'].toString();
  String get _phonetica =>
      widget.ejercicio['fonetica']?.toString() ?? '';

  @override
  void initState() {
    super.initState();
    _micPulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    // Auto-reproduce el modelo al entrar (CAMBIO 3-1)
    WidgetsBinding.instance.addPostFrameCallback((_) => _speakModel());
  }

  @override
  void dispose() {
    _completeSub?.cancel();
    _micPulseCtrl.dispose();
    super.dispose();
  }

  // ── Reproducir voz modelo ──────────────────────────────────────────────────
  void _speakModel() {
    if (_isPlaying) return;
    final speech = ref.read(speechServiceProvider);

    _completeSub?.cancel();
    setState(() => _isPlaying = true);

    _completeSub = speech.onPlayComplete.listen((_) {
      if (!mounted) return;
      _completeSub?.cancel();
      _completeSub = null;
      setState(() {
        _isPlaying = false;
        _modelPlayed = true;
      });
    });

    speech.speak(_target);
  }

  // ── Grabar pronunciación ───────────────────────────────────────────────────
  Future<void> _toggleListening() async {
    final speech = ref.read(speechServiceProvider);

    if (_isListening) {
      await speech.stopListening();
      _micPulseCtrl.stop();
      _micPulseCtrl.reset();
      setState(() => _isListening = false);
      return;
    }

    setState(() {
      _isListening = true;
      _score = null;
      _spokenText = '';
    });
    _micPulseCtrl.repeat();

    final started = await speech.startListening(
      onResult: (words) {
        final score = speech.calculateScore(words, _target);
        if (!mounted) return;
        _micPulseCtrl.stop();
        _micPulseCtrl.reset();
        setState(() {
          _spokenText = words;
          _score = score;
          _isListening = false;
          if (score >= 70 && !_resolved) {
            _resolved = true;
            widget.onResuelto();
          }
        });
      },
      onDone: () {
        if (mounted) {
          _micPulseCtrl.stop();
          _micPulseCtrl.reset();
          setState(() => _isListening = false);
        }
      },
    );

    if (!started && mounted) {
      _micPulseCtrl.stop();
      _micPulseCtrl.reset();
      setState(() {
        _isListening = false;
        _spokenText = 'Micrófono no disponible en este dispositivo';
      });
    }
  }

  void _retry() => setState(() {
        _score = null;
        _spokenText = '';
      });

  void _continuar() {
    if (!_resolved) {
      _resolved = true;
      widget.onResuelto();
    }
    widget.onContinuar();
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CAMBIO 3-2: Fonética siempre visible
        if (_phonetica.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _kGreenGlow,
              borderRadius: BorderRadius.circular(14),
              border:
                  Border.all(color: _kGreen.withValues(alpha: 0.30)),
            ),
            child: Text(
              _phonetica,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: _kGreen,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),

        const SizedBox(height: 20),

        // CAMBIO 3-3: Botón "Escucha de nuevo"
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _isPlaying ? null : _speakModel,
            icon: Icon(
              Icons.volume_up_rounded,
              color: _isPlaying ? _kGreen.withValues(alpha: 0.4) : _kGreen,
              size: 20,
            ),
            label: Text(
              _isPlaying ? 'Reproduciendo...' : '🔊  Escucha de nuevo',
              style: GoogleFonts.outfit(
                color: _isPlaying ? _kGreen.withValues(alpha: 0.4) : _kGreen,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: _isPlaying
                    ? _kGreen.withValues(alpha: 0.25)
                    : _kGreen.withValues(alpha: 0.55),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),

        const SizedBox(height: 28),

        // CAMBIO 3-4/5: Botón micrófono con círculos pulsantes
        _MicButton(
          isListening: _isListening,
          isEnabled: _modelPlayed && !_isPlaying,
          pulseCtrl: _micPulseCtrl,
          onTap: (_modelPlayed && !_isPlaying) ? _toggleListening : null,
        ),
        const SizedBox(height: 10),
        Text(
          _isListening
              ? '🔴  Escuchando... toca para parar'
              : (_modelPlayed
                  ? '🎙️  Ahora pronuncia tú'
                  : 'Espera el modelo de pronunciación...'),
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: _isListening
                ? _kGreen
                : (_modelPlayed ? Colors.white70 : Colors.white30),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        // CAMBIO 4: Panel de feedback (aparece al tener score)
        if (_score != null) ...[
          const SizedBox(height: 28),
          _FeedbackPanel(
            score: _score!,
            spokenText: _spokenText,
            onRetry: _retry,
            onContinuar: _continuar,
          ),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Botón micrófono con animación de círculos pulsantes en verde (CAMBIO 3-5)
// ─────────────────────────────────────────────────────────────────────────────
class _MicButton extends StatelessWidget {
  final bool isListening;
  final bool isEnabled;
  final AnimationController pulseCtrl;
  final VoidCallback? onTap;

  const _MicButton({
    required this.isListening,
    required this.isEnabled,
    required this.pulseCtrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculos pulsantes (solo mientras graba)
          if (isListening)
            AnimatedBuilder(
              animation: pulseCtrl,
              builder: (_, _) {
                final v = pulseCtrl.value;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _ring(v % 1.0),
                    _ring((v + 0.33) % 1.0),
                    _ring((v + 0.66) % 1.0),
                  ],
                );
              },
            ),
          // Botón central
          GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isListening
                    ? _kGreen.withValues(alpha: 0.18)
                    : (isEnabled
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.white.withValues(alpha: 0.03)),
                border: Border.all(
                  color: isListening
                      ? _kGreen
                      : (isEnabled ? Colors.white38 : Colors.white12),
                  width: isListening ? 2.5 : 2,
                ),
              ),
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none_rounded,
                color: isListening
                    ? _kGreen
                    : (isEnabled ? Colors.white70 : Colors.white24),
                size: 34,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ring(double t) => Container(
        width: 80 + t * 70,
        height: 80 + t * 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _kGreen.withValues(alpha: (1.0 - t) * 0.32),
        ),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Panel de feedback tras pronunciar (CAMBIOS 4 y 5)
// ─────────────────────────────────────────────────────────────────────────────
class _FeedbackPanel extends StatelessWidget {
  final double score;
  final String spokenText;
  final VoidCallback onRetry;
  final VoidCallback onContinuar;

  const _FeedbackPanel({
    required this.score,
    required this.spokenText,
    required this.onRetry,
    required this.onContinuar,
  });

  // ── Datos según rango de score ─────────────────────────────────────────────
  bool get _isSuccess => score >= 70;

  Color get _bgColor {
    if (score >= 70) return _kGreen.withValues(alpha: 0.12);
    if (score >= 50) return _kYellow.withValues(alpha: 0.10);
    return _kRed.withValues(alpha: 0.10);
  }

  Color get _borderColor {
    if (score >= 70) return _kGreen.withValues(alpha: 0.50);
    if (score >= 50) return _kYellow.withValues(alpha: 0.45);
    return _kRed.withValues(alpha: 0.45);
  }

  Color get _textColor {
    if (score >= 70) return _kGreen;
    if (score >= 50) return _kYellow;
    return _kRed;
  }

  String get _emoji {
    if (score >= 100) return '🏆';
    if (score >= 70) return '👍';
    if (score >= 50) return '💪';
    return '🎯';
  }

  String get _message {
    if (score >= 100) return '¡Pronunciación perfecta!';
    if (score >= 70) return '¡Muy bien, se entiende!';
    if (score >= 50) return 'Casi, sigue practicando';
    return 'Inténtalo de nuevo';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _borderColor, width: 1.5),
          ),
          child: Column(
            children: [
              // Score circular
              _ScoreCircle(score: score),
              const SizedBox(height: 14),

              // Emoji + mensaje
              Text(
                '$_emoji  $_message',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: _textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),

              // Lo que dijo el usuario
              if (spokenText.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  '"$spokenText"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                      color: Colors.white38, fontSize: 12),
                ),
              ],

              const SizedBox(height: 18),

              // CAMBIO 5: Botones según score
              if (_isSuccess)
                // Score >= 70% → solo "Continuar ✅"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onContinuar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kGreen,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      elevation: 4,
                      shadowColor: _kGreen.withValues(alpha: 0.35),
                    ),
                    child: Text(
                      'Continuar ✅',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w900, fontSize: 15),
                    ),
                  ),
                )
              else ...[
                // Score < 70% → "Intentar de nuevo" + "Continuar de todas formas"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Text('🔄', style: TextStyle(fontSize: 16)),
                    label: Text(
                      'Intentar de nuevo',
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.10),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onContinuar,
                  child: Text(
                    'Continuar de todas formas →',
                    style: GoogleFonts.outfit(
                      color: Colors.white30,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Confetti animado para 100% perfecto (CAMBIO 4)
        if (score >= 100)
          Positioned.fill(
            child: IgnorePointer(child: _ConfettiOverlay()),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Círculo de score
// ─────────────────────────────────────────────────────────────────────────────
class _ScoreCircle extends StatelessWidget {
  final double score;
  const _ScoreCircle({required this.score});

  Color get _color {
    if (score >= 70) return _kGreen;
    if (score >= 50) return _kYellow;
    return _kRed;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: score / 100,
            strokeWidth: 6,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation<Color>(_color),
          ),
          Text(
            '${score.round()}%',
            style: GoogleFonts.outfit(
              color: _color,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Confetti animado (CAMBIO 4 — solo score 100%)
// ─────────────────────────────────────────────────────────────────────────────
class _ConfettiOverlay extends StatefulWidget {
  @override
  State<_ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<_ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<_Particle> _particles;

  static const _colors = [
    _kGreen,
    _kYellow,
    _kRed,
    Colors.white,
    Color(0xFF40C4FF),
    Color(0xFFFF80AB),
  ];

  @override
  void initState() {
    super.initState();
    final rnd = Random();
    _particles = List.generate(55, (_) {
      return _Particle(
        x: rnd.nextDouble(),
        speed: 0.35 + rnd.nextDouble() * 0.65,
        sway: (rnd.nextDouble() - 0.5) * 2,
        freq: 1.0 + rnd.nextDouble() * 3.0,
        color: _colors[rnd.nextInt(_colors.length)],
        w: 5.0 + rnd.nextDouble() * 7,
        h: 4.0 + rnd.nextDouble() * 5,
        angle: rnd.nextDouble() * 2 * pi,
        spin: (rnd.nextDouble() - 0.5) * 8,
      );
    });
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..forward();
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
      builder: (_, _) => CustomPaint(
        painter: _ConfettiPainter(_ctrl.value, _particles),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _Particle {
  final double x, speed, sway, freq, w, h, angle, spin;
  final Color color;
  const _Particle({
    required this.x,
    required this.speed,
    required this.sway,
    required this.freq,
    required this.color,
    required this.w,
    required this.h,
    required this.angle,
    required this.spin,
  });
}

class _ConfettiPainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;
  _ConfettiPainter(this.progress, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final t = (progress * p.speed).clamp(0.0, 1.0);
      final opacity = (1.0 - t * 1.4).clamp(0.0, 1.0);
      if (opacity <= 0) continue;
      final x = p.x * size.width + p.sway * sin(progress * p.freq * pi) * 28;
      final y = -12.0 + (size.height + 30) * t;
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.angle + progress * p.spin);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.w, height: p.h),
        Paint()..color = p.color.withValues(alpha: opacity),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => true;
}
