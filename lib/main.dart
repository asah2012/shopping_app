import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/my_orders_screen.dart';
import '../provider/products.dart';
import '../screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        title: 'Shipping App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductScreen(),
        routes: {
          ProductScreen.route: (ctx) => ProductScreen(),
          CartScreen.route: (ctx) => CartScreen(),
          MyOrdersScreen.route: (ctx) => MyOrdersScreen(),
        },
      ),
    );
  }
}
