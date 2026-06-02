import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../providers/progress_provider.dart';

class ParejasWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;

  const ParejasWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
  });

  @override
  ConsumerState<ParejasWidget> createState() => _ParejasWidgetState();
}

class _ParejasWidgetState extends ConsumerState<ParejasWidget> {
  String? _selectedEn;
  String? _selectedEs;
  final Set<String> _matched = {};
  late List<String> _shuffledEs;

  @override
  void initState() {
    super.initState();
    _shuffledEs = List<String>.from(widget.ejercicio['parejas_espanol'])
      ..shuffle();
  }

  List<String> get _english =>
      List<String>.from(widget.ejercicio['parejas_ingles']);

  void _onTapEn(String word) {
    if (_matched.contains(word)) return;
    setState(() => _selectedEn = word);
    ref.read(speechServiceProvider).speak(word);
    _tryMatch();
  }

  void _onTapEs(String word) {
    if (_matched.contains(word)) return;
    setState(() => _selectedEs = word);
    _tryMatch();
  }

  void _tryMatch() {
    if (_selectedEn == null || _selectedEs == null) return;

    final idxEn = _english.indexOf(_selectedEn!);
    final correctEs =
        (widget.ejercicio['parejas_espanol'] as List)[idxEn].toString();

    if (_selectedEs == correctEs) {
      _matched.addAll([_selectedEn!, _selectedEs!]);
      _selectedEn = null;
      _selectedEs = null;
      if (_matched.length == _english.length * 2) {
        widget.onResuelto();
      }
    } else {
      final en = _selectedEn;
      final es = _selectedEs;
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() {
            if (_selectedEn == en) _selectedEn = null;
            if (_selectedEs == es) _selectedEs = null;
          });
        }
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: _english
              .map((w) => _WordCard(
                    word: w,
                    isSelected: _selectedEn == w,
                    isMatched: _matched.contains(w),
                    onTap: () => _onTapEn(w),
                  ))
              .toList(),
        ),
        Column(
          children: _shuffledEs
              .map((w) => _WordCard(
                    word: w,
                    isSelected: _selectedEs == w,
                    isMatched: _matched.contains(w),
                    onTap: () => _onTapEs(w),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _WordCard extends StatelessWidget {
  final String word;
  final bool isSelected;
  final bool isMatched;
  final VoidCallback onTap;

  const _WordCard({
    required this.word,
    required this.isSelected,
    required this.isMatched,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isMatched
        ? AppColors.success
        : isSelected
            ? AppColors.primary
            : Colors.white24;

    return GestureDetector(
      onTap: isMatched ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 7),
        width: 145,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: (isMatched || isSelected)
              ? color.withValues(alpha:0.12)
              : Colors.white.withValues(alpha:0.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color, width: 2),
        ),
        child: Text(
          word,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: (isMatched || isSelected) ? color : Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
