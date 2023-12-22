import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/repo/items_repo.dart';

class ItemsUseCase {
  final ItemsRepo repository;

  ItemsUseCase({required this.repository});
  Future<ItemList> getAllProducts() {
    return repository.getAllProducts();
  }

  Future<ItemList> getLikedItems() {
    return repository.getLikedItems();
  }

  Future<ItemList> getMyItems() {
    return repository.getMyItems();
  }
}
