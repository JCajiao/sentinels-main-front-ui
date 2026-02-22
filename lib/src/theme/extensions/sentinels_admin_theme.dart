import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_colors.dart';

@immutable
class SentinelsAdminTheme extends ThemeExtension<SentinelsAdminTheme> {
  const SentinelsAdminTheme({
    required this.leftBarBackground,
    required this.leftBarOnBackground,
    required this.topBarBackground,
    required this.topBarOnBackground,
    required this.contentBackground,
    required this.contentOnBackground,
    required this.rightBarBackground,
    required this.rightBarOnBackground,
    required this.borderColor,
  });

  final Color leftBarBackground;
  final Color leftBarOnBackground;
  final Color topBarBackground;
  final Color topBarOnBackground;
  final Color contentBackground;
  final Color contentOnBackground;
  final Color rightBarBackground;
  final Color rightBarOnBackground;
  final Color borderColor;

  static const SentinelsAdminTheme light = SentinelsAdminTheme(
    leftBarBackground: Color(0xFFFFFFFF),
    leftBarOnBackground: SentinelsColors.textPrimaryLight,
    topBarBackground: Color(0xFFFFFFFF),
    topBarOnBackground: SentinelsColors.textPrimaryLight,
    contentBackground: SentinelsColors.backgroundLight,
    contentOnBackground: SentinelsColors.textPrimaryLight,
    rightBarBackground: Color(0xFFFFFFFF),
    rightBarOnBackground: SentinelsColors.textPrimaryLight,
    borderColor: SentinelsColors.borderLight,
  );

  static const SentinelsAdminTheme dark = SentinelsAdminTheme(
    leftBarBackground: Color(0xFF252B3B),
    leftBarOnBackground: SentinelsColors.textPrimaryDark,
    topBarBackground: Color(0xFF252B3B),
    topBarOnBackground: SentinelsColors.textPrimaryDark,
    contentBackground: SentinelsColors.backgroundDark,
    contentOnBackground: SentinelsColors.textPrimaryDark,
    rightBarBackground: Color(0xFF2A323C),
    rightBarOnBackground: SentinelsColors.textPrimaryDark,
    borderColor: SentinelsColors.borderDark,
  );

  @override
  SentinelsAdminTheme copyWith({
    Color? leftBarBackground,
    Color? leftBarOnBackground,
    Color? topBarBackground,
    Color? topBarOnBackground,
    Color? contentBackground,
    Color? contentOnBackground,
    Color? rightBarBackground,
    Color? rightBarOnBackground,
    Color? borderColor,
  }) {
    return SentinelsAdminTheme(
      leftBarBackground: leftBarBackground ?? this.leftBarBackground,
      leftBarOnBackground: leftBarOnBackground ?? this.leftBarOnBackground,
      topBarBackground: topBarBackground ?? this.topBarBackground,
      topBarOnBackground: topBarOnBackground ?? this.topBarOnBackground,
      contentBackground: contentBackground ?? this.contentBackground,
      contentOnBackground: contentOnBackground ?? this.contentOnBackground,
      rightBarBackground: rightBarBackground ?? this.rightBarBackground,
      rightBarOnBackground: rightBarOnBackground ?? this.rightBarOnBackground,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  SentinelsAdminTheme lerp(
    covariant ThemeExtension<SentinelsAdminTheme>? other,
    double t,
  ) {
    if (other is! SentinelsAdminTheme) {
      return this;
    }
    return SentinelsAdminTheme(
      leftBarBackground: Color.lerp(
        leftBarBackground,
        other.leftBarBackground,
        t,
      )!,
      leftBarOnBackground: Color.lerp(
        leftBarOnBackground,
        other.leftBarOnBackground,
        t,
      )!,
      topBarBackground: Color.lerp(
        topBarBackground,
        other.topBarBackground,
        t,
      )!,
      topBarOnBackground: Color.lerp(
        topBarOnBackground,
        other.topBarOnBackground,
        t,
      )!,
      contentBackground: Color.lerp(
        contentBackground,
        other.contentBackground,
        t,
      )!,
      contentOnBackground: Color.lerp(
        contentOnBackground,
        other.contentOnBackground,
        t,
      )!,
      rightBarBackground: Color.lerp(
        rightBarBackground,
        other.rightBarBackground,
        t,
      )!,
      rightBarOnBackground: Color.lerp(
        rightBarOnBackground,
        other.rightBarOnBackground,
        t,
      )!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}
