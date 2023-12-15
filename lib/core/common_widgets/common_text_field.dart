import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTapIcon;
  final String title;
  final Widget? suffix;
  final bool obscureText;
  const CommonTextField(
      {super.key,
      required this.title,
      this.suffix,
      required this.obscureText,
      this.onTapIcon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscuringCharacter: '*',
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffix,
        label: Text(title),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
