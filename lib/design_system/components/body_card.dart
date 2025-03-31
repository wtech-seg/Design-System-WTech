import 'package:flutter/material.dart';

class BodyCard extends StatelessWidget {
  final String name;
  final double cardRadius;
  final Color? cardColor;

  const BodyCard({
    Key? key,
    required this.name,
    this.cardRadius = 16.0,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cor de fundo do cartão (use a do seu Design System, se preferir)
    final Color baseColor = cardColor ?? const Color(0xFFE3EDF7);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          // Sombra clara no canto superior/esquerda
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-3, -3),
            blurRadius: 6,
          ),
          // Sombra escura no canto inferior/direita
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(3, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone ou avatar em estilo neumórfico
          AvatarCardCircle(
            baseColor: baseColor,
            child: const Icon(
              Icons.person,
              color: Color(0xFFE3EDF7), // Ajuste conforme desejado
            ),
          ),
          const SizedBox(width: 12),
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
    );
  }
}

// Widget auxiliar para o círculo neumórfico
class AvatarCardCircle extends StatelessWidget {
  final Widget child;
  final double size;
  final Color baseColor;

  const AvatarCardCircle({
    Key? key,
    required this.child,
    required this.baseColor,
    this.size = 48,
  }) : super(key: key);

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
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-2, -2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
