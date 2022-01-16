import 'package:flutter/material.dart';
import 'package:flutter_provider_deneme_1/models/product.dart';
import 'package:flutter_provider_deneme_1/screens/provider_Sepet.dart';
import 'package:flutter_provider_deneme_1/state/product_state.dart';
import 'package:provider/provider.dart';

class ProviderSepetiAnasayfa extends StatefulWidget {
  ProviderSepetiAnasayfa({Key? key}) : super(key: key);

  @override
  State<ProviderSepetiAnasayfa> createState() => _ProviderSepetiAnasayfaState();
}

class _ProviderSepetiAnasayfaState extends State<ProviderSepetiAnasayfa> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductState>(context).product;
    int sag_ust_Sepet_count_text = 0;
    for (int i = 0; i < products.length; i++) {
      setState(() {
        sag_ust_Sepet_count_text += products[i].product_count;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sepeti"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Text(
                      sag_ust_Sepet_count_text.toString(),
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProviderSepeti())),
                      child: Icon(Icons.shopping_bag)),
                ],
              ))
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(products.length, (index2) {
          String uri = products[index2].uri;
          String name = products[index2].product_name;
          String color = products[index2].product_color;
          String price = products[index2].product_price;
          int count = products[index2].sapet_adet;
          return Card(
            elevation: 20,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Image(
                    image: AssetImage(uri),
                    width: 300,
                    height: 100,
                  ),
                ),
                Text(name + " $color"),
                SizedBox(
                  height: 10,
                ),
                Text(price + " TL"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.remove),
                      onTap: () {
                        setState(() {
                          Provider.of<ProductState>(context, listen: false)
                              .deleteProduct(products[index2]);
                        });
                      },
                    ),
                    Text(count.toString()),
                    InkWell(
                      child: Icon(Icons.add),
                      onTap: () {
                        setState(() {
                          Provider.of<ProductState>(context, listen: false)
                              .addProduct(products[index2]);
                        });
                      },
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        Provider.of<ProductState>(context, listen: false)
                            .sepeteTiklandi(products[index2]);
                      }),
                      child: Container(
                        child: Text("Sepete Ekle"),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
