import 'package:flutter/material.dart';
import '../theme/wtech_colors.dart';

enum SnackBarType { success, error }

class WtechSnackBar {

  static void show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.error,
  }) {
    final isSuccess = type == SnackBarType.success;
    final bgColor =
        isSuccess ? WtechColors.greenSnackBar : WtechColors.redSnackBar;
    final icon = isSuccess ? Icons.check_circle_outline : Icons.error_outline;

    final snack = SnackBar(
      backgroundColor: bgColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Row(
        children: [
          Icon(icon, color: WtechColors.textDarkGray),
          const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: const TextStyle(color: WtechColors.textDarkGray)),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snack);
  }
}
