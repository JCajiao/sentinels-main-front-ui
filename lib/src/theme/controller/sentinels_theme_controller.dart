import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_colors.dart';

class SentinelsThemeController extends ChangeNotifier {
  SentinelsThemeController({
    ThemeMode initialMode = ThemeMode.light,
    Color initialSeedColor = SentinelsColors.primary,
  }) : _themeMode = initialMode,
       _seedColor = initialSeedColor;

  ThemeMode _themeMode;
  Color _seedColor;

  ThemeMode get themeMode => _themeMode;
  Color get seedColor => _seedColor;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) {
      return;
    }
    _themeMode = mode;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }

  void setSeedColor(Color color) {
    if (_seedColor == color) {
      return;
    }
    _seedColor = color;
    notifyListeners();
  }
}
