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
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Lato',
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              bodyLarge: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                  fontFamily: 'Anton',
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
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
