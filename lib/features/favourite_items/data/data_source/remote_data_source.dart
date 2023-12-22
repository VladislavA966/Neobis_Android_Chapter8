import 'package:dio/dio.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/models/items_model.dart';

abstract class ItemsDataSource {
  Future<ItemsModelList> getLikedItems();
  Future<ItemsModelList> getMyItems();
  Future<ItemsModelList> getAllItems();
}

class ItemsDataSoruceImpl implements ItemsDataSource {
  final Dio dio;

  ItemsDataSoruceImpl({required this.dio});
  @override
  Future<ItemsModelList> getLikedItems() async {
    final responce = await dio.get(
      '/api/user/get-liked-products',
      options: Options(
        extra: {"requiresToken": true},
      ),
    );
    if (responce.statusCode == 200) {
      return ItemsModelList.fromJson(responce.data);
    } else {
      throw Error();
    }
  }

  @override
  Future<ItemsModelList> getMyItems() async {
    final responce = await dio.get(
      '/api/user/get-personal-products',
      options: Options(extra: {"requiresToken": true}),
    );
    if (responce.statusCode == 200) {
      return ItemsModelList.fromJson(responce.data);
    } else {
      throw Error();
    }
  }

  @override
  Future<ItemsModelList> getAllItems() async {
    final responce = await dio.get(
      '/api/user/get-liked-products',
      options: Options(
        extra: {
          "requiresToken": true,
        },
      ),
    );
    if (responce.statusCode == 200) {
      return ItemsModelList.fromJson(responce.data);
    } else {
      throw Error();
    }
  }
}
