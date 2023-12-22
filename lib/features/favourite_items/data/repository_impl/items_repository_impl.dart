import 'package:neobis_android_chapter8/features/favourite_items/data/data_source/remote_data_source.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/mapper/item_mapper.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/repo/items_repo.dart';

class ItemsRepositoryImpl implements ItemsRepo {
  final ItemsDataSource dataSource;

  ItemsRepositoryImpl({required this.dataSource});

  @override
  Future<ItemList> getAllProducts() async {
    final remoteItemsModelList = await dataSource.getAllItems();
    final itemsList = remoteItemsModelList.items
        .map((model) => ItemMapper.fromModel(model))
        .toList();

    return ItemList(items: itemsList);
  }

  @override
  Future<ItemList> getLikedItems() async {
    final remoteItemsModelList = await dataSource.getLikedItems();
    final itemsList = remoteItemsModelList.items
        .map((model) => ItemMapper.fromModel(model))
        .toList();

    return ItemList(items: itemsList);
  }

  @override
  Future<ItemList> getMyItems() async {
    final remoteItemsModelList = await dataSource.getMyItems();
    final itemsList = remoteItemsModelList.items
        .map((model) => ItemMapper.fromModel(model))
        .toList();

    return ItemList(items: itemsList);
  }
}
