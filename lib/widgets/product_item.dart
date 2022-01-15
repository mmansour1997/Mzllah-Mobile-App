import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String price;

  ProductItem(this.id, this.title, this.imageUrl, this.price);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Container(
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontFamily: 'Lyon'),
          ),
        ),
        subtitle: FittedBox(
          child: Text(
            price + AppLocalizations.of(context).points,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lyon'),
          ),
        ),
      ),
    );
  }
}
