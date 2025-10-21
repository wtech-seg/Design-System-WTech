import 'package:flutter/material.dart';

class BodyCard extends StatelessWidget {
  final String name;
  final double cardRadius;
  final Color? cardColor;
  final Widget? leading;

  const BodyCard({
    super.key,
    required this.name,
    this.cardRadius = 16.0,
    this.cardColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = cardColor ?? const Color(0xFFE3EDF7);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: [
            // Sombra clara no canto superior/esquerda
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.7),
              offset: const Offset(-3, -3),
              blurRadius: 6,
            ),
            // Sombra escura no canto inferior/direita
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(3, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            AvatarCardCircle(
              baseColor: baseColor,
              child: leading ?? const SizedBox.shrink(),
            ),
            const SizedBox(width: 15),
            // Nome
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF122240),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para o círculo neumórfico
class AvatarCardCircle extends StatelessWidget {
  final Widget child;
  final double size;
  final Color baseColor;

  const AvatarCardCircle({
    super.key,
    required this.child,
    required this.baseColor,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: baseColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.7),
            offset: const Offset(-2, -2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
