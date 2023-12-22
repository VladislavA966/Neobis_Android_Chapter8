import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class ItemContainer extends StatelessWidget {
  final String name;
  final String price;
  final String likes;
  final Function() onTap;
  final Function() like;
  final bool isLiked;
  const ItemContainer({
    super.key,
    required this.onTap,
    required this.like,
    required this.isLiked,
    required this.name,
    required this.price,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/item_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: AppFonts.s14w400.copyWith(color: AppColors.black),
              ),
              Text(
                '$price \$',
                textAlign: TextAlign.start,
                style: AppFonts.s14w400.copyWith(color: AppColors.violet),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: like,
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    likes,
                    style: AppFonts.s14w400.copyWith(color: AppColors.greyC1),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
