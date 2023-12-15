class ItemModel {
  final int id;
  final String name;
  final int price;
  final int likes;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.likes,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      likes: json['likes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'likes': likes,
    };
  }
}

class ItemsModelList {
  final List<ItemModel> items;

  ItemsModelList({required this.items});

  factory ItemsModelList.fromJson(List<dynamic> jsonList) {
    List<ItemModel> items =
        jsonList.map((item) => ItemModel.fromJson(item)).toList();
    return ItemsModelList(items: items);
  }

  List<Map<String, dynamic>> toJson() {
    return items.map((item) => item.toJson()).toList();
  }
}
