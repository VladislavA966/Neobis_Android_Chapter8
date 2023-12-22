import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class AppBarElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const AppBarElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppFonts.s16w400.copyWith(color: AppColors.grey49),
      ),
    );
  }
}
