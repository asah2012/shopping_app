import 'package:flutter/material.dart';

import './product.dart';

class CartItem {
  late Product _productItem;
  late int _qty;

  CartItem(Product prd) {
    _productItem = prd;
    _qty = 1;
  }
  Product get productItem {
    return _productItem;
  }

  int get qty {
    return _qty;
  }

  void incrementQty() {
    _qty++;
  }

  void decrementQty() {
    _qty--;
  }

  double totalPrice() {
    return qty * (productItem.price);
  }
}
