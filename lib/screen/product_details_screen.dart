import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/cart_provider.dart';
import '/model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/screen/product_detail_screen';
  final Product product;

  const ProductDetailScreen({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Hero(
                  tag: product.id,
                  child: Image.network(product.image, height: 42.h)),
            ),
            const SizedBox(height: 20),
            Text(product.title, style: theme.textTheme.displayMedium),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: theme.textTheme.displaySmall,
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () => _addToCart(context),
              style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(7.h),
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'Add to Cart',
                style: theme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    context.read<CartProvider>().addProduct(product);
    _showSnackBar(context);
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
    messengerState.removeCurrentSnackBar();
    messengerState.showSnackBar(const SnackBar(
        content:
            Text('Product added successfully', textAlign: TextAlign.center),
        backgroundColor: Colors.green));
  }
}
