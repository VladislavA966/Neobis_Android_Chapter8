import 'package:dio/dio.dart';
import 'package:neobis_android_chapter8/features/favourite_items/data/models/items_model.dart';

abstract class ItemsDataSource {
  Future<ItemsModelList> getItems();
}

class ItemsDataSoruceImpl implements ItemsDataSource {
  final Dio dio;

  ItemsDataSoruceImpl({required this.dio});
  @override
  Future<ItemsModelList> getItems() async {
    final responce = await dio.get('/api/procut/all');
    if (responce.statusCode == 200) {
      return ItemsModelList.fromJson(responce.data);
    } else {
      throw Error();
    }
  }
}
