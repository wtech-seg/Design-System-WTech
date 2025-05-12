import 'package:flutter/material.dart';
import '../design_system/components/blocking_modal.dart';

Future<T?> showWtechBlockingModal<T>(
  BuildContext context, {
  required String message,
}) => showDialog<T>(
  context: context,
  barrierDismissible: false,
  builder: (_) => WtechBlockingModal(message: message),
);
