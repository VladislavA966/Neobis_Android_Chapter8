import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/bloc/items_bloc.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/error_column.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/item_container.dart';


class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  List<bool> isLiked = List.generate(10, (index) => false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemsBloc>(context).add(GetLikedItemsEvent());
  }

  void toggleLike(int index) {
    setState(() {
      isLiked[index] = !isLiked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      title: Text('Понравившиеся',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49)),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<ItemsBloc, ItemsState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        if (state is ItemsLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ItemsLoaded && state.model.items.isEmpty) {
          return const ErrorColumn();
        }
        if (state is ItemsLoaded) {
          return _buildItemsGrid(state);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildItemsGrid(ItemsLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: GridView.builder(
        itemCount: state.model.items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final item = state.model.items[index];
          return ItemContainer(
            name: item.name,
            likes: item.likes.toString(),
            price: item.price.toString(),
            onTap: () {},
            like: () => toggleLike(index),
            isLiked: isLiked[index],
          );
        },
      ),
    );
  }
}
