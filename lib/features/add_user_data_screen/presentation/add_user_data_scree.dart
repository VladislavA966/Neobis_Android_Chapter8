import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/features/user_profile_screen.dart/presentation/user_profile_screen.dart';

class AddUserDataScreen extends StatefulWidget {
  const AddUserDataScreen({super.key});

  @override
  State<AddUserDataScreen> createState() => _AddUserDataScreenState();
}

class _AddUserDataScreenState extends State<AddUserDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarElevatedButton(
                  title: 'Отмена',
                  onPressed: () {},
                ),
                AppBarElevatedButton(
                  title: 'Готово',
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.violet,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Выбрать фотографию',
                style: AppFonts.s16w400.copyWith(
                  color: AppColors.violet,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AddUserDataTextField(
              controller: TextEditingController(),
              hintText: 'Имя',
              topLeftRadius: 12,
              topRightRadius: 12,
            ),
            AddUserDataTextField(
              controller: TextEditingController(),
              hintText: 'Фамилия',
            ),
            AddUserDataTextField(
              controller: TextEditingController(),
              hintText: 'Имя пользователя',
            ),
            AddUserDataTextField(
              controller: TextEditingController(),
              hintText: 'Дата рождения',
              bottomLeftRadius: 12,
              bottomRightRadius: 12,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomContainer(
              content: Row(
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
                      style: AppFonts.s16w400.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  )
                ],
              ),
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
        ),
      )),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget content;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  const CustomContainer({
    super.key,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 0),
            topRight: Radius.circular(
              topRightRadius ?? 0,
            ),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
            bottomRight: Radius.circular(bottomRightRadius ?? 0)),
      ),
      child: content,
    );
  }
}

class AddUserDataTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  const AddUserDataTextField({
    super.key,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.s16w400.copyWith(
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? 0),
            ),
            borderSide: BorderSide(color: AppColors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
