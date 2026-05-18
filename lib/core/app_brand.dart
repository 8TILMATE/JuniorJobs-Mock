import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBrand {
  const AppBrand._();

  static const Color background = Color(0xFF07111F);
  static const Color surface = Color(0xFF101722);
  static const Color surfaceMuted = Color(0xFF2B3441);
  static const Color primaryBlue = Color(0xFF0D56B3);
  static const Color brightBlue = Color(0xFF2595FF);
  static const Color softBlue = Color(0xFF8BCBFF);

  static String? get fontFamily => GoogleFonts.nunitoSans().fontFamily;

  static TextTheme textTheme(TextTheme base) {
    return GoogleFonts.nunitoSansTextTheme(
      base,
    ).apply(bodyColor: Colors.white, displayColor: Colors.white);
  }
}
