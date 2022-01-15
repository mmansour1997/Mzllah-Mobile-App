import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import '../classes/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoyaltyScreen extends StatelessWidget {
  final bool active;
  LoyaltyScreen(this.active);
  static const routeName = '/loyalty';
  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = [
      Product(
        id: 'p1',
        title: AppLocalizations.of(context).p1title,
        description: AppLocalizations.of(context).p1description,
        price: 200,
        imageUrl: 'assets/images/Free Coffee Beverage.jpg',
      ),
      Product(
        id: 'p2',
        title: AppLocalizations.of(context).p2title,
        description: AppLocalizations.of(context).p2description,
        price: 500,
        imageUrl: 'assets/images/Free pastries.jpg',
      ),
      Product(
        id: 'p3',
        title: AppLocalizations.of(context).p3title,
        description: AppLocalizations.of(context).p3description,
        price: 1000,
        imageUrl: 'assets/images/Free Classic Range Coffee Beans.jpg',
      ),
      Product(
        id: 'p4',
        title: AppLocalizations.of(context).p4title,
        description: AppLocalizations.of(context).p4description,
        price: 2000,
        imageUrl: 'assets/images/Free High Range Coffee Beans.jpg',
      ),
      Product(
        id: 'p5',
        title: AppLocalizations.of(context).p5title,
        description: AppLocalizations.of(context).p5description,
        price: 5000,
        imageUrl: 'assets/images/Free Vip Range Coffee Beans.jpg',
      ),
      Product(
        id: 'p6',
        title: AppLocalizations.of(context).p6title,
        description: AppLocalizations.of(context).p6description,
        price: 10000,
        imageUrl: 'assets/images/Free Cupping Course.jpg',
      ),
      Product(
        id: 'p7',
        title: AppLocalizations.of(context).p7title,
        description: AppLocalizations.of(context).p7description,
        price: 12000,
        imageUrl: 'assets/images/Free Brewing Course.jpg',
      ),
      Product(
        id: 'p8',
        title: AppLocalizations.of(context).p8title,
        description: AppLocalizations.of(context).p8description,
        price: 17000,
        imageUrl: 'assets/images/Free Barista Course.jpg',
      ),
    ];
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: active ? null : AppBar(),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: loadedProducts.length,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/loyaltydetail',
                        arguments: loadedProducts[i].id);
                  },
                  child: ProductItem(
                      loadedProducts[i].id,
                      loadedProducts[i].title,
                      loadedProducts[i].imageUrl,
                      loadedProducts[i].price.toString()),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
              ),
            ),
          ],
        ));
  }
}
