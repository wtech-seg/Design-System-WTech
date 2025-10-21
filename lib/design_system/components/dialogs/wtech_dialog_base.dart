import 'package:flutter/material.dart';
import 'package:wtech_design_system/design_system/theme/wtech_colors.dart';
import 'package:wtech_design_system/design_system/theme/wtech_text_styles.dart';

/// Estilos compartilhados dos diálogos Wtech.
class WtechDialogBase {
  static const double radius = 16;
  static const EdgeInsets titlePadding = EdgeInsets.fromLTRB(24, 20, 24, 0);
  static const EdgeInsets contentPadding = EdgeInsets.fromLTRB(24, 12, 24, 0);
  static const EdgeInsets actionsPadding = EdgeInsets.fromLTRB(16, 8, 16, 16);

  static ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(radius),
  );

  static Color get background => WtechColors.background;

  static Color get barrier => Colors.black.withValues(alpha: 0.8);

  static TextStyle get titleStyle =>
      WtechTextStyles.headline.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get bodyStyle => WtechTextStyles.body;

  static ButtonStyle get textButtonStyle => TextButton.styleFrom(
    foregroundColor: WtechColors.primary,
    textStyle: WtechTextStyles.button,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static ButtonStyle filledButton({bool destructive = false}) =>
      FilledButton.styleFrom(
        backgroundColor: destructive ? Colors.red : WtechColors.primary,
        foregroundColor: WtechColors.textWhite,
        textStyle: WtechTextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      );
}
