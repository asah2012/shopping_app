import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/widgets/product_item.dart';
import '../provider/products.dart';

class ProductScreen extends StatelessWidget {
  static String route = '/product_screen';

  @override
  Widget build(BuildContext context) {
    final tempProducts = Provider.of<Products>(context);
    List<Product> productList = tempProducts.productList;
    return Scaffold(
        appBar: AppBar(title: const Text("My Shopping App")),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: productList.length,
            itemBuilder: (ctx, i) => ProductItem(
                id: productList[i].id,
                title: productList[i].title,
                imageURL: productList[i].imageUrl)));
  }
}
