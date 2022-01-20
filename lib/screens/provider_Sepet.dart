import 'package:flutter/material.dart';
import 'package:flutter_provider_deneme_1/models/product.dart';
import 'package:flutter_provider_deneme_1/state/product_state.dart';
import 'package:provider/provider.dart';

class ProviderSepeti extends StatefulWidget {
  const ProviderSepeti({Key? key}) : super(key: key);

  @override
  State<ProviderSepeti> createState() => _ProviderSepetiState();
}

class _ProviderSepetiState extends State<ProviderSepeti> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductState>(context).product;

    return Scaffold(
        appBar: AppBar(
          title: Text("Sepetim"),
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return Dismissible(
                background: Container(
                  padding: EdgeInsets.only(top: 60, left: 25),
                  color: Colors.red,
                  child: Text(
                    "Sil",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    Provider.of<ProductState>(context, listen: false)
                        .SetProductCount(product);
                  });
                },
                key: UniqueKey(),
                child: Card(
                  elevation: 20,
                  child: product.product_count > 0
                      ? Container(
                          width: double.infinity,
                          height: 150,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 90,
                                      image: AssetImage(product.uri),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    product.product_name +
                                        " " +
                                        product.product_color,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text(
                                  product.product_price + " TL",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                color: Colors.black12,
                                width: 1,
                                height: double.infinity,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    Provider.of<ProductState>(context,
                                            listen: false)
                                        .deleteProductSeptte(product);
                                  });
                                },
                              ),
                              Text(product.product_count.toString()),
                              InkWell(
                                child: Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    Provider.of<ProductState>(context,
                                            listen: false)
                                        .addProductSepette(product);
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              );
            }));
  }
}
