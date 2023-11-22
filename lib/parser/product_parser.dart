import '../model/product.dart';

class ProductParser {
  static List<Product> parseProduct(List<dynamic> list) {
    return list.map((e) => Product.fromMap(e)).toList();
  }
}
