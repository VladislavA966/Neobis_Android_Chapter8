import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final FocusNode focusNode;
  final bool autofocus;
  final TextEditingController controller;

  const PasswordTextField({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
    required this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: '●',
      textAlign: TextAlign.center,
      decoration: InputDecoration(border: InputBorder.none),
    );
  }
}