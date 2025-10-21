import 'package:flutter/material.dart';
import 'wtech_dialog_base.dart';

class WtechConfirmDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? content;
  final String confirmLabel;
  final String cancelLabel;
  final bool showCancel;
  final bool destructive;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const WtechConfirmDialog({
    super.key,
    this.title,
    this.message,
    this.content,
    this.confirmLabel = 'Confirmar',
    this.cancelLabel = 'Cancelar',
    this.showCancel = true,
    this.destructive = false,
    this.leadingIcon,
    this.leadingIconColor,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? builtContent =
        content ??
        (message != null
            ? Text(message!, style: WtechDialogBase.bodyStyle)
            : null);

    return AlertDialog(
      backgroundColor: WtechDialogBase.background,
      shape: WtechDialogBase.shape,
      titlePadding: WtechDialogBase.titlePadding,
      contentPadding: WtechDialogBase.contentPadding,
      actionsPadding: WtechDialogBase.actionsPadding,
      title:
          (title != null || leadingIcon != null)
              ? Row(
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 22, color: leadingIconColor),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      title ?? '',
                      style: WtechDialogBase.titleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
              : null,
      content: builtContent,
      actions: [
        if (showCancel)
          TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.pop(context, false);
            },
            style: WtechDialogBase.textButtonStyle,
            child: Text(cancelLabel),
          ),
        FilledButton(
          onPressed: () {
            onConfirm?.call();
            Navigator.pop(context, true);
          },
          style: WtechDialogBase.filledButton(destructive: destructive),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}

Future<bool> showWtechConfirm(
  BuildContext context, {
  String? title,
  String? message,
  Widget? content,
  String confirmLabel = 'Confirmar',
  String cancelLabel = 'Cancelar',
  bool showCancel = true,
  bool barrierDismissible = false,
  bool destructive = false,
  IconData? leadingIcon,
  Color? leadingIconColor,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: WtechDialogBase.barrier,
    builder:
        (_) => WtechConfirmDialog(
          title: title,
          message: message,
          content: content,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          showCancel: showCancel,
          destructive: destructive,
          leadingIcon: leadingIcon,
          leadingIconColor: leadingIconColor,
          onConfirm: onConfirm,
          onCancel: onCancel,
        ),
  );
  return result ?? false;
}
