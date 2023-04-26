import 'dart:async';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite = false;
  //static Products product_item_handler = Products();

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl});

  final _myEventStreamController = StreamController<Product>();
  Stream<Product> get onlyMyEvent => _myEventStreamController.stream;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    // print("title : $title is marked as favorite as $isFavorite");
    //print("productList is ${Products().productList.length}");
    //Products.updateProductList(this);
    notifyListeners();
  }
}
