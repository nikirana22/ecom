import 'package:responsive_sizer/responsive_sizer.dart';
import '/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    final products = provider.products;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart Screen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Amount : \$${provider.allProductCost}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    Product product = products[index];
                    return _buildCard(provider, product);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(CartProvider provider, Product product) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                product.image,
                width: 20.w,
              ),
              SizedBox(width: 3.w),
              Flexible(
                  child: Text(product.title,
                      maxLines: 4, overflow: TextOverflow.ellipsis)),
              SizedBox(width: 3.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: InkWell(
                          onTap: () => provider.addProduct(product),
                          child: const Icon(Icons.add))),
                  Flexible(
                    child: Text(
                      '${product.count}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                        onTap: () => provider.removeProduct(product),
                        child: const Icon(Icons.remove)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
