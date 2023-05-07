import '../provider/product.dart';

class OrderItem {
  Product productItem;
  int qty;

  OrderItem({required this.productItem, required this.qty});
}
