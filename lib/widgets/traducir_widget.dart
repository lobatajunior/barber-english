import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class TraducirWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const TraducirWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<TraducirWidget> createState() => _TraducirWidgetState();
}

class _TraducirWidgetState extends ConsumerState<TraducirWidget> {
  late List<String> _bank;
  final List<String> _placed = [];
  bool _resolved = false;
  bool _wrongFlash = false;

  String get _correcta => widget.ejercicio['respuesta_correcta'].toString();
  String get _fraseEspanol => widget.ejercicio['frase_espanol']?.toString() ?? '';
  String? get _fonetica => widget.ejercicio['fonetica']?.toString();

  @override
  void initState() {
    super.initState();
    _bank = _correcta.split(' ')..shuffle();
  }

  void _placeWord(String word) {
    if (_resolved || _wrongFlash) return;
    final idx = _bank.indexOf(word);
    setState(() {
      _bank.removeAt(idx);
      _placed.add(word);
    });
    if (_bank.isEmpty) _checkAnswer();
  }

  void _returnWord(int idx) {
    if (_resolved || _wrongFlash) return;
    final word = _placed[idx];
    setState(() {
      _placed.removeAt(idx);
      _bank.add(word);
    });
  }

  void _checkAnswer() {
    if (_placed.join(' ') == _correcta) {
      setState(() => _resolved = true);
      ref.read(speechServiceProvider).speak(_correcta);
      widget.onResuelto();
    } else {
      setState(() => _wrongFlash = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _bank = [..._placed, ..._bank]..shuffle();
            _placed.clear();
            _wrongFlash = false;
          });
        }
      });
    }
  }

  Color get _zoneColor =>
      _resolved ? AppColors.success : _wrongFlash ? AppColors.error : Colors.white24;

  Color get _chipColor =>
      _resolved ? AppColors.success : _wrongFlash ? AppColors.error : AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Frase en español ─────────────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.teal.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.teal.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              const Text('🇪🇸', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 8),
              Text(
                _fraseEspanol,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ── Zona de traducción ───────────────────────────────────────────────
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 64),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _resolved
                ? AppColors.success.withValues(alpha: 0.08)
                : _wrongFlash
                    ? AppColors.error.withValues(alpha: 0.08)
                    : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _zoneColor, width: 2),
          ),
          child: _placed.isEmpty
              ? Center(
                  child: Text(
                    'Construye la traducción aquí',
                    style: GoogleFonts.outfit(color: Colors.white30, fontSize: 13),
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _placed.asMap().entries.map((e) {
                    return GestureDetector(
                      onTap: (_resolved || _wrongFlash) ? null : () => _returnWord(e.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: _chipColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: _chipColor, width: 2),
                        ),
                        child: Text(
                          e.value,
                          style: GoogleFonts.outfit(
                            color: _chipColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),

        if (_resolved && _fonetica != null) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: Text(
              '[ $_fonetica ]',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],

        const SizedBox(height: 20),

        // ── Banco de palabras ────────────────────────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),
          child: _bank.isEmpty
              ? Center(
                  child: Text(
                    _resolved ? '✅ ¡Correcto!' : '⏳ Comprobando...',
                    style: GoogleFonts.outfit(
                      color: _resolved ? AppColors.success : Colors.white38,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _bank.map((word) {
                    return GestureDetector(
                      onTap: () => _placeWord(word),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white30, width: 1.5),
                        ),
                        child: Text(
                          word,
                          style: GoogleFonts.outfit(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
