import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'design_system/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design System Demo',
      theme: WtechTheme.defaultTheme,
      home: const DesignSystemShowcase(),
    );
  }
}

class DesignSystemShowcase extends StatelessWidget {
  const DesignSystemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WtechAppBar(title: ''),
      body: Row(
        children: [
          WtechDrawer(userName: 'TESTE', onLogout: (){},),
          NavigationDrawerWtech(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'packages/wtech_design_system/assets/svgs/logobranca.svg',
                    width: 120,
                  ),
                  const SizedBox(height: 24),
                  WtechButton(label: 'Entrar', onPressed: () {}),
                  WtechMobileButton(label: 'Entrar', onPressed: () {}),
                  PasswordField(),
                  BodyCard(name: 'Teste'),
                  BodyCardEnterprise(name: 'Empresa Teste'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

