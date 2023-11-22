import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screen/product_screen.dart';
import '/provider/home_provider.dart';
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
    int index =
        context.select<HomeProvider, int>((value) => value.currentPageIndex);

    return Scaffold(
      body: SafeArea(child: _screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) => context.read<HomeProvider>().updateIndex(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_outlined), label: 'Checkout')
        ],
      ),
    );
  }
}
