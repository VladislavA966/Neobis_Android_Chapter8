import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final Function(String)? onChanged;
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
      this.onTapIcon,
      required this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
