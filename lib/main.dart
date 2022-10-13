import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/api/product.dart';
import 'package:shop/widgets/products-grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // var products = [
  //   {"name": "Product 1", "image": "https://dkstatics-public.digikala.com/digikala-products/97647566e79f7a5104c34bfc4c9fc6724c8bec5a_1659440534.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90"},
  //   {"name": "Product 2", "image": "https://dkstatics-public.digikala.com/digikala-products/97647566e79f7a5104c34bfc4c9fc6724c8bec5a_1659440534.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90"},
  //   {"name": "Product 3", "image": "https://dkstatics-public.digikala.com/digikala-products/97647566e79f7a5104c34bfc4c9fc6724c8bec5a_1659440534.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90"},
  // ];
  var products = [];

  @override
  void initState() {
    super.initState();
    getProducts().then((value) {
      if (value.statusCode == 200) {
        var json = jsonDecode(value.body);
        var list = [];
        for (var product in json['data']['products']) {
          list.add({
            "name": product['name'],
            "image": product['cover']?[0]?["url"]
          });
        }
        setState(() {
          products = list;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: ProductsGrid(products)
    );
  }
}
