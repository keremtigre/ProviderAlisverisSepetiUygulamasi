import 'package:flutter/material.dart';
import 'package:flutter_provider_deneme_1/models/product.dart';

class ProductState with ChangeNotifier {
  List<Product> _productList = [
    Product("Macbook air", "14000", "silver", "assets/mair.jpg", 0, 0),
    Product("Macbook Pro", "17000", "rose", "assets/mpro.jpg", 0, 0)
  ];

  List<Product> get product => _productList;

  void addProduct(Product product) {
    product.sapet_adet++;
  }

  void deleteProduct(Product product) {
    if (product.product_count > 0) {
      product.sapet_adet--;
      notifyListeners();
    }
  }

  void sepeteTiklandi(Product product) {
    product.product_count = product.sapet_adet;
  }

  void addProductSepette(Product product) {
    product.product_count++;
  }

  void deleteProductSeptte(Product product) {
    if (product.product_count > 0) {
      product.product_count--;
      notifyListeners();
    }
  }
}
