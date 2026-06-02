import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final int index;
  final bool isCompleted;
  final bool isLocked;
  final bool isPremiumLocked;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.index,
    required this.isCompleted,
    required this.isLocked,
    required this.isPremiumLocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color iconBg;
    Color iconColor;

    if (isPremiumLocked) {
      borderColor = AppColors.gold.withValues(alpha:0.4);
      iconBg = AppColors.gold.withValues(alpha:0.1);
      iconColor = AppColors.gold;
    } else if (isCompleted) {
      borderColor = AppColors.success.withValues(alpha:0.5);
      iconBg = AppColors.success.withValues(alpha:0.15);
      iconColor = AppColors.success;
    } else if (isLocked) {
      borderColor = Colors.white12;
      iconBg = Colors.white10;
      iconColor = Colors.white30;
    } else {
      borderColor = lesson.level.color.withValues(alpha:0.4);
      iconBg = lesson.level.color.withValues(alpha:0.12);
      iconColor = lesson.level.color;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: isLocked && !isPremiumLocked
              ? Colors.white.withValues(alpha:0.03)
              : AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            // — Icono / emoji —
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: isPremiumLocked
                    ? Icon(Icons.lock_rounded, color: AppColors.gold, size: 22)
                    : isLocked
                        ? Icon(Icons.lock_rounded, color: Colors.white30, size: 22)
                        : isCompleted
                            ? Icon(Icons.check_circle_rounded,
                                color: AppColors.success, size: 24)
                            : Text(lesson.emoji,
                                style: const TextStyle(fontSize: 22)),
              ),
            ),
            const SizedBox(width: 14),

            // — Texto —
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'LECCIÓN ${index + 1}',
                        style: GoogleFonts.outfit(
                          color: isLocked ? Colors.white30 : iconColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: lesson.level.color.withValues(alpha:0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          lesson.level.name,
                          style: GoogleFonts.outfit(
                            color: lesson.level.color,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lesson.title,
                    style: GoogleFonts.outfit(
                      color: (isLocked && !isPremiumLocked)
                          ? Colors.white30
                          : Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    lesson.description,
                    style: GoogleFonts.outfit(
                      color: (isLocked && !isPremiumLocked)
                          ? Colors.white.withValues(alpha: 0.20)
                          : Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                  if (lesson.exerciseCount > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${lesson.exerciseCount} ejercicios',
                      style: GoogleFonts.outfit(
                          color: iconColor.withValues(alpha:0.7), fontSize: 11),
                    ),
                  ],
                ],
              ),
            ),

            // — Flecha / badge —
            if (isPremiumLocked)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha:0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: AppColors.gold.withValues(alpha:0.4), width: 1),
                ),
                child: Text(
                  'PRO',
                  style: GoogleFonts.outfit(
                      color: AppColors.gold,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                ),
              )
            else if (isCompleted)
              Icon(Icons.star_rounded, color: AppColors.success, size: 24)
            else if (!isLocked)
              Icon(Icons.arrow_forward_ios,
                  color: Colors.white30, size: 14),
          ],
        ),
      ),
    );
  }
}
