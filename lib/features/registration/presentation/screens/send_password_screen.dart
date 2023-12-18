import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/core/recources/app_images.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:neobis_android_chapter8/features/registration/presentation/common_widgets/password_text_field.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/user_profile_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String userName;
  final String email;
  const CreatePasswordScreen(
      {super.key, required this.userName, required this.email});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeSecond = FocusNode();
  final _firstPasswordController = TextEditingController();
  final _secondPasswordController = TextEditingController();

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
      BlocProvider.of<RegistrationBloc>(context).add(
        GetRegistrationEvent(
            userName: widget.userName,
            password: _firstPasswordController.text,
            email: widget.email),
      );
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
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const ImageContainer(
                image: AppImages.lock,
              ),
              const SizedBox(
                height: 28,
              ),
              _buildText(),
              _buildValidationText(),
              _buildPasswordField(),
              _buildConfirmPasswordField(),
              const SizedBox(height: 49),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildValidationText() {
    return Text(
      'Минимальная длина — 8 символов.\nДля надежности пароль должен\nсодержать буквы и цифры.',
      textAlign: TextAlign.center,
      style: AppFonts.s16w400.copyWith(
        color: AppColors.grey,
      ),
    );
  }

  Text _buildText() {
    return Text(
      'Придумате пароль',
      style: AppFonts.s20w400.copyWith(color: AppColors.grey49),
    );
  }

  PasswordTextField _buildConfirmPasswordField() {
    return PasswordTextField(
      obscureText: _obscureText,
      controller: _secondPasswordController,
      focusNode: _focusNodeSecond,
      autofocus: false,
    );
  }

  PasswordTextField _buildPasswordField() {
    return PasswordTextField(
      obscureText: _obscureText,
      controller: _firstPasswordController,
      focusNode: _focusNodeFirst,
      autofocus: true,
    );
  }

  BlocListener<RegistrationBloc, RegistrationState> _buildNextButton() {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfileScrreen(),
            ),
          );
        } else if (state is RegistrationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пользователь с таким именем уже существует'),
            ),
          );
        }
      },
      child: CommonElevatedButton(
        title: 'Далее',
        onPressed: _isButtonEnabled ? _onButtonPressed : null,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
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
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
        ),
        color: AppColors.violet,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
