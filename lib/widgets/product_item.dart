import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;

  ProductItem({required this.id, required this.title, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Image.network(imageURL, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
