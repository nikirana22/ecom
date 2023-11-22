import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
import '../provider/product_provider.dart';
import '../widgets/product_container.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: FutureBuilder<List<Product>>(
          future: productProvider.fetchProduct(),
          builder: (_, snapShot) {
            if (snapShot.hasData) {
              List<Product> products = snapShot.data!;
              return SingleChildScrollView(
                child: StaggeredGrid.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(products.length, (index) {
                      final product = products[index];
                      return ProductContainer(product: product);
                    })),
              );
            } else if (snapShot.hasError) {
              _showErrorSnackBar(context);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  void _showErrorSnackBar(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('SomeThing went wrong please try again')));
    });
  }
}
