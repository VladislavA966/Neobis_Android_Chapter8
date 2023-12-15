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
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.black,
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Регистрация',
        style: AppFonts.s18w700.copyWith(color: AppColors.black),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildLogo(),
            const SizedBox(height: 68),
            _buildUsernameField(),
            const SizedBox(height: 52),
            _buildEmailField(),
            const SizedBox(height: 46),
            _buildRegisterButton(),
          ],
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
      ],
    );
  }

  Widget _buildUsernameField() {
    return CommonTextField(
      controller: usernameController,
      title: 'Имя пользователя',
      obscureText: false,
    );
  }

  Widget _buildEmailField() {
    return CommonTextField(
      controller: emailController,
      title: 'Почта',
      obscureText: false,
    );
  }

  Widget _buildRegisterButton() {
    return CommonElevatedButton(
      title: 'Войти',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePasswordScreen(
              userName: usernameController.text,
              email: emailController.text,
            ),
          ),
        );
      },
    );
  }
}
