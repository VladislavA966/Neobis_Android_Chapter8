import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';

import 'package:neobis_android_chapter8/features/registration/presentation/common_widgets/password_text_field.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final codeController = TextEditingController();
  Timer? _timer;
  int _start = 59;
  bool _showResendButton = false;

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _showResendButton = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerString {
    final minutesStr = (_start ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (_start % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 32,
                ),
                const ImageContainer(
                  image: AppImages.lock,
                ),
                const SizedBox(height: 32),
                Text(
                  "Введите код из СМС",
                  style: AppFonts.s20w400.copyWith(color: AppColors.grey49),
                ),
                PasswordTextField(
                  obscureText: false,
                  controller: codeController,
                  focusNode: FocusNode(),
                  autofocus: false,
                  hintText: '0 0 0 0',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (!_showResendButton)
                      const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.grey,
                          ),
                        ),
                      ),
                    SizedBox(width: _showResendButton ? 0 : 16),
                    Text(
                      _showResendButton ? '' : timerString,
                      style: AppFonts.s16w400.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
                if (_showResendButton)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _start = 59;
                        _showResendButton = false;
                      });
                      startTimer();
                    },
                    child: Text(
                      "Отправить код еще раз",
                      style: AppFonts.s16w400.copyWith(color: AppColors.violet),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                CommonElevatedButton(
                  title: 'Отправить код',
                  onPressed: codeController.text.isEmpty ? null : () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
