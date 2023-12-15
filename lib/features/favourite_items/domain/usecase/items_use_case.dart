import 'package:neobis_android_chapter8/features/favourite_items/domain/entities/items_entity.dart';
import 'package:neobis_android_chapter8/features/favourite_items/domain/repo/items_repo.dart';

class ItemsUseCase {
  final ItemsRepo repository;

  ItemsUseCase({required this.repository});
  Future<ItemList> call() {
    return repository.getAllProducts();
  }
}
