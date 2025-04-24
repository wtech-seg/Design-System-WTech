import 'package:flutter/material.dart';
import '../design_system.dart'; // Ajuste o import conforme o caminho do seu design_system

/// WtechSnackBar oferece um metodo estático para exibir SnackBars consistentes com o design system,
/// permitindo customizar a cor de fundo.
class WtechSnackBar {
  /// Exibe uma SnackBar flutuante estilizada.
  ///
  /// [context]: BuildContext onde a SnackBar será exibida.
  /// [message]: Texto da mensagem principal.
  /// [backgroundColor]: Cor de fundo opcional (default: WtechColors.primary).
  /// [actionLabel]: Texto do botão de ação (opcional).
  /// [onAction]: Callback quando o usuário clicar na ação (opcional).
  static void show(
      BuildContext context,
      String message, {
        Color? backgroundColor,
        String? actionLabel,
        VoidCallback? onAction,
      }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.blueGrey,
          fontSize: 14,
        ),
      ),
      backgroundColor: backgroundColor ?? WtechColors.primary,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 6,
      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(
        label: actionLabel,
        onPressed: onAction,
        textColor: WtechColors.textWhite,
      )
          : null,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
