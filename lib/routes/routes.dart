import 'package:ecom/screen/home_screen.dart';

import '/model/product.dart';
import '/screen/product_details_screen.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ProductDetailScreen.routeName:
      return _buildSlideTransition(
          ProductDetailScreen(product: settings.arguments as Product));
    default:
      // we can throw error if we don't find any RouteName in switch case currently i'm returning HomeScreen
      return _buildSlideTransition(const HomeScreen());
  }
}

PageRouteBuilder _buildSlideTransition(Widget child) {
  return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (_, __, ___) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween =
            Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation);
        return SlideTransition(
          position: tween,
          child: child,
        );
      });
}
