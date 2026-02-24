import 'package:flutter/material.dart';

class SentinelsPalette {
  const SentinelsPalette({
    required this.name,
    required this.primary,
    required this.secondary,
  });

  final String name;
  final Color primary;
  final Color secondary;

  static const SentinelsPalette standard = SentinelsPalette(
    name: 'Standard (Corporate)',
    primary: Color(0xFF525CE5),
    secondary: Color(0xFF0BB197),
  );

  static const SentinelsPalette tacticalOlive = SentinelsPalette(
    name: 'Tactical Olive',
    primary: Color(0xFF4A5D23),
    secondary: Color(0xFFD2B48C),
  );

  static const SentinelsPalette stealthOps = SentinelsPalette(
    name: 'Stealth Ops',
    primary: Color(0xFF1C2833),
    secondary: Color(0xFF27AE60),
  );

  static const List<SentinelsPalette> values = [
    standard,
    tacticalOlive,
    stealthOps,
  ];
}

class SentinelsColors {
  const SentinelsColors._();

  // Brand foundation (Morvin first, Upzet secondary)
  static const Color primary = Color(0xFF525CE5);
  static const Color primaryContainer = Color(0xFFE0E3FF);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF0BB197);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // Semantic colors
  static const Color success = Color(0xFF23C58F);
  static const Color warning = Color(0xFFF0B24B);
  static const Color danger = Color(0xFFF14E4E);
  static const Color info = Color(0xFF5BA4E5);

  // Surfaces
  static const Color backgroundLight = Color(0xFFF1F5F7);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE8ECF1);
  static const Color textPrimaryLight = Color(0xFF2A323C);
  static const Color textMutedLight = Color(0xFF6C757D);

  static const Color backgroundDark = Color(0xFF1D222E);
  static const Color surfaceDark = Color(0xFF252B3B);
  static const Color borderDark = Color(0xFF37404A);
  static const Color textPrimaryDark = Color(0xFFF1F1F2);
  static const Color textMutedDark = Color(0xFF98A6AD);
}
