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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Cart Screen',
        style: theme.textTheme.displayMedium,
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///toStringAsFixed because i'm showing only 2 no after decimal like 2.3453322 -> 2.34
            Text(
              'Total Amount : \$${provider.allProductCost.toStringAsFixed(2)}',
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
      height: 12.h,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 1.h),
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
