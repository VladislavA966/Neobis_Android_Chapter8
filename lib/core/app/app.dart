import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/features/login/presentation/login_screen.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/user_profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      home: const UserProfileScrreen(),
    );
  }
}
