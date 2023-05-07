import 'package:flutter/material.dart';

import 'order.dart';

class OrderList with ChangeNotifier {
  static List<Order> customerOrderList = [];
  static void addOrderToOrderList(Order order) {
    customerOrderList.add(order);
  }
}
