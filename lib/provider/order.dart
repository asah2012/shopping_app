import 'package:shopping_app/provider/cart_item.dart';
import 'package:shopping_app/provider/order_item.dart';
import 'package:shopping_app/provider/order_list.dart';

import 'cart.dart';

class Order {
  static int orderId = 1;
  late int orderKey;
  late DateTime orderDate;
  late double orderValue;
  late int orderUnits;
  late List<OrderItem> orderItemList;

  void incrementOrderId() {
    orderId++;
  }

  int getCurrentOrderIdValue() {
    return orderId;
  }

  int createOrder(
      DateTime orderDate, double orderValue, int orderUnits, Cart cartObject) {
    List<OrderItem> xOrderItemList = [];
    List<CartItem> cartItemList = cartObject.cartItems;
    for (int i = 0; i < cartItemList.length; i++) {
      xOrderItemList.add(OrderItem(
          productItem: cartItemList[i].productItem, qty: cartItemList[i].qty));
    }
    this.orderDate = orderDate;
    this.orderUnits = orderUnits;
    this.orderValue = orderValue;
    orderKey = getCurrentOrderIdValue();
    orderItemList = [...xOrderItemList];

    incrementOrderId();
    OrderList.addOrderToOrderList(this);
    return orderKey;
  }
}
