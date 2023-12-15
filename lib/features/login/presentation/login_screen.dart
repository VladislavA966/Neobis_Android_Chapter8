import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/common_widgets/bottom_navigation_bar.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_text_field.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/login/presentation/bloc/log_in_bloc.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/user_profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
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
        _usernameField(),
        const SizedBox(height: 51),
        _passwordField(),
        const SizedBox(height: 82),
        _loginButton(),
      ],
    );
  }

  Widget _usernameField() {
    return CommonTextField(
      controller: loginController,
      title: 'Имя пользователя',
      obscureText: false,
    );
  }

  Widget _passwordField() {
    return CommonTextField(
      controller: passwordController,
      title: 'Пароль',
      suffix: IconButton(
        icon: obscureText
            ? Image.asset(AppImages.showText)
            : Image.asset(AppImages.hideText),
        onPressed: () => setState(() => obscureText = !obscureText),
      ),
      obscureText: obscureText,
    );
  }

  Widget _loginButton() {
    return BlocListener<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state is LogInLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfileScrreen(),
            ),
          );
        } else if (state is LogInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Неверный логин или пароль'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(20),
            ),
          );
        }
      },
      child: CommonElevatedButton(
        title: 'Войти',
        onPressed: () {
          BlocProvider.of<LogInBloc>(context).add(SendLoginData(
            logIn: loginController.text,
            password: passwordController.text,
          ));
        },
      ),
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
                builder: (context) => const BottomBarNavigation(),
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
