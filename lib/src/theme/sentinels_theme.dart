import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/src/theme/extensions/sentinels_admin_theme.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_colors.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_elevation.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_radius.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_typography.dart';

class SentinelsTheme {
  const SentinelsTheme._();

  static ThemeData light({
    SentinelsPalette palette = SentinelsPalette.standard,
  }) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: palette.primary,
      brightness: Brightness.light,
      primary: palette.primary,
      secondary: palette.secondary,
      surface: SentinelsColors.surfaceLight,
      error: SentinelsColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: SentinelsColors.backgroundLight,
      colorScheme: scheme,
      primaryColor: scheme.primary,
      textTheme: SentinelsTypography.buildTextTheme(
        SentinelsColors.textPrimaryLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: SentinelsColors.surfaceLight,
        foregroundColor: SentinelsColors.textPrimaryLight,
        elevation: SentinelsElevation.none,
        scrolledUnderElevation: SentinelsElevation.none,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: SentinelsColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        elevation: SentinelsElevation.xs,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.md),
          side: const BorderSide(color: SentinelsColors.borderLight),
        ),
      ),
      dividerColor: SentinelsColors.borderLight,
      dividerTheme: const DividerThemeData(
        color: SentinelsColors.borderLight,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: SentinelsColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: const BorderSide(color: SentinelsColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: const BorderSide(color: SentinelsColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: BorderSide(color: scheme.primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: SentinelsColors.onPrimary,
          elevation: SentinelsElevation.sm,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          ),
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[SentinelsAdminTheme.light],
    );
  }

  static ThemeData dark({
    SentinelsPalette palette = SentinelsPalette.standard,
  }) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: palette.primary,
      brightness: Brightness.dark,
      primary: palette.primary,
      secondary: palette.secondary,
      surface: SentinelsColors.surfaceDark,
      error: SentinelsColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: SentinelsColors.backgroundDark,
      colorScheme: scheme,
      primaryColor: scheme.primary,
      textTheme: SentinelsTypography.buildTextTheme(
        SentinelsColors.textPrimaryDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: SentinelsColors.surfaceDark,
        foregroundColor: SentinelsColors.textPrimaryDark,
        elevation: SentinelsElevation.none,
        scrolledUnderElevation: SentinelsElevation.none,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: SentinelsColors.surfaceDark,
        surfaceTintColor: Colors.transparent,
        elevation: SentinelsElevation.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.md),
          side: const BorderSide(color: SentinelsColors.borderDark),
        ),
      ),
      dividerColor: SentinelsColors.borderDark,
      dividerTheme: const DividerThemeData(
        color: SentinelsColors.borderDark,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: SentinelsColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: const BorderSide(color: SentinelsColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: const BorderSide(color: SentinelsColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          borderSide: BorderSide(color: scheme.primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: SentinelsColors.onPrimary,
          elevation: SentinelsElevation.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SentinelsRadius.sm),
          ),
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[SentinelsAdminTheme.dark],
    );
  }
}

extension SentinelsAdminThemeX on ThemeData {
  SentinelsAdminTheme get sentinelsAdminTheme =>
      extension<SentinelsAdminTheme>() ?? SentinelsAdminTheme.light;
}
