import 'package:flutter/material.dart';
import 'lesson.dart';

class AppSection {
  final String id;
  final String name;
  final String subtitle;
  final String description;
  final String emoji;
  final Color accentColor;
  final List<Lesson> lessons;

  const AppSection({
    required this.id,
    required this.name,
    required this.subtitle,
    this.description = '',
    required this.emoji,
    required this.accentColor,
    required this.lessons,
  });

  List<Lesson> lessonsForLevel(Level level) =>
      lessons.where((l) => l.level == level).toList();

  int get totalLessons => lessons.length;

  int completedCount(Set<int> completed) =>
      lessons.where((l) => completed.contains(l.id)).length;

  double progressRatio(Set<int> completed) =>
      totalLessons == 0 ? 0 : completedCount(completed) / totalLessons;
}
