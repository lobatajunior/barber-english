import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- FONDOS ---
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF121212);
  static const Color card = Color(0xFF1C1C1C);

  // Primary — Verde
  static const Color primary = Color(0xFF00C853);
  static const Color primaryLight = Color(0xFF69F0AE);
  static const Color neon = Color(0xFF00E676);

  // Accent
  static const Color teal = Color(0xFF00BCD4);
  static const Color tealLight = Color(0xFF80DEEA);

  // Premium
  static const Color gold = Color(0xFFFFD600);
  static const Color goldDark = Color(0xFFFF8F00);

  // Button — VERDE en lugar de cyan
  static const Color buttonCyan = Color(0xFF00C853);
  static const Color buttonCyanText = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF00C853);
  static const Color error = Color(0xFFFF5252);
  static const Color warning = Color(0xFFFFAB40);

  // Borders
  static const Color border = Color(0xFF333333);
  static const Color borderLight = Color(0xFF444444);

  // Text
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textMuted = Color(0xFF757575);
  static const Color textDisabled = Color(0xFF616161);

  // Gradients — sin degradados en tarjetas
  static const List<Color> backgroundGradient = [
    Color(0xFF000000),
    Color(0xFF121212),
    Color(0xFF000000),
  ];
}
