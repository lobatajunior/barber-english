import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class OpcionesWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const OpcionesWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<OpcionesWidget> createState() => _OpcionesWidgetState();
}

class _OpcionesWidgetState extends ConsumerState<OpcionesWidget> {
  String? _selected;
  bool _resolved = false;
  late List<String> _shuffled;

  @override
  void initState() {
    super.initState();
    _shuffled = List<String>.from(widget.ejercicio['opciones'])..shuffle();
  }

  void _select(String opt) {
    if (_resolved) return;
    final isCorrect = opt.toLowerCase() ==
        widget.ejercicio['respuesta_correcta'].toString().toLowerCase();
    setState(() {
      _selected = opt;
      if (isCorrect) {
        _resolved = true;
        widget.onResuelto();
      }
    });
    // Cancel any previous speech and speak the tapped option exactly once
    ref.read(speechServiceProvider).speak(opt);
  }

  @override
  Widget build(BuildContext context) {
    final correcta = widget.ejercicio['respuesta_correcta'].toString();
    final traduccion = widget.ejercicio['traduccion_pregunta']?.toString() ?? '';

    return Column(
      children: [
        Text(
          widget.ejercicio['pregunta'] ?? '',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (_resolved && traduccion.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.success.withValues(alpha:0.3)),
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
          ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: _shuffled.map((opt) {
            final isCorrect =
                opt.toLowerCase() == correcta.toLowerCase();
            final isSelected = _selected == opt;
            Color borderColor;
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
              onTap: () => _select(opt),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                    horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? borderColor.withValues(alpha:0.12)
                      : Colors.white.withValues(alpha:0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Text(
                  opt,
                  style: GoogleFonts.outfit(
                    color: isSelected ? borderColor : Colors.white70,
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
