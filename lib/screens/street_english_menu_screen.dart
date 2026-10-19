import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/section.dart';
import '../data/street_english_vocab_lessons.dart';
import '../providers/progress_provider.dart';
import 'section_screen.dart';

/// Submenú de Street English: cuadrícula 2x3 de subsecciones.
/// GRAMMAR abre las lecciones de streetEnglishLessons (la sección recibida),
/// VOCAB abre los 20 bloques de parejas; el resto muestra "Próximamente".
class StreetEnglishMenuScreen extends ConsumerWidget {
  final AppSection section;

  const StreetEnglishMenuScreen({super.key, required this.section});

  // Progreso propio: users/{uid}/progress/street_english_vocab
  static const vocabSection = AppSection(
    id: 'street_english_vocab',
    name: 'Vocab',
    subtitle: 'Vocabulario de Street English',
    emoji: '🃏',
    accentColor: AppColors.neon,
    lessons: streetEnglishVocabLessons,
  );

  List<({String emoji, String name, AppSection? target})> get _subsections => [
        (emoji: '📖', name: 'GRAMMAR', target: section),
        (emoji: '🃏', name: 'VOCAB', target: vocabSection),
        (emoji: '🎉', name: 'SOCIAL', target: null),
        (emoji: '✈️', name: 'TRAVEL', target: null),
        (emoji: '💘', name: 'FLIRT', target: null),
        (emoji: '🌤️', name: 'SMALL TALK', target: null),
      ];

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Próximamente', style: GoogleFonts.outfit()),
        backgroundColor: AppColors.surface,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Scaffold(
      body: Container(
        decoration: AppTheme.backgroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              // — Header —
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      section.emoji,
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        section.name.toUpperCase(),
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // — Grid 2x3 —
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.05,
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  children: _subsections.map((sub) {
                    final target = sub.target;
                    final done = target == null
                        ? 0
                        : target.completedCount(progress.forSection(target.id));
                    return _SubsectionCell(
                      emoji: sub.emoji,
                      name: sub.name,
                      hasContent: target != null,
                      progressLabel: target == null
                          ? 'Próximamente'
                          : '$done/${target.totalLessons}',
                      onTap: target == null
                          ? () => _showComingSoon(context)
                          : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SectionScreen(section: target),
                                ),
                              ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Subsection cell ──────────────────────────────────────────────────────────

class _SubsectionCell extends StatelessWidget {
  final String emoji;
  final String name;
  final bool hasContent;
  final String progressLabel;
  final VoidCallback onTap;

  const _SubsectionCell({
    required this.emoji,
    required this.name,
    required this.hasContent,
    required this.progressLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF111111),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: hasContent
                  ? AppColors.neon.withValues(alpha: 0.45)
                  : Colors.white.withValues(alpha: 0.12),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 10),
              Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                progressLabel,
                style: GoogleFonts.outfit(
                  color: hasContent ? AppColors.neon : Colors.white30,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
