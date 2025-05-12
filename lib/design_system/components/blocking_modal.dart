import 'package:flutter/material.dart';
import '../theme/wtech_colors.dart';
import '../theme/wtech_text_styles.dart';

class WtechBlockingModal extends StatelessWidget {
  final String message;

  const WtechBlockingModal({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: WtechColors.backgroundCard,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: WtechColors.primary),
              const SizedBox(height: 12),
              Text(
                message,
                style: WtechTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
