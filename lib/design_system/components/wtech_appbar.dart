import 'package:flutter/material.dart';
import 'package:wtech_design_system/design_system/design_system.dart'; // Para acessar as cores, estilos, etc.

class WtechAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? actionWidget;

  const WtechAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: WtechColors.primary, // Cor definida no seu design system
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        // Se o onBack não for informado, utiliza Navigator.pop(context)
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 21),
          child: actionWidget ??
              Image.asset(
                'packages/wtech_design_system/assets/pngs/dark_w.png',
                height: 23,
              ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
