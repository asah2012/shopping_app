import 'package:flutter/material.dart';
import 'package:shopping_app/provider/cart_item.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartItemWidget extends StatelessWidget {
  CartItem cartItem;
  CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.amberAccent,
        child: const Icon(Icons.delete, size: 40),
        alignment: Alignment.centerRight,
      ),
      key: ValueKey(cartItem.productItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => Provider.of<Cart>(context, listen: false)
          .removeCartItemByCartItemId(cartItem),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Are you sure ?"),
            content: Text("Do you really want to delete the cart Item?"),
            actions: [
              TextButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      child: ListTile(
        leading: Text("${cartItem.productItem.title}",
            style: TextStyle(fontSize: 20)),
        title: Chip(label: Text("${cartItem.productItem.price}")),
        trailing: CircleAvatar(child: Text("X${cartItem.qty}")),
      ),
    );
  }
}
