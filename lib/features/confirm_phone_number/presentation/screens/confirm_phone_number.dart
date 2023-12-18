import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/common_widgets/password_text_field.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';

class ConfirmPhoneNumber extends StatefulWidget {
  const ConfirmPhoneNumber({super.key});

  @override
  State<ConfirmPhoneNumber> createState() => _ConfirmPhoneNumberState();
}

class _ConfirmPhoneNumberState extends State<ConfirmPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const ImageContainer(
                image: AppImages.lock,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Введите номер телефона',
                style: AppFonts.s20w400.copyWith(
                  color: AppColors.grey49,
                ),
              ),
              Text(
                'Мы отправили вам СМС с кодом\nподтверждения',
                style: AppFonts.s16w400.copyWith(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              PasswordTextField(
                obscureText: false,
                controller: TextEditingController(),
                focusNode: FocusNode(),
                autofocus: false,
                hintText: '0(000)000000',
              ),
              const SizedBox(
                height: 93,
              ),
              CommonElevatedButton(
                title: 'Далее',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
