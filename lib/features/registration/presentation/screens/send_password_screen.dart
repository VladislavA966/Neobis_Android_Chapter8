import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeSecond = FocusNode();
  final TextEditingController _firstPasswordController =
      TextEditingController();
  final TextEditingController _secondPasswordController =
      TextEditingController();

  bool _isButtonEnabled = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _firstPasswordController.addListener(_updateButtonState);
    _secondPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    if (_focusNodeFirst.hasFocus &&
        _firstPasswordController.text.isNotEmpty &&
        _firstPasswordController.text.contains(
          RegExp(r'[a-zA-Z]'),
        ) &&
        _firstPasswordController.text.contains(
          RegExp(r'[0-9]'),
        )) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else if (_focusNodeSecond.hasFocus &&
        _secondPasswordController.text.isNotEmpty &&
        _secondPasswordController.text == _firstPasswordController.text) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  void _onButtonPressed() {
    if (_focusNodeFirst.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNodeSecond);
    } else if (_focusNodeSecond.hasFocus) {
      print('Action after second field filled');
    }
  }

  @override
  void dispose() {
    _focusNodeFirst.dispose();
    _focusNodeSecond.dispose();
    _firstPasswordController.dispose();
    _secondPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _obscureText =! _obscureText;
                });
              },
              child: Image.asset(
                AppImages.hideText,
              ),
            ),
          ),
        ],
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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      AppImages.lock,
                    ),
                  ),
                  color: AppColors.violet,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Придумате пароль',
                style: AppFonts.s20w400.copyWith(color: AppColors.grey49),
              ),
              Text(
                'Минимальная длина — 8 символов.\nДля надежности пароль должен\nсодержать буквы и цифры.',
                textAlign: TextAlign.center,
                style: AppFonts.s16w400.copyWith(
                  color: AppColors.grey,
                ),
              ),
              PasswordTextField(
                obscureText: _obscureText,
                controller: _firstPasswordController,
                focusNode: _focusNodeFirst,
                autofocus: true,
              ),
              PasswordTextField(
                obscureText: _obscureText,
                controller: _secondPasswordController,
                focusNode: _focusNodeSecond,
                autofocus: false,
              ),
              const SizedBox(height: 49),
              CommonElevatedButton(
                title: 'Далее',
                onPressed: _isButtonEnabled ? _onButtonPressed : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final FocusNode focusNode;
  final bool autofocus;
  final TextEditingController controller;

  const PasswordTextField({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: '●',
      textAlign: TextAlign.center,
      decoration: InputDecoration(border: InputBorder.none),
    );
  }
}