import 'dart:async';

import './product.dart';

class Notifier {
  final _myEventStreamController = StreamController<Product>();
  Stream<Product> get onlyMyEvent => _myEventStreamController.stream;
}
