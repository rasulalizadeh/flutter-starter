import 'package:flutter/material.dart';
import 'package:shop/widgets/product-card.dart';

class ProductsGrid extends StatelessWidget {

  var products = [];

  ProductsGrid(this.products);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16),
      children: [
        for (var product in products)
          ProductCard(product["name"] ?? "", product["image"] ?? "")
      ],
    );
  }

}