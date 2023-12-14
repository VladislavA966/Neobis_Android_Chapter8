import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_text_field.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_login_email_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SafeArea(
            child: Column(
              children: [
                _buildLogo(),
                _buildLoginFields(),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Image.asset(AppImages.cart),
        const SizedBox(height: 8),
        const Text('MOBI MARKET', style: AppFonts.s18w800),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
      ],
    );
  }

  Widget _buildLoginFields() {
    return Column(
      children: [
        const CommonTextField(
          title: 'Имя пользователя',
          obscureText: false,
        ),
        const SizedBox(height: 51),
        CommonTextField(
          title: 'Пароль',
          suffix: IconButton(
            icon: obscureText
                ? Image.asset(AppImages.showText)
                : Image.asset(AppImages.hideText),
            onPressed: () => setState(() => obscureText = !obscureText),
          ),
          obscureText: obscureText,
        ),
        const SizedBox(height: 82),
        CommonElevatedButton(
          title: 'Войти',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),
            );
          },
          child: Text(
            'Зарегистрироваться',
            style: AppFonts.s14w400.copyWith(color: AppColors.violet),
          ),
        ),
      ),
    );
  }
}
