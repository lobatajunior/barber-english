import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class DialogoWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const DialogoWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<DialogoWidget> createState() => _DialogoWidgetState();
}

class _DialogoWidgetState extends ConsumerState<DialogoWidget> {
  String? _selected;
  bool _resolved = false;
  late List<String> _shuffled;

  String get _correcta => widget.ejercicio['respuesta_correcta'].toString();

  @override
  void initState() {
    super.initState();
    _shuffled = List<String>.from(widget.ejercicio['opciones_barbero'])..shuffle();
  }

  void _select(String opt) {
    if (_resolved) return;
    final isCorrect = opt == _correcta;
    setState(() => _selected = opt);
    if (isCorrect) {
      setState(() => _resolved = true);
      ref.read(speechServiceProvider).speak(_correcta);
      widget.onResuelto();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Etiqueta "tu turno" ──────────────────────────────────────────────
        Row(
          children: [
            const Icon(Icons.chevron_right_rounded, color: AppColors.primary, size: 18),
            const SizedBox(width: 4),
            Text(
              'Elige tu respuesta:',
              style: GoogleFonts.outfit(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Opciones de respuesta ────────────────────────────────────────────
        ..._shuffled.map((opt) {
          final isSelected = _selected == opt;
          final isCorrect = opt == _correcta;

          final Color borderColor;
          if (!isSelected) {
            borderColor = Colors.white24;
          } else if (_resolved && isCorrect) {
            borderColor = AppColors.success;
          } else if (isSelected && !_resolved) {
            borderColor = AppColors.primary;
          } else {
            borderColor = AppColors.error;
          }

          return GestureDetector(
            onTap: _resolved ? null : () => _select(opt),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isSelected
                    ? borderColor.withValues(alpha: 0.12)
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor, width: 2),
              ),
              child: Row(
                children: [
                  const Text('💇', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      opt,
                      style: GoogleFonts.outfit(
                        color: isSelected ? borderColor : Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (isSelected && _resolved && isCorrect)
                    const Icon(Icons.check_circle_rounded,
                        color: AppColors.success, size: 20),
                ],
              ),
            ),
          );
        }),

      ],
    );
  }
}
