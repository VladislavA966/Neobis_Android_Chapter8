import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final Function()? onTapIcon;
  final String title;
  final Widget? suffix;
  final bool obscureText;
  const CommonTextField(
      {super.key,
      required this.title,
      this.suffix,
      required this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
