// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum Level { A1, A2, B1, B2 }

extension LevelX on Level {
  bool get isFree => this == Level.A1;

  Color get color {
    switch (this) {
      case Level.A1:
        return const Color(0xFF00C853);
      case Level.A2:
        return const Color(0xFF00BCD4);
      case Level.B1:
        return const Color(0xFF7C4DFF);
      case Level.B2:
        return const Color(0xFFFFD600);
    }
  }

  String get badge {
    switch (this) {
      case Level.A1:
        return 'A1 · GRATIS';
      case Level.A2:
        return 'A2 · PRO';
      case Level.B1:
        return 'B1 · PRO';
      case Level.B2:
        return 'B2 · PRO';
    }
  }
}

class Lesson {
  final int id;
  final String title;
  final String description;
  final String emoji;
  final Level level;
  final List<Map<String, dynamic>> exercises;
  final String? descripcionEs;
  final String? motivacionEs;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.level,
    this.exercises = const [],
    this.descripcionEs,
    this.motivacionEs,
  });

  bool get isFree => level == Level.A1;
  bool get isPremiumLocked => !isFree;
  int get exerciseCount => exercises.length;
}
