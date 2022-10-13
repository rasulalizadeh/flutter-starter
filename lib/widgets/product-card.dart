import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  String image;
  String name;

  ProductCard(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(image, height: 100),
          Text(name)
        ],
      ),
    );
  }



}