import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/src/theme/tokens/sentinels_colors.dart';

class SentinelsThemeController extends ChangeNotifier {
  SentinelsThemeController({
    ThemeMode initialMode = ThemeMode.light,
    SentinelsPalette initialPalette = SentinelsPalette.standard,
  })  : _themeMode = initialMode,
        _palette = initialPalette;

  ThemeMode _themeMode;
  SentinelsPalette _palette;

  ThemeMode get themeMode => _themeMode;
  SentinelsPalette get palette => _palette;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) {
      return;
    }
    _themeMode = mode;
    notifyListeners();
  }

  void toggleThemeMode() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setPalette(SentinelsPalette newPalette) {
    if (_palette == newPalette) {
      return;
    }
    _palette = newPalette;
    notifyListeners();
  }
}
