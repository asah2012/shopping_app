import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/cart_item.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static String route = '/CartScreen';
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
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
          Card(
            child: ElevatedButton(
              onPressed: () => {},
              child: const Text("OrderNow"),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
