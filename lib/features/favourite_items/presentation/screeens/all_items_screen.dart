import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_android_chapter8/core/recources/app_colors.dart';
import 'package:neobis_android_chapter8/core/recources/app_fonts.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/bloc/items_bloc.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/error_column.dart';
import 'package:neobis_android_chapter8/features/favourite_items/presentation/common_widgets/item_container.dart';

class AllItemsScreen extends StatefulWidget {
  const AllItemsScreen({Key? key}) : super(key: key);

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  List<bool> isLiked = List.generate(10, (index) => false);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemsBloc>(context).add(GetAllItemsEvent());
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
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      title: Text('Все товары',
          style: AppFonts.s18w400.copyWith(color: AppColors.grey49)),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<ItemsBloc, ItemsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ItemsLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ItemsLoaded) {
          return _buildItemsGrid(state);
        }
        if (state is ItemsError) {
          return const ErrorColumn();
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
