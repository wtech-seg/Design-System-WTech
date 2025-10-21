import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Ícone vetorial (SVG) com gradiente e brilho (glow) opcional.
///
/// Pode ser usado em qualquer contexto do app:
/// - BottomNavbar
/// - BodyCards (Enterprises, Visitors)
/// - Botões e listas
/// - Headers e menus
///
/// Exemplo de uso:
/// ```dart
/// WtechIcon(
///   asset: 'assets/svgs/icons/building.svg',
///   active: true,
///   size: 32,
///   glow: false, // desativa o brilho
/// )
/// ```
class WtechIcon extends StatelessWidget {
  /// Caminho do SVG (geralmente monocromático branco)
  final String asset;

  /// Se `true`, usa o gradiente "ativo"; caso contrário, o "inativo"
  final bool active;

  /// Tamanho do ícone em px
  final double size;

  /// Gradiente para o estado ativo
  final List<Color> activeColors;

  /// Gradiente para o estado inativo
  final List<Color> inactiveColors;

  /// Controla o brilho/glow (borrado atrás do ícone)
  final bool glow;

  const WtechIcon({
    super.key,
    required this.asset,
    required this.active,
    this.size = 24,
    this.activeColors = const [Color(0xFF48A7FF), Color(0xFF0C62FF)],
    this.inactiveColors = const [Color(0xFF9AA8B7), Color(0xFF7F8A97)],
    this.glow = true,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: active ? activeColors : inactiveColors,
    );

    // SVG branco que receberá o gradiente via ShaderMask
    Widget _svg({double? opacity}) {
      final child = SvgPicture.asset(
        asset,
        width: size,
        height: size,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
      final masked = ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (rect) => gradient.createShader(rect),
        child: child,
      );
      return opacity != null ? Opacity(opacity: opacity, child: masked) : masked;
    }

    // Se o brilho estiver desativado, renderiza só o ícone com gradiente
    if (!glow) return _svg();

    // Se o brilho estiver ativo, adiciona o blur/glow por trás
    return Stack(
      alignment: Alignment.center,
      children: [
        // camada borrada (glow)
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: _svg(opacity: active ? 0.35 : 0.25),
        ),
        // camada nítida (principal)
        _svg(),
      ],
    );
  }
}
