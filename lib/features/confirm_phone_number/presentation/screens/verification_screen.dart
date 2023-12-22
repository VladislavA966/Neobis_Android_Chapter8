import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';

import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/bloc/confirm_phone_bloc.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/common_widgets/password_text_field.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/add_user_data_scree.dart';

class VerificationScreen extends StatefulWidget {
  final String phone;
  const VerificationScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController = TextEditingController();
  Timer? _timer;
  int _start = 59;
  bool _showResendButton = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    codeController.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _showResendButton = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _showResendButton = true;
        });
      } else {
        setState(() => _start--);
      }
    });
  }

  String get timerString =>
      '${(_start ~/ 60).toString().padLeft(2, '0')}:${(_start % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 32),
          const ImageContainer(image: AppImages.lock),
          const SizedBox(height: 32),
          Text("Введите код из СМС",
              style: AppFonts.s20w400.copyWith(color: AppColors.grey49)),
          PasswordTextField(
            obscureText: false,
            controller: codeController,
            focusNode: FocusNode(),
            autofocus: false,
            hintText: '0 0 0 0',
          ),
          _buildTimerRow(),
          const SizedBox(height: 20),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildTimerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!_showResendButton)
          const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey),
            ),
          ),
        if (!_showResendButton) SizedBox(width: 16),
        if (!_showResendButton)
          Text(timerString,
              style: AppFonts.s16w400.copyWith(color: AppColors.grey)),
        if (_showResendButton)
          TextButton(
            onPressed: () {
              _start = 59;
              startTimer();
            },
            child: Text("Отправить код еще раз",
                style: AppFonts.s16w400.copyWith(color: AppColors.violet)),
          ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return BlocListener<ConfirmPhoneBloc, ConfirmPhoneState>(
      listener: (context, state) {
        if (state is ConfirmPhoneLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUserDataScreen(),
            ),
          );
        }
      },
      child: CommonElevatedButton(
        title: 'Отправить код',
        onPressed: codeController.text.isEmpty
            ? null
            : () {
                BlocProvider.of<ConfirmPhoneBloc>(context).add(
                  SendCodeEvent(
                      phone: widget.phone,
                      code: int.tryParse(codeController.text) ?? 0),
                );
              },
      ),
    );
  }
}
