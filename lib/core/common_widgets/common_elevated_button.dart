import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  const CommonElevatedButton({
    super.key,
    required this.title,
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
          backgroundColor: AppColors.violet,
        ),
        onPressed: () {},
        child: Text(
          title,
          style: AppFonts.s16w700,
        ),
      ),
    );
  }
}
