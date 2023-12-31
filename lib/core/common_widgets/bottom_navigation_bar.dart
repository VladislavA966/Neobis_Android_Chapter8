import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/screeens/all_items_screen.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/user_profile_screen.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({super.key});

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  static const List appScreens = [
    AllItemsScreen(),
    Center(child: Text('Кошельки')),
    Center(child: Text('Чаты')),
    UserProfileScreen(),
  ];

  int currentIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  void onItemTapped(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens.elementAt(currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor: AppColors.violet),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
              size: 15,
            )),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: AppColors.violet),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(AppImages.home), label: 'Главная'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImages.wallet), label: 'Кошельки'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImages.chat), label: 'Чаты'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Профиль'),
          ],
        );
      }),
    );
  }
}
