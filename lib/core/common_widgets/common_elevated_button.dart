import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CommonElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              80,
            ),
          ),
          disabledBackgroundColor: AppColors.grey,
          backgroundColor: onPressed == null ? AppColors.grey : AppColors.violet,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFonts.s16w700.copyWith(color:AppColors.white),
        ),
      ),
    );
  }
}
