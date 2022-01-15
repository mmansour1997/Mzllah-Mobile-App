import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String region;

  CoffeeItem(this.id, this.title, this.imageUrl, this.region);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
