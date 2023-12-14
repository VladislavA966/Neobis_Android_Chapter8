import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';

class UserProfileScrreen extends StatefulWidget {
  const UserProfileScrreen({super.key});

  @override
  State<UserProfileScrreen> createState() => _UserProfileScrreenState();
}

class _UserProfileScrreenState extends State<UserProfileScrreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          'Профиль',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Изм.',
              style: AppFonts.s16w400.copyWith(color: AppColors.grey49),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.violet,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Алеся',
                style: AppFonts.s18w400.copyWith(color: AppColors.grey49),
              ),
              const SizedBox(
                height: 24,
              ),
              UserProfileContainer(
                onTap: () {},
                title: 'Понравившиеся',
                image: AppImages.hearth,
              ),
              UserProfileContainer(
                  onTap: () {}, image: AppImages.myCart, title: 'Мои товары'),
              const SizedBox(
                height: 16,
              ),
              UserProfileContainer(
                  onTap: () {}, image: AppImages.exit, title: 'Выйти'),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileContainer extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const UserProfileContainer({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(
                width: 9,
              ),
              Text(
                title,
                style: AppFonts.s16w400.copyWith(color: AppColors.black),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
