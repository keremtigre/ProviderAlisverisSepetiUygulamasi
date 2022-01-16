import 'package:flutter/material.dart';
import 'package:flutter_provider_deneme_1/screens/provider_sepeti_anasayfa.dart';
import 'package:flutter_provider_deneme_1/state/product_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProductState();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Sepeti',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: ProviderSepetiAnasayfa(),
      ),
    );
  }
}
