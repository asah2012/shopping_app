import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/provider/cart_item.dart';
import './cart_screen.dart';
import '../widgets/product_item.dart';
import '../provider/products.dart';
import '../provider/product.dart';

enum choices {
  All,
  Favorites,
}

class ProductScreen extends StatefulWidget {
  static String route = '/product_screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //bool _isFavoriteFilterOn = false;
  List<Map<String, String>> filterList = [];
  List<Product> productList = [];
  bool isFilterSet = false;
  void navigateToCartScreen() {
    Navigator.of(context).pushNamed(CartScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    print("filterList : $filterList");
    var tempProducts = Provider.of<Products>(context);
    setState(() => {if (!isFilterSet) productList = tempProducts.productList});
    return Scaffold(
        appBar: AppBar(title: const Text("My Shopping App"), actions: [
          PopupMenuButton(
              onSelected: (value) => {
                    setState(() {
                      if (value == choices.Favorites) {
                        filterList.add({'isFavorite': 'true'});
                        isFilterSet = true;
                      }
                      if (value == choices.All) {
                        filterList.removeRange(0, filterList.length);
                        isFilterSet = false;
                      }
                      productList =
                          tempProducts.getProductListByFilter(filterList);
                    })
                  },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        value: choices.All, child: Text("All Products")),
                    const PopupMenuItem(
                        value: choices.Favorites, child: Text("My Favorites")),
                  ]),
          Consumer<Cart>(
              builder: (context, cart, child) => Badge(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text('${cart.itemsInCart()}'),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag),
                      onPressed: () => navigateToCartScreen(),
                    ),
                  )),
        ]),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: productList.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: productList[i],
                  child: ProductItem(),
                )));
  }
}
