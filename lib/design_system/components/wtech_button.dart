import 'package:flutter/material.dart';
import '../design_system.dart';

class WtechButton extends StatelessWidget {
  final String label;
  final Color color;
  final double minWidth;
  final double minHeight;
  final double maxWidth;
  final double maxHeight;
  final VoidCallback onPressed;

  const WtechButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = WtechColors.secondary,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label, style: WtechTextStyles.button),
      ),
    );
  }
}
