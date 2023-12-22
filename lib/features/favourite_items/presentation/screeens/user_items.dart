import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/bloc/items_bloc.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/error_column.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/item_container.dart';

class UserItemsScreen extends StatefulWidget {
  const UserItemsScreen({super.key});

  @override
  State<UserItemsScreen> createState() => _UserItemsScreenState();
}

class _UserItemsScreenState extends State<UserItemsScreen> {
  List<bool> isLiked = List.generate(10, (index) => false);

  void toggleLike(int index) {
    setState(() {
      isLiked[index] = !isLiked[index];
    });
  }

  @override
  void initState() {
    BlocProvider.of<ItemsBloc>(context).add(
      GetMyItemsEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          'Мои товары',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49),
        ),
      ),
      body: BlocConsumer<ItemsBloc, ItemsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ItemsLoaded) {
            if (state.model.items.isEmpty) {
              return const ErrorColumn();
            } else if (state is ItemsLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: GridView.builder(
                    itemCount: state.model.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return ItemContainer(
                        name: state.model.items[index].name,
                        likes: state.model.items[index].likes.toString(),
                        price: state.model.items[index].price.toString(),
                        onTap: () {},
                        like: () => toggleLike(index),
                        isLiked: isLiked[index],
                      );
                    }),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
