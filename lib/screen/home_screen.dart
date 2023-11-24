import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '/screen/product_screen.dart';
import '/screen/cart_screen.dart';
import '/screen/checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  static const List<Widget> _screens = [
    ProductScreen(),
    CartScreen(),
    CheckoutScreen()
  ];

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _screens,
      items: _buildItems(),
    );
  }

  List<PersistentBottomNavBarItem> _buildItems() {
    return [
      PersistentBottomNavBarItem(
          inactiveColorPrimary: Colors.grey,
          icon: const Icon(Icons.home),
          title: 'Home'),
      PersistentBottomNavBarItem(
          inactiveColorPrimary: Colors.grey,
          icon: const Icon(Icons.add_shopping_cart_outlined),
          title: 'Cart'),
      PersistentBottomNavBarItem(
          inactiveColorPrimary: Colors.grey,
          icon: const Icon(Icons.check_outlined),
          title: 'Checkout'),
    ];
  }
}
