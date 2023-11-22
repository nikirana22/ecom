import 'package:dio/dio.dart';

class ApiManager {
  static const String _endPoint = 'https://fakestoreapi.com/products';

  Future<dynamic> getProducts() async {
    final Response response = await Dio().get(_endPoint);
    return response.data;
  }
}
