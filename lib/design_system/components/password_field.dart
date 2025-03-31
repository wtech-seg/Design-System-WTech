import 'package:flutter/material.dart';
import 'package:wtech_design_system/design_system/design_system.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // controla se a senha está oculta ou não

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Senha',
        hintStyle: TextStyle(
          color: WtechColors.textDarkGray, // Cor do hint
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: WtechColors.textDarkGray, // Mesma cor do hint
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // alterna a visibilidade
            });
          },
        ),
      ),
    );
  }
}
