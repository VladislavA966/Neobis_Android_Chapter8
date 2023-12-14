import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_text_field.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Регистрация',
          style: AppFonts.s18w700.copyWith(
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Image.asset(AppImages.cart),
              const SizedBox(
                height: 8,
              ),
              const Text('MOBI MARKET', style: AppFonts.s18w800),
              const SizedBox(
                height: 68,
              ),
              const CommonTextField(
                  title: 'Имя пользователя', obscureText: false),
              const SizedBox(
                height: 52,
              ),
              const CommonTextField(
                title: 'Почта',
                obscureText: false,
              ),
              const SizedBox(
                height: 46,
              ),
              CommonElevatedButton(
                title: 'Войти',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatePasswordScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
