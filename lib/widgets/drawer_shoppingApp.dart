import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/my_orders_screen.dart';
import 'package:shopping_app/screens/product_screen.dart';

class DrawerShoppingApp extends StatelessWidget {
  const DrawerShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 50,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          margin: EdgeInsets.fromLTRB(2.0, 50, 2.0, 0),
          alignment: Alignment.center,
          child: Text(
            "Menu",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Divider(
          thickness: 8,
          color: Colors.black,
        ),
        Column(
          children: [
            ListTile(
              title: Text(
                "Home",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(ProductScreen.route),
            ),
            ListTile(
              title: Text(
                "Cart",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(CartScreen.route),
            ),
            ListTile(
              title: Text(
                "My Orders",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(MyOrdersScreen.route),
            )
          ],
        )
      ]),
    );
  }
}
