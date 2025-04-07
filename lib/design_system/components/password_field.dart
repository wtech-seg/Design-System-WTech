import 'package:flutter/material.dart';
import 'package:wtech_design_system/design_system/design_system.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller; // Controller opcional

  const PasswordField({Key? key, this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Usa o controller passado, se houver
      obscureText: _obscureText,
      style: TextStyle(color: WtechColors.textWhite),
      decoration: InputDecoration(
        hintText: 'Senha',
        hintStyle: TextStyle(color: WtechColors.textDarkGray),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF122240)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF122240)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: WtechColors.textDarkGray,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
