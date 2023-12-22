import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget content;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  const CustomContainer({
    super.key,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 0),
            topRight: Radius.circular(
              topRightRadius ?? 0,
            ),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
            bottomRight: Radius.circular(bottomRightRadius ?? 0)),
      ),
      child: content,
    );
  }
}