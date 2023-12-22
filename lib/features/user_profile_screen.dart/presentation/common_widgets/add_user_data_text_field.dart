import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class AddUserDataTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  const AddUserDataTextField({
    super.key,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.s16w400.copyWith(
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
