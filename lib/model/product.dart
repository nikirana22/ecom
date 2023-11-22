class Product {
  int id;
  String title;
  num price;
  String description;
  String image;
  String category;
  int count = 0;

  Product(this.id, this.title, this.price, this.description, this.image,
      this.category);

  Product.fromMap(Map map)
      : id = map['id'],
        title = map['title'],
        price = map['price'],
        description = map['description'],
        image = map['image'],
        category = map['category'];

  void incCount() => count++;

  void decCount() => count--;
}
