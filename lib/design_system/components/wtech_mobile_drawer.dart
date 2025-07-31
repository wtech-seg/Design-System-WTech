// wtech_design_system/lib/design_system/components/wtech_drawer.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/wtech_colors.dart';

typedef VoidCallback = void Function();

class WtechDrawer extends StatelessWidget {
  /// O nome do usuário conectado — você provê lá na Home.
  final String userName;

  /// O que deve acontecer quando clicar em “Acessos”
  final VoidCallback onAccess;

  /// O que deve acontecer quando clicar em “Configurações”
  final VoidCallback onSettings;

  /// O que deve acontecer quando clicar em “SAC”
  final VoidCallback onSAC;

  /// O que deve acontecer quando clicar em “Sair”
  final VoidCallback onLogout;

  const WtechDrawer({
    super.key,
    required this.userName,
    required this.onAccess,
    required this.onSettings,
    required this.onSAC,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280, // largura fixa para ficar próximo ao mockup
      child: Container(
        color: WtechColors.primary,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // cabeçalho com logo e saudação
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'packages/wtech_design_system/assets/svgs/logobranca.svg',
                        height: 35,
                      ),
                    ),
                    const SizedBox(height: 55),
                    Text('Olá,', style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 4),
                    Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white24, height: 1),
              const SizedBox(height: 16),

              // Itens do menu
              _buildTile(
                icon: Icons.account_tree_rounded,
                label: 'Acessos',
                onTap: () {
                  Navigator.pop(context);
                  onAccess();
                },
              ),
              _buildTile(
                icon: Icons.settings,
                label: 'Configurações',
                onTap: () {
                  Navigator.pop(context);
                  onSettings();
                },
              ),
              _buildTile(
                icon: Icons.headset_mic,
                label: 'SAC',
                onTap: () {
                  Navigator.pop(context);
                  onSAC();
                },
              ),

              const Spacer(),
              const Divider(color: Colors.white24, height: 1),

              // Botão de logout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onLogout();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 32,
      onTap: onTap,
      hoverColor: Colors.white10,
      splashColor: Colors.white12,
    );
  }
}
