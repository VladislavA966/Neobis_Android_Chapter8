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
  final _firstPasswordController = TextEditingController();
  final _secondPasswordController = TextEditingController();
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeSecond = FocusNode();

  bool _isButtonEnabled = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _firstPasswordController.addListener(_updateButtonState);
    _secondPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _firstPasswordController.dispose();
    _secondPasswordController.dispose();
    _focusNodeFirst.dispose();
    _focusNodeSecond.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _firstPasswordController.text.isNotEmpty &&
          _secondPasswordController.text.isNotEmpty &&
          _firstPasswordController.text == _secondPasswordController.text;
    });
  }

  void _onButtonPressed() {
    BlocProvider.of<RegistrationBloc>(context).add(
      GetRegistrationEvent(
          userName: widget.userName,
          password: _firstPasswordController.text,
          email: widget.email),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: AppColors.black,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ],
      title: Text('Регистрация',
          style: AppFonts.s18w700.copyWith(color: AppColors.black)),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildLogoSection(),
            const SizedBox(height: 28),
            _buildInstructionsText(),
            _buildPasswordFields(),
            const SizedBox(height: 49),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage(AppImages.lock)),
        color: AppColors.violet,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildInstructionsText() {
    return Column(
      children: [
        Text('Придумате пароль',
            style: AppFonts.s20w400.copyWith(color: AppColors.grey49)),
        Text(
          'Минимальная длина — 8 символов.\nДля надежности пароль должен содержать буквы и цифры.',
          textAlign: TextAlign.center,
          style: AppFonts.s16w400.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget _buildNextButton() {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationLoaded) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserProfileScrreen()));
        } else if (state is RegistrationError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Пользователь с таким именем уже существует')));
        }
      },
      child: CommonElevatedButton(
        title: 'Далее',
        onPressed: _isButtonEnabled ? _onButtonPressed : null,
      ),
    );
  }
}
