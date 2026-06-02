import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/section.dart';
import '../models/lesson.dart';
import '../providers/auth_provider.dart';
import '../providers/progress_provider.dart';
import '../widgets/lesson_card.dart';
import 'exercise_screen.dart';

class SectionScreen extends ConsumerStatefulWidget {
  final AppSection section;

  const SectionScreen({super.key, required this.section});

  @override
  ConsumerState<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends ConsumerState<SectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  final _levels = Level.values;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: _levels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  void _onLessonTap(BuildContext context, Lesson lesson, Set<int> completed) {
    if (lesson.isPremiumLocked) {
      final user = ref.read(currentUserProvider);
      if (user == null || user.isAnonymous) {
        _showCreateAccountModal(context);
      } else {
        _showPremiumDialog(context, lesson);
      }
      return;
    }

    final levelLessons = widget.section.lessonsForLevel(lesson.level);
    final index = levelLessons.indexOf(lesson);

    // Secuencial dentro del nivel A1
    if (lesson.isFree && index > 0) {
      final prev = levelLessons[index - 1];
      if (!completed.contains(prev.id)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Completa la lección anterior primero',
              style: GoogleFonts.outfit(),
            ),
            backgroundColor: AppColors.surface,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }

    if (lesson.exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lección próximamente', style: GoogleFonts.outfit()),
          backgroundColor: AppColors.surface,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ExerciseScreen(
          lesson: lesson,
          sectionId: widget.section.id,
        ),
      ),
    );
  }

  void _showCreateAccountModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
              color: AppColors.primary.withValues(alpha: 0.45), width: 1.5),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🔓', style: TextStyle(fontSize: 52)),
            const SizedBox(height: 14),
            Text(
              '¡CREA TU CUENTA!',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Regístrate gratis para guardar tu progreso y desbloquear más lecciones.',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: Colors.white60, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline,
                      color: AppColors.primary, size: 15),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      'Tu progreso actual se conservará',
                      style: GoogleFonts.outfit(
                          color: AppColors.primary, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonCyan,
                  foregroundColor: AppColors.buttonCyanText,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  elevation: 6,
                  shadowColor: AppColors.buttonCyan.withValues(alpha: 0.4),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'CREAR CUENTA GRATIS',
                  style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w900, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white70,
                  side: const BorderSide(color: Colors.white24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'YA TENGO CUENTA · INICIAR SESIÓN',
                  style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Seguir explorando sin cuenta',
                style: GoogleFonts.outfit(color: Colors.white30, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPremiumDialog(BuildContext context, Lesson lesson) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: AppColors.gold.withValues(alpha:0.4), width: 1.5),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('👑', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 16),
            Text(
              'CONTENIDO PRO',
              style: GoogleFonts.outfit(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '"${lesson.title}" es parte del plan Pro.\nDesbloquea las 22 lecciones avanzadas.',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: Colors.white60, fontSize: 14),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'PRÓXIMAMENTE',
                  style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w900, fontSize: 15),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Seguir con A1 gratis',
                  style: GoogleFonts.outfit(color: Colors.white38)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = ref.watch(progressProvider);
    final completed = progress.forSection(widget.section.id);
    final total = widget.section.totalLessons;
    final done = widget.section.completedCount(completed);

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
                      widget.section.emoji,
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.section.name.toUpperCase(),
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Text(
                      '$done/$total',
                      style: GoogleFonts.outfit(
                        color: widget.section.accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // — Progress bar —
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tu progreso · ${(widget.section.progressRatio(completed) * 100).round()}%',
                      style: GoogleFonts.outfit(
                          color: Colors.white38, fontSize: 11),
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: widget.section.progressRatio(completed),
                        backgroundColor: Colors.white.withValues(alpha:0.08),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            widget.section.accentColor),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // — Tabs A1 / A2 / B1 / B2 —
              TabBar(
                controller: _tabCtrl,
                tabs: _levels.map((l) {
                  final levelDone = widget.section
                      .lessonsForLevel(l)
                      .where((lesson) => completed.contains(lesson.id))
                      .length;
                  final levelTotal =
                      widget.section.lessonsForLevel(l).length;
                  return Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l.name,
                            style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w800, fontSize: 13)),
                        Text('$levelDone/$levelTotal',
                            style: GoogleFonts.outfit(fontSize: 9)),
                      ],
                    ),
                  );
                }).toList(),
                labelColor: widget.section.accentColor,
                unselectedLabelColor: Colors.white30,
                indicatorColor: widget.section.accentColor,
                dividerColor: Colors.white12,
              ),

              // — Lesson lists per level —
              Expanded(
                child: TabBarView(
                  controller: _tabCtrl,
                  children: _levels.map((level) {
                    final lessons = widget.section.lessonsForLevel(level);
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      itemCount: lessons.length,
                      itemBuilder: (context, idx) {
                        final lesson = lessons[idx];
                        final isCompleted = completed.contains(lesson.id);
                        final isPremiumLocked = !lesson.isFree;

                        // Dentro de A1: desbloqueo secuencial
                        bool isLocked = false;
                        if (lesson.isFree && idx > 0) {
                          final prev = lessons[idx - 1];
                          isLocked = !completed.contains(prev.id);
                        }

                        return LessonCard(
                          lesson: lesson,
                          index: idx,
                          isCompleted: isCompleted,
                          isLocked: isLocked,
                          isPremiumLocked: isPremiumLocked,
                          onTap: () =>
                              _onLessonTap(context, lesson, completed),
                        );
                      },
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
