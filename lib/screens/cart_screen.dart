import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/product_screen.dart';
import '../provider/order.dart';
import '../widgets/drawer_shoppingApp.dart';
import '../provider/cart.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static String route = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: DrawerShoppingApp(),
      appBar: AppBar(title: Text("My Cart")),
      body: Column(
        children: [
          Card(
              child: Row(
            children: [
              Text(
                "Total Value",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Spacer(),
              Chip(
                label: Text("\$${cart.totalCostOfCart()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ],
          )),
          Expanded(
            child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemWidget(cart.cartItems[index]);
                }),
          ),
          Visibility(
            visible: cart.itemsInCart() > 0 ? true : false,
            child: Card(
              child: ElevatedButton(
                child: const Text("OrderNow"),
                onPressed: () {
                  int orderId = cart.createOrderFromCart();
                  cart.clearCart();
                  AlertDialog(
                    title: Text("Order Placed"),
                    content: Text(
                      "Your order ID $orderId is placed successfully.",
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(ProductScreen.route);
                          },
                          child: Text("OK"))
                    ],
                  );
                },
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
