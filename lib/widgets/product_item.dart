import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../provider/product.dart';
import '../screens/cart_screen.dart';

class ProductItem extends StatelessWidget {
  //  final String id;
  // final String title;
  // final String imageURL;

  // ProductItem({required this.id, required this.title, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    Product productItem = Provider.of<Product>(context);
    //var favProductList = Provider.of<FavoriteProduct>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: Consumer<Cart>(
              builder: (context, cart, child) => Badge(
                    backgroundColor: Colors.amberAccent,
                    label: Text('${cart.cartItemCount(productItem)}'),
                    child: IconButton(
                        icon: const Icon(Icons.shopping_bag),
                        onPressed: () {
                          cart.addProductToCart(productItem);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Item ${productItem.title} is added to the cart"),
                            action: SnackBarAction(
                                label: "UNDO",
                                onPressed: () => cart
                                    .decrementCartItemByProduct(productItem)),
                          ));
                        }),
                  )),
          title: Text(
            productItem.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Colors.redAccent,
            icon: Icon(productItem.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () => productItem.toggleFavorite(),
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Image.network(productItem.imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
