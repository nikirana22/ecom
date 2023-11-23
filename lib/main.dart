import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'routes/routes.dart';
import '/provider/cart_provider.dart';
import '/provider/home_provider.dart';
import '/provider/product_provider.dart';
import '/screen/home_screen.dart';

void main() {
  runApp(ResponsiveSizer(builder: (_, __, ___) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: TextTheme(
                displayMedium: TextStyle(fontSize: 18.sp),
                displaySmall: TextStyle(fontSize: 16.sp))),
        home: const HomeScreen(),
      ),
    );
  }
}
