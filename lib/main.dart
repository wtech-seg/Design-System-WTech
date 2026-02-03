import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtech_design_system/design_system/components/dialogs/toast.dart';
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
          WtechDrawer(userName: 'TESTE', onLogout: (){}, onAccess: () {  }, onSettings: () {  }, onSAC: () {  },),
          NavigationDrawerWtech(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/logobranca.svg',
                    width: 120,
                    package: 'wtech_design_system',
                  ),
                  const SizedBox(height: 24),
                  WtechButton(label: 'Entrar', onPressed: () { showWtechToast(context, message: "Clicou no botão **Entrar**", type: WtechToastType.info);}, minWidth: 147, minHeight: 48),
                  WtechMobileButton(label: 'Entrar', onPressed: () {}),
                  PasswordField(),
                  BodyCard(name: 'Teste'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}