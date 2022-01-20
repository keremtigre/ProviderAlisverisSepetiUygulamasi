import 'package:flutter/material.dart';
import 'package:flutter_provider_deneme_1/models/product.dart';

class ProductState with ChangeNotifier {
  List<Product> _productList = [
    Product("Macbook air", "14000", "silver", "assets/mair.jpg", 0, 0),
    Product("Macbook Pro", "17000", "rose", "assets/mpro.jpg", 0, 0),
    Product("Macbook Pro", "17000", "rose", "assets/mpro.jpg", 0, 0),
    Product("Macbook air", "14000", "silver", "assets/mair.jpg", 0, 0),
    Product("Macbook Pro", "17000", "rose", "assets/mpro.jpg", 0, 0),
    Product("Macbook air", "14000", "silver", "assets/mair.jpg", 0, 0),
    Product("Macbook Pro", "17000", "rose", "assets/mpro.jpg", 0, 0),
    Product("Macbook air", "14000", "silver", "assets/mair.jpg", 0, 0),
  ];

  List<Product> get product => _productList;

  void addProduct(Product product) {
    product.sepet_adet++;
    notifyListeners();
  }

  void deleteProduct(Product product) {
    if (product.sepet_adet > 0) {
      product.sepet_adet--;
      notifyListeners();
    }
  }

  void SetProductCount(Product product) {
    product.product_count = 0;
    notifyListeners();
  }

  void sepeteTiklandi(Product product) {
    product.product_count = product.sepet_adet;
    notifyListeners();
  }

  void addProductSepette(Product product) {
    product.product_count++;
    notifyListeners();
  }

  void deleteProductSeptte(Product product) {
    if (product.product_count > 0) {
      product.product_count--;
      notifyListeners();
    }
  }
}
