import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class DialogoCompletoWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const DialogoCompletoWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<DialogoCompletoWidget> createState() =>
      _DialogoCompletoWidgetState();
}

class _DialogoCompletoWidgetState
    extends ConsumerState<DialogoCompletoWidget> {
  bool _resolved = false;

  List<Map<String, dynamic>> get _intercambios {
    final raw = widget.ejercicio['intercambios'];
    if (raw == null) return [];
    return (raw as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  void _speak(String text) =>
      ref.read(speechServiceProvider).speak(text);

  void _confirm() {
    if (_resolved) return;
    setState(() => _resolved = true);
    widget.onResuelto();
  }

  @override
  Widget build(BuildContext context) {
    final intercambios = _intercambios;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Burbujas de conversación
        for (final exchange in intercambios) ...[
          _ClienteBubble(
            text: exchange['cliente']?.toString() ?? '',
            traduccion: exchange['traduccion_cliente']?.toString(),
            onTap: () => _speak(exchange['cliente']?.toString() ?? ''),
          ),
          const SizedBox(height: 12),
          _BarberoBubble(
            text: exchange['tu_respuesta']?.toString() ?? '',
            traduccion: exchange['traduccion_respuesta']?.toString(),
            onTap: () =>
                _speak(exchange['tu_respuesta']?.toString() ?? ''),
          ),
          const SizedBox(height: 20),
        ],

        // Hint
        Text(
          'Toca cualquier frase para escucharla 🔊',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: Colors.white24,
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 20),

        // Botón confirmar
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _resolved ? null : _confirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: _resolved
                  ? AppColors.success.withValues(alpha: 0.2)
                  : AppColors.primary.withValues(alpha: 0.12),
              foregroundColor:
                  _resolved ? AppColors.success : AppColors.primary,
              elevation: 0,
              side: BorderSide(
                color: _resolved ? AppColors.success : AppColors.primary,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_resolved) ...[
                  const Icon(Icons.check_rounded, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  _resolved ? '¡Diálogo aprendido!' : '¡Ya lo tengo!',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Burbuja del cliente ──────────────────────────────────────────────────────
class _ClienteBubble extends StatelessWidget {
  final String text;
  final String? traduccion;
  final VoidCallback onTap;

  const _ClienteBubble({
    required this.text,
    required this.onTap,
    this.traduccion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.teal.withValues(alpha: 0.2),
            shape: BoxShape.circle,
            border:
                Border.all(color: AppColors.teal.withValues(alpha: 0.4)),
          ),
          child: const Center(
            child: Text('👤', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.teal.withValues(alpha: 0.1),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(
                        color: AppColors.teal.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.volume_up_rounded,
                        color: AppColors.teal.withValues(alpha: 0.5),
                        size: 16,
                      ),
                    ],
                  ),
                ),
                if (traduccion != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 4),
                    child: Text(
                      traduccion!,
                      style: GoogleFonts.outfit(
                          color: Colors.white38, fontSize: 11),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 46),
      ],
    );
  }
}

// ── Burbuja del barbero ──────────────────────────────────────────────────────
class _BarberoBubble extends StatelessWidget {
  final String text;
  final String? traduccion;
  final VoidCallback onTap;

  const _BarberoBubble({
    required this.text,
    required this.onTap,
    this.traduccion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 46),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.volume_up_rounded,
                        color: AppColors.primary.withValues(alpha: 0.5),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          text,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (traduccion != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 4),
                    child: Text(
                      traduccion!,
                      style: GoogleFonts.outfit(
                        color: AppColors.primary.withValues(alpha: 0.55),
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.4)),
          ),
          child: const Center(
            child: Text('💈', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
