import 'package:flutter/material.dart';
import 'package:wtech_design_system/design_system/components/dialogs/wtech_dialog_base.dart';

class WtechLoadingDialog extends StatelessWidget {
  final String message;

  const WtechLoadingDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: WtechDialogBase.shape,
      backgroundColor: WtechDialogBase.background,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 220),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              const CircularProgressIndicator(),
              const SizedBox(height: 14),
              Text(
                message,
                style: WtechDialogBase.bodyStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper padrão (mesmo nome que você já usa, opcionalmente manter).
void showLoadingDialog(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: WtechDialogBase.barrier,
    builder: (_) => WtechLoadingDialog(message: message),
  );
}

/// Helper com Future (caso queira usar/aguardar programaticamente)
Future<void> showWtechLoading(BuildContext context, {required String message}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: WtechDialogBase.barrier,
    builder: (_) => WtechLoadingDialog(message: message),
  );
}
