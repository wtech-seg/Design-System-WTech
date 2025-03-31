import 'package:flutter/material.dart';
import '../design_system.dart';

class WtechMobileButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const WtechMobileButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 356,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: WtechColors.secondary,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(label, style: WtechTextStyles.button),
      ),
    );
  }
}
