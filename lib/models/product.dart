class Product {
  late String product_name;
  late String product_price;
  late String product_color;
  late String uri;
  late int product_count;
  late int sepet_adet;

  Product(String name, String price, String color, String uri, int count,
      int adet) {
    this.product_name = name;
    this.product_price = price;
    this.product_color = color;
    this.uri = uri;
    this.product_count = count;
    this.sepet_adet = adet;
  }
}
