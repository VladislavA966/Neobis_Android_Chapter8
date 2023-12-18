import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class PasswordTextField extends StatelessWidget {
  final String? hintText;
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
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppFonts.s28w700.copyWith(color: AppColors.grey49),
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: '●',
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
