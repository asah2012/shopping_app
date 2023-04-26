import 'package:flutter/material.dart';
import '../provider/product.dart';

class DummyData {
  List<Map<String, String>> listOfProducts = [
    {
      'id': 'p1',
      'title': 'Red Shirt',
      'description': 'A red shirt - it is pretty red!',
      'price': '29.99',
      'imageUrl':
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    },
    {
      'id': 'p2',
      'title': 'Trousers',
      'description': 'A nice pair of trousers.',
      'price': '59.99',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    },
    {
      'id': 'p3',
      'title': 'Yellow Scarf',
      'description': 'Warm and cozy - exactly what you need for the winter.',
      'price': '19.99',
      'imageUrl':
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    },
    {
      'id': 'p4',
      'title': 'A Pan',
      'description': 'Prepare any meal you want.',
      'price': '49.99',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    },
  ];
}

class Products with ChangeNotifier {
  List<Product> _productList = [];

  Products() {
    print("Products constructor called");
    _productList = initProductList();
  }

  List<Product> get productList {
    if (_productList.isEmpty)
      return initProductList();
    else
      return [..._productList];
  }

  void add(Product newProduct) {
    _productList.add(newProduct);
  }

  Product findById(String productId) {
    return _productList.firstWhere((prd) => prd.id == productId);
  }

  void updateProductList(Product prd) {
    _productList.removeWhere((xprd) => xprd.id == prd.id);
    _productList.add(prd);
  }

  List<Product> initProductList() {
    List<Map<String, String>> productMapList = DummyData().listOfProducts;
    List<Product> productList = [];

    for (int i = 0; i < productMapList.length; i++) {
      Product tempProduct = Product(
          id: productMapList[i]["id"] as String,
          title: productMapList[i]["title"] as String,
          description: productMapList[i]["description"] as String,
          price: double.parse(productMapList[i]["price"] as String),
          imageUrl: productMapList[i]["imageUrl"] as String);
      productList.add(tempProduct);
    }
    return productList;
  }

  List<Product> getProductListByFilter(List<Map<String, String>> filter) {
    print("filter in products : $filter");
    List<Product> filteredList = [..._productList];
    if (filter.isEmpty) {
      print("products : returning $filteredList");
      return filteredList;
    }

    for (int i = 0; i < filter.length; i++) {
      Map<String, String> filterItem = filter[i];
      String filterKey = filterItem.entries.first.key;
      String filerValue = filterItem[filterKey] as String;
      if (filterKey == 'isFavorite') {
        filteredList.removeWhere((product) => !product.isFavorite);
      }
    }
    //notifyListeners();
    return filteredList;
  }
}
