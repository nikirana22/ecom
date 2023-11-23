import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '/model/product.dart';
import '/screen/product_details_screen.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: () => _goToDetailsScreen(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              Hero(tag: product.id, child: Image.network(product.image)),
              const SizedBox(height: 20),
              Text(
                product.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.displaySmall,
              ),
              Text(
                '\$${product.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToDetailsScreen(BuildContext context) {
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }
}
