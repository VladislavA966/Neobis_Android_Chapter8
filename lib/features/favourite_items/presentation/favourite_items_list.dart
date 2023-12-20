import 'package:flutter/material.dart';
import 'package:neobis_android_chapter8/core/common_widgets/item_container.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';

class FavoutiteItemsScreen extends StatefulWidget {
  const FavoutiteItemsScreen({super.key});

  @override
  State<FavoutiteItemsScreen> createState() => _FavoutiteItemsScreenState();
}

class _FavoutiteItemsScreenState extends State<FavoutiteItemsScreen> {
  List<bool> isLiked = List.generate(10, (index) => false);

  void toggleLike(int index) {
    setState(() {
      isLiked[index] = !isLiked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          'Понравившиеся',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ItemContainer(
                onTap: () {},
                like: () => toggleLike(index),
                isLiked: isLiked[index],
              );
            }),
      ),
    );
  }
}
