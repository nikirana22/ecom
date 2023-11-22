import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => [..._products];

  double get allProductCost => _products.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.price * element.count));

  void addProduct(Product item) {
    if (!_hasProductAdded(item.id)) {
      _products.add(item);
    }
    item.incCount();
    notifyListeners();
  }

  void removeProduct(Product item) {
    if (item.count > 1) {
      item.decCount();
    } else {
      _products.remove(item);
    }
    notifyListeners();
  }

  bool _hasProductAdded(int id) {
    return _products.where((element) => element.id == id).isNotEmpty;
  }
}
