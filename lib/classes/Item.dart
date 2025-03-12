class Item {
  String name;
  String description;
  double price;

  Item({required this.name, required this.description, required this.price});

  @override
  String toString() {
    return 'Item{name: $name, description: $description, price: $price}';
  }
}