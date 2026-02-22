import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentinelsTypography {
  const SentinelsTypography._();

  static TextTheme buildTextTheme(Color textColor) {
    final TextTheme base = GoogleFonts.interTextTheme();
    return base.apply(bodyColor: textColor, displayColor: textColor);
  }
}
