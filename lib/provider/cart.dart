import 'package:flutter/material.dart';
import './product.dart';
import './cart_item.dart';

class Cart with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems {
    return _cartItems;
  }

  void addProductToCart(Product prd) {
    CartItem ci;
    if (_cartItems.isNotEmpty &&
        _cartItems.any((cartItem) => cartItem.productItem.id == prd.id)) {
      ci = _cartItems
          .firstWhere((cartItem) => cartItem.productItem.id == prd.id);
      ci.incrementQty();
    } else {
      _cartItems.add(CartItem(prd));
    }
    notifyListeners();
  }

  int cartItemCount(Product prd) {
    if (_cartItems.isNotEmpty &&
        _cartItems.any((cartItem) => cartItem.productItem.id == prd.id)) {
      CartItem ci = _cartItems
          .firstWhere((cartItem) => cartItem.productItem.id == prd.id);
      return ci.qty;
    } else {
      return 0;
    }
  }

  int itemsInCart() {
    return _cartItems.length;
  }

  double totalCostOfCart() {
    double cost = 0.0;
    for (int i = 0; i < cartItems.length; i++) {
      CartItem ci = _cartItems[i];
      Product p = ci.productItem;
      cost += p.price * ci.qty;
    }
    return cost;
  }

  void removeCartItemByCartItemId(CartItem ci) {
    cartItems.removeWhere((item) => item.productItem.id == ci.productItem.id);
    notifyListeners();
  }

  void removeCartItemByProduct(Product prd) {
    cartItems.removeWhere((ci) => ci.productItem.id == prd.id);
    notifyListeners();
  }

  void decrementCartItemByCartItemId(CartItem ci) {
    CartItem item =
        cartItems.firstWhere((cix) => cix.productItem.id == ci.productItem.id);
    item.decrementQty();
    notifyListeners();
  }

  void decrementCartItemByProduct(Product prd) {
    CartItem item = cartItems.firstWhere((cix) => cix.productItem.id == prd.id);
    item.decrementQty();
    notifyListeners();
  }
}
