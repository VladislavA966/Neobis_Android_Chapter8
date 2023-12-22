import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/screens/confirm_phone_number.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/screeens/favourite_items_list.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/screeens/user_items.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/add_user_data_scree.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/common_widgets/app_bar_elevated_button.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/common_widgets/user_profile_container.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      title: Text('Профиль',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AppBarElevatedButton(
            title: 'Изм.',
            onPressed: () => _navigateToAddUserDataScreen(context),
          ),
        ),
      ],
    );
  }

  Center _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 4),
            const CircleAvatar(radius: 50, backgroundColor: AppColors.violet),
            const SizedBox(height: 12),
            Text('Алеся',
                style: AppFonts.s18w400.copyWith(color: AppColors.grey49)),
            const SizedBox(height: 24),
            _buildUserProfileContainer(
              onTap: () => _navigateToFavouriteItemsScreen(context),
              title: 'Понравившиеся',
              image: AppImages.hearth,
            ),
            _buildUserProfileContainer(
              onTap: () => _navigateToUserItemsScreen(context),
              title: 'Мои товары',
              image: AppImages.myCart,
            ),
            const SizedBox(height: 16),
            _buildUserProfileContainer(
              onTap: () {}, 
              title: 'Выйти',
              image: AppImages.exit,
            ),
            const Spacer(),
            _buildCompleteRegistrationButton(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  UserProfileContainer _buildUserProfileContainer(
      {required VoidCallback onTap,
      required String title,
      required String image}) {
    return UserProfileContainer(onTap: onTap, title: title, image: image);
  }

  CommonElevatedButton _buildCompleteRegistrationButton(BuildContext context) {
    return CommonElevatedButton(
      title: 'Закончить регистрацию',
      onPressed: () => _navigateToConfirmPhoneNumber(context),
    );
  }

  void _navigateToAddUserDataScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddUserDataScreen(),
      ),
    );
  }

  void _navigateToFavouriteItemsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FavouriteItemsScreen(),
      ),
    );
  }

  void _navigateToUserItemsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserItemsScreen(),
      ),
    );
  }

  void _navigateToConfirmPhoneNumber(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConfirmPhoneNumber(),
      ),
    );
  }
}
