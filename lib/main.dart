import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtech_design_system/design_system/components/password_field.dart';
import 'package:wtech_design_system/design_system/components/wtech_mobile_button.dart';
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
      appBar: AppBar(
        title: const Text('Design System', style: WtechTextStyles.headline),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'lib/design_system/assets/svgs/logobranca.svg',
              width: 120,
            ),
            const SizedBox(height: 24),
            WtechButton(label: 'Entrar', onPressed: () {}),
            WtechMobileButton(label: 'Entrar', onPressed: () {}),
            PasswordField(),
          ],
        ),
      ),
    );
  }
}
