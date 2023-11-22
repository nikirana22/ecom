import '/manager/api_manager.dart';
import '/parser/product_parser.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  Future<List<Product>> fetchProduct() async {
    if (_products.isEmpty) {
      _products = ProductParser.parseProduct(await ApiManager().getProducts());
    }
    return _products;
  }
}
