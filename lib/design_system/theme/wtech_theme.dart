import 'package:flutter/material.dart';
import '../design_system.dart';
import 'wtech_colors.dart';
import 'wtech_text_styles.dart';

class WtechTheme {
  static final ThemeData defaultTheme = ThemeData(
    primaryColor: WtechColors.primary,
    scaffoldBackgroundColor: WtechColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: WtechColors.primary,
      foregroundColor: WtechColors.textWhite,
    ),
    textTheme: const TextTheme(
      bodyMedium: WtechTextStyles.body,
      titleLarge: WtechTextStyles.headline,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WtechColors.primary,
        textStyle: WtechTextStyles.button,
      ),
    ),
  );
}
