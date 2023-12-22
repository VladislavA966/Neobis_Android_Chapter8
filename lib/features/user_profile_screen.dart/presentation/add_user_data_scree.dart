import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neobis_android_chapter8/core/common_widgets/bottom_navigation_bar.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/bloc/user_info_bloc.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/common_widgets/add_user_data_text_field.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/common_widgets/app_bar_elevated_button.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/common_widgets/common_container.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/user_profile_screen.dart';

class AddUserDataScreen extends StatefulWidget {
  const AddUserDataScreen({super.key});

  @override
  State<AddUserDataScreen> createState() => _AddUserDataScreenState();
}

class _AddUserDataScreenState extends State<AddUserDataScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File imageFile = File(image.path);
      BlocProvider.of<UserInfoBloc>(context)
          .add(ImagePickerEvent(image: imageFile));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              _buildTopBar(context),
              const SizedBox(height: 30),
              _buildCircleAvatar(),
              _buildAddPhotoButton(context),
              const SizedBox(height: 30),
              _buildTextFields(),
              const SizedBox(height: 18),
              _buildAdditionalInformation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddPhotoButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        _pickImage();
      },
      child: Text(
        'Выбрать фотографию',
        style: AppFonts.s16w400.copyWith(
          color: AppColors.violet,
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarElevatedButton(
          title: 'Отмена',
          onPressed: () => Navigator.pop(context),
        ),
        BlocListener<UserInfoBloc, UserInfoState>(
          listener: (context, state) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomBarNavigation(),
              ),
            );
          },
          child: AppBarElevatedButton(
            title: 'Готово',
            onPressed: () => _onReadyPressed(context),
          ),
        ),
      ],
    );
  }

  void _onReadyPressed(BuildContext context) {
    BlocProvider.of<UserInfoBloc>(context).add(
      UpdateUserDataEvent(
        name: _nameController.text,
        surname: _surnameController.text,
        lastName: _lastnameController.text,
        birthDay: _dateController.text,
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.violet,
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        AddUserDataTextField(
          controller: _nameController,
          hintText: 'Имя',
          topLeftRadius: 12,
          topRightRadius: 12,
        ),
        AddUserDataTextField(
          controller: _surnameController,
          hintText: 'Фамилия',
        ),
        AddUserDataTextField(
          controller: _lastnameController,
          hintText: 'Имя пользователя',
        ),
        AddUserDataTextField(
          controller: _dateController,
          hintText: 'Дата рождения',
          bottomLeftRadius: 12,
          bottomRightRadius: 12,
        ),
      ],
    );
  }

  Widget _buildAdditionalInformation() {
    return Column(
      children: [
        CustomContainer(
          content: _buildPhoneNumberRow(),
          topLeftRadius: 12,
          topRightRadius: 12,
        ),
        CustomContainer(
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Afonin30.10.96@gmail.com',
              style: AppFonts.s16w400.copyWith(color: AppColors.black),
            ),
          ),
          bottomLeftRadius: 12,
          bottomRightRadius: 12,
        ),
      ],
    );
  }

  Widget _buildPhoneNumberRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Добавить номер',
              style: AppFonts.s16w400.copyWith(color: AppColors.violet),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '0(000)0000000',
            style: AppFonts.s16w400.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
