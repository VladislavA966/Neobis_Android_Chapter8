import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';

class ErrorColumn extends StatelessWidget {
  const ErrorColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset(
          AppImages.artwork,
        ),
        Text(
          'Ой,пусто',
          style: AppFonts.s18w700.copyWith(
            color: AppColors.grey49,
          ),
        ),
      ],
    ));
  }
}
