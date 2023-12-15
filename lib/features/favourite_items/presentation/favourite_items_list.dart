import 'package:flutter/material.dart';
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

class ItemContainer extends StatelessWidget {
  final Function() onTap;
  final Function() like;
  final bool isLiked;
  const ItemContainer({
    super.key,
    required this.onTap,
    required this.like,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/item_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'BMW M4 Coupe: A Two-Door',
                style: AppFonts.s14w400.copyWith(color: AppColors.black),
              ),
              Text(
                '23 000 \$',
                textAlign: TextAlign.start,
                style: AppFonts.s14w400.copyWith(color: AppColors.violet),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: like,
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    '100',
                    style: AppFonts.s14w400.copyWith(color: AppColors.greyC1),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
