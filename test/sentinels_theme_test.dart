import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

void main() {
  test('light and dark themes expose expected primary color', () {
    final ThemeData light = SentinelsTheme.light();
    final ThemeData dark = SentinelsTheme.dark();

    expect(light.colorScheme.primary, SentinelsColors.primary);
    expect(dark.colorScheme.primary, SentinelsColors.primary);
  });

  test('admin theme extension is available in both modes', () {
    final ThemeData light = SentinelsTheme.light();
    final ThemeData dark = SentinelsTheme.dark();

    expect(light.sentinelsAdminTheme.leftBarBackground, isNotNull);
    expect(dark.sentinelsAdminTheme.leftBarBackground, isNotNull);
  });
}
