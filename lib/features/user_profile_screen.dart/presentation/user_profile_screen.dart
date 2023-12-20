import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/add_user_data_scree.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/screens/confirm_phone_number.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/favourite_items_list.dart';

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
          AppBarElevatedButton(
            title: 'Изм.',
            onPressed: () {},
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoutiteItemsScreen(),
                    ),
                  );
                },
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
              const Spacer(),
              CommonElevatedButton(
                title: 'Закончить регистрацию',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmPhoneNumber(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
