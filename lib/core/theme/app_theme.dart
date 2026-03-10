import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryNavy = Color(0xFF0B1F2A);
  static const Color surfaceWhite = Colors.white;
  static const Color emeraldGreen = Color(0xFF1B5E20);
  static const Color lightGreenBg = Color(0xFFF1F8F1);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: surfaceWhite,
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
