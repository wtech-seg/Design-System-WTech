import 'package:flutter/material.dart';
import '../design_system.dart';
import 'wtech_colors.dart';
import 'wtech_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class WtechTheme {
  static final ThemeData defaultTheme = ThemeData(
    primaryColor: WtechColors.primary,
    scaffoldBackgroundColor: WtechColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: WtechColors.primary,
      foregroundColor: WtechColors.textWhite,
    ),
    textTheme: GoogleFonts.mPlus1pTextTheme(
      const TextTheme(
        bodyMedium: WtechTextStyles.body,
        titleLarge: WtechTextStyles.headline,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Color(
          0xFF31456A,
        ), // Cor definida para os hints dos TextFormField
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WtechColors.primary,
        textStyle: WtechTextStyles.button,
      ),
    ),
  );
}
