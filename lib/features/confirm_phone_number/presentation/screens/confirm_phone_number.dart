import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/bloc/confirm_phone_bloc.dart';
import 'package:neobis_android_chapter8/features/confirm_phone_number/presentation/screens/verification_screen.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/common_widgets/password_text_field.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/screens/send_password_screen.dart';

class ConfirmPhoneNumber extends StatefulWidget {
  const ConfirmPhoneNumber({super.key});

  @override
  State<ConfirmPhoneNumber> createState() => _ConfirmPhoneNumberState();
}

class _ConfirmPhoneNumberState extends State<ConfirmPhoneNumber> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        const SizedBox(height: 32),
        const ImageContainer(image: AppImages.lock),
        const SizedBox(height: 32),
        buildTitleText(),
        const SizedBox(height: 32),
        buildPhoneTextField(),
        const SizedBox(height: 93),
        buildBlocConsumer(),
      ],
    );
  }

  Text buildTitleText() {
    return Text(
      'Введите номер телефона',
      style: AppFonts.s20w400.copyWith(color: AppColors.grey49),
    );
  }

  PasswordTextField buildPhoneTextField() {
    return PasswordTextField(
      autofocus: true,
      focusNode: FocusNode(),
      obscureText: false,
      controller: _phoneController,
      hintText: '0(000)000000',
    );
  }

  BlocConsumer<ConfirmPhoneBloc, ConfirmPhoneState> buildBlocConsumer() {
    return BlocConsumer<ConfirmPhoneBloc, ConfirmPhoneState>(
      listener: (context, state) {
        if (state is ConfirmPhoneLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VerificationScreen(),
            ),
          );
        } else if (state is ConfirmPhoneError) {
          Fluttertoast.showToast(
            msg: state.errorText,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        bool isButtonActive = _phoneController.text.length >= 10;
        return CommonElevatedButton(
          title: 'Далее',
          onPressed: isButtonActive
            ? () {
                BlocProvider.of<ConfirmPhoneBloc>(context).add(
                  SendPhoneEvent(phone: _phoneController.text),
                );
              }
            : null,
        );
      },
    );
  }
}
