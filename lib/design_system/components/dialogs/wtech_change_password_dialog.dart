import 'package:flutter/material.dart';
import 'wtech_dialog_base.dart';

/// Dialog para alteração de senha:
/// - Retorna a nova senha como String ao confirmar, ou null ao cancelar.
/// - Usa estilos padronizados do DS (WtechDialogBase).
class WtechChangePasswordDialog extends StatefulWidget {
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final String? initialValue; // se quiser sugerir algo (geralmente null)

  const WtechChangePasswordDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Atualizar senha',
    this.cancelLabel = 'Cancelar',
    this.initialValue,
  });

  /// Helper estático: abre o diálogo e retorna a nova senha (ou null).
  static Future<String?> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Atualizar senha',
    String cancelLabel = 'Cancelar',
    String? initialValue,
    bool barrierDismissible = false,
  }) async {
    return await showDialog<String?>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: WtechDialogBase.barrier,
      builder:
          (_) => WtechChangePasswordDialog(
            title: title,
            message: message,
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
            initialValue: initialValue,
          ),
    );
  }

  @override
  State<WtechChangePasswordDialog> createState() =>
      _WtechChangePasswordDialogState();
}

class _WtechChangePasswordDialogState extends State<WtechChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _passCtrl.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  String? _validatePass(String? v) {
    final s = (v ?? '').trim();
    if (s.isEmpty) return 'Informe a nova senha.';
    if (s.length < 6) return 'A senha deve ter ao menos 6 caracteres.';
    return null;
  }

  String? _validateConfirm(String? v) {
    final s = (v ?? '').trim();
    if (s.isEmpty) return 'Confirme a nova senha.';
    if (s != _passCtrl.text.trim()) return 'As senhas não coincidem.';
    return null;
  }

  void _submit() {
    setState(() => _error = null);
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;
    final newPass = _passCtrl.text.trim();
    if (newPass.isEmpty) return;
    Navigator.pop<String>(context, newPass);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: WtechDialogBase.background,
      shape: WtechDialogBase.shape,
      titlePadding: WtechDialogBase.titlePadding,
      contentPadding: WtechDialogBase.contentPadding,
      actionsPadding: WtechDialogBase.actionsPadding,
      title: Text(widget.title, style: WtechDialogBase.titleStyle),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.message, style: WtechDialogBase.bodyStyle),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passCtrl,
              obscureText: _obscure1,
              decoration: InputDecoration(
                labelText: 'Nova senha',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure1 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscure1 = !_obscure1),
                ),
              ),
              validator: _validatePass,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _confirmCtrl,
              obscureText: _obscure2,
              decoration: InputDecoration(
                labelText: 'Confirmar nova senha',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure2 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscure2 = !_obscure2),
                ),
              ),
              validator: _validateConfirm,
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: TextStyle(color: Colors.red.shade700)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop<String?>(context, null),
          style: WtechDialogBase.textButtonStyle,
          child: Text(widget.cancelLabel),
        ),
        FilledButton(
          onPressed: _submit,
          style: WtechDialogBase.filledButton(),
          child: Text(widget.confirmLabel),
        ),
      ],
    );
  }
}
