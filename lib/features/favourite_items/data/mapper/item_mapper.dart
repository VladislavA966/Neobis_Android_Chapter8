import 'package:neobis_android_chapter8/features/favourite_items/data/models/items_model.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';

class ItemMapper {
  static Item fromModel(ItemModel model) {
    return Item(
      id: model.id,
      name: model.name,
      price: model.price,
      likes: model.likes,
    );
  }
}
