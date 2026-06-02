import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class CompletarWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const CompletarWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<CompletarWidget> createState() => _CompletarWidgetState();
}

class _CompletarWidgetState extends ConsumerState<CompletarWidget> {
  String? _selected;
  bool _resolved = false;
  bool _wrong = false;
  late List<String> _shuffled;

  @override
  void initState() {
    super.initState();
    _shuffled = List<String>.from(widget.ejercicio['opciones'])..shuffle();
  }

  void _select(String opt) {
    if (_resolved || _wrong) return;
    final correcta = widget.ejercicio['respuesta_correcta'].toString().toLowerCase();
    if (opt.toLowerCase() == correcta) {
      setState(() {
        _selected = opt;
        _resolved = true;
      });
      final full = widget.ejercicio['frase'].toString().replaceAll('___', opt);
      ref.read(speechServiceProvider).speak(full);
      widget.onResuelto();
    } else {
      setState(() {
        _selected = opt;
        _wrong = true;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) setState(() { _selected = null; _wrong = false; });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final frase = widget.ejercicio['frase']?.toString() ?? '';
    final traduccion = widget.ejercicio['traduccion_pregunta']?.toString() ?? '';
    final parts = frase.split('___');
    final before = parts.isNotEmpty ? parts[0] : '';
    final after = parts.length > 1 ? parts[1] : '';

    final blankColor = _resolved
        ? AppColors.success
        : _wrong
            ? AppColors.error
            : _selected != null
                ? AppColors.primary
                : Colors.white38;

    return Column(
      children: [
        // ── Frase con hueco ──────────────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: before,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: blankColor.withValues(alpha: _selected != null ? 0.15 : 0.0),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: blankColor, width: 2),
                  ),
                  child: Text(
                    _selected ?? '   ___   ',
                    style: GoogleFonts.outfit(
                      color: blankColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: after,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ),

        if (_resolved && traduccion.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
            ),
            child: Text(
              traduccion,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.success,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],

        const SizedBox(height: 28),

        // ── Opciones ─────────────────────────────────────────────────────────
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: _shuffled.map((opt) {
            final isOpt = _selected == opt;
            final Color chipColor = isOpt
                ? (_resolved
                    ? AppColors.success
                    : _wrong
                        ? AppColors.error
                        : AppColors.primary)
                : Colors.white24;

            return GestureDetector(
              onTap: _resolved ? null : () => _select(opt),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                decoration: BoxDecoration(
                  color: isOpt
                      ? chipColor.withValues(alpha: 0.12)
                      : Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: chipColor, width: 2),
                ),
                child: Text(
                  opt,
                  style: GoogleFonts.outfit(
                    color: isOpt ? chipColor : Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
