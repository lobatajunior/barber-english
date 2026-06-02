import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/progress_provider.dart';

const _kGreen = Color(0xFF00E676);
const _kCard = Color(0xFF111111);

class EscucharWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const EscucharWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<EscucharWidget> createState() => _EscucharWidgetState();
}

class _EscucharWidgetState extends ConsumerState<EscucharWidget>
    with SingleTickerProviderStateMixin {
  bool _playing = false;
  bool _hasPlayed = false;
  bool _showWord = false;
  StreamSubscription<void>? _completeSub;
  late AnimationController _pulseCtrl;
  late Animation<double> _pulseAnim;

  String get _text =>
      (widget.ejercicio['frase'] ?? widget.ejercicio['palabra'] ?? '')
          .toString();

  String get _phonetica =>
      widget.ejercicio['fonetica']?.toString() ?? '';

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.22).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _completeSub?.cancel();
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _play() {
    if (_playing) return;
    final speech = ref.read(speechServiceProvider);

    _completeSub?.cancel();
    setState(() => _playing = true);
    _pulseCtrl.repeat(reverse: true);

    _completeSub = speech.onPlayComplete.listen((_) {
      if (!mounted) return;
      _completeSub?.cancel();
      _completeSub = null;
      _pulseCtrl.stop();
      _pulseCtrl.reset();
      setState(() {
        _playing = false;
        _showWord = true;
      });
      if (!_hasPlayed) {
        _hasPlayed = true;
        widget.onResuelto();
      }
    });

    speech.speak(_text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Botón grande de reproducción ────────────────────────────────────
        GestureDetector(
          onTap: _play,
          child: AnimatedBuilder(
            animation: _pulseAnim,
            builder: (_, child) => Transform.scale(
              scale: _playing ? _pulseAnim.value : 1.0,
              child: child,
            ),
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _playing
                    ? _kGreen.withValues(alpha: 0.20)
                    : _kGreen.withValues(alpha: 0.10),
                border: Border.all(
                  color:
                      _playing ? _kGreen : _kGreen.withValues(alpha: 0.55),
                  width: _playing ? 3 : 2,
                ),
                boxShadow: _playing
                    ? [
                        BoxShadow(
                          color: _kGreen.withValues(alpha: 0.35),
                          blurRadius: 28,
                          spreadRadius: 6,
                        ),
                      ]
                    : [],
              ),
              child: Icon(Icons.volume_up_rounded, color: _kGreen, size: 46),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          _playing
              ? 'Escuchando...'
              : (_hasPlayed
                  ? 'Toca para escuchar de nuevo'
                  : 'Toca para escuchar'),
          style: GoogleFonts.outfit(
            color: _kGreen.withValues(alpha: 0.75),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        // ── Palabra + fonética (se revelan tras escuchar) ───────────────────
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOut,
          transitionBuilder: (child, anim) => FadeTransition(
            opacity: anim,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.15),
                end: Offset.zero,
              ).animate(anim),
              child: child,
            ),
          ),
          child: _showWord
              ? Padding(
                  key: const ValueKey('word'),
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 20),
                    decoration: BoxDecoration(
                      color: _kCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: _kGreen.withValues(alpha: 0.45), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: _kGreen.withValues(alpha: 0.12),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          _text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                        if (_phonetica.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            _phonetica,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              color: _kGreen,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                )
              : const SizedBox(key: ValueKey('empty')),
        ),
      ],
    );
  }
}
