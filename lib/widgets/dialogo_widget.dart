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
  String get _clienteDice => widget.ejercicio['cliente_dice']?.toString() ?? '';
  String? get _traduccionCliente => widget.ejercicio['traduccion_cliente']?.toString();
  String? get _traduccionRespuesta => widget.ejercicio['traduccion_respuesta']?.toString();

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
        // ── Burbuja del cliente ──────────────────────────────────────────────
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.teal.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.teal.withValues(alpha: 0.4)),
              ),
              child: const Center(
                child: Text('👤', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.teal.withValues(alpha: 0.1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border.all(color: AppColors.teal.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      _clienteDice,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (_traduccionCliente != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 4),
                      child: Text(
                        _traduccionCliente!,
                        style: GoogleFonts.outfit(color: Colors.white38, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

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

        // ── Traducción de la respuesta correcta ─────────────────────────────
        if (_resolved && _traduccionRespuesta != null) ...[
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
            ),
            child: Text(
              _traduccionRespuesta!,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.success,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
