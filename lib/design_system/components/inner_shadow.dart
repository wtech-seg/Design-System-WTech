import 'package:flutter/material.dart';

class InnerShadow extends StatelessWidget {
  final Widget child;
  final Color shadowColor;
  final Offset offset;
  final double blur;

  const InnerShadow({
    super.key,
    required this.child,
    this.shadowColor = Colors.black,
    this.offset = const Offset(2, 2),
    this.blur = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    // Se a cor original é opaca, seu alpha é 255; aqui queremos 30% dessa opacidade.
    final Color adjustedShadowColor = shadowColor.withAlpha((255 * 0.3).round());
    return Stack(
      children: [
        child,
        // IgnorePointer garante que o overlay não capture toques.
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000), // Assume que o child é circular.
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  adjustedShadowColor,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.7],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
