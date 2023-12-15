class Item {
  final int id;
  final String name;
  final int price;
  final int likes;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.likes,
  });
}

class ItemList {
  final List<Item> items;

  ItemList({required this.items});
}
