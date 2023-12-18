import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';

abstract class ItemsRepo  {
  Future<ItemList> getAllProducts();
}
