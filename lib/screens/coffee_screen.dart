import 'package:flutter/material.dart';
import '../widgets/coffee_item.dart';
import '../classes/coffee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoffeeScreen extends StatelessWidget {
  final bool active;
  CoffeeScreen(this.active);
  static const routeName = '/coffee';
  @override
  Widget build(BuildContext context) {
    final List<Coffee> loadedCoffees = [
      Coffee(
        id: 'c1',
        title: AppLocalizations.of(context).c1title,
        region: AppLocalizations.of(context).c1region,
        altitude: AppLocalizations.of(context).c1altitude,
        process: AppLocalizations.of(context).c1process,
        varietal: AppLocalizations.of(context).c1varietal,
        cupping: AppLocalizations.of(context).c1cupping,
        description: AppLocalizations.of(context).c1description,
        imageUrl: 'assets/images/ethiopia.jpg',
      ),
      Coffee(
        id: 'c2',
        title: AppLocalizations.of(context).c2title,
        region: AppLocalizations.of(context).c2region,
        altitude: AppLocalizations.of(context).c2altitude,
        process: AppLocalizations.of(context).c2process,
        varietal: AppLocalizations.of(context).c2varietal,
        cupping: AppLocalizations.of(context).c2cupping,
        description: AppLocalizations.of(context).c2description,
        imageUrl: 'assets/images/columbia 2.jpg',
      ),
      Coffee(
        id: 'c3',
        title: AppLocalizations.of(context).c3title,
        region: AppLocalizations.of(context).c3region,
        altitude: AppLocalizations.of(context).c3altitude,
        process: AppLocalizations.of(context).c3process,
        varietal: AppLocalizations.of(context).c3varietal,
        cupping: AppLocalizations.of(context).c3cupping,
        description: AppLocalizations.of(context).c3description,
        imageUrl: 'assets/images/columbia.jpg',
      ),
      Coffee(
        id: 'c4',
        title: AppLocalizations.of(context).c4title,
        region: AppLocalizations.of(context).c4region,
        altitude: AppLocalizations.of(context).c4altitude,
        process: AppLocalizations.of(context).c4process,
        varietal: AppLocalizations.of(context).c4varietal,
        cupping: AppLocalizations.of(context).c4cupping,
        description: AppLocalizations.of(context).c4description,
        imageUrl: 'assets/images/panama.jpg',
      ),
      Coffee(
        id: 'c5',
        title: AppLocalizations.of(context).c5title,
        region: AppLocalizations.of(context).c5region,
        altitude: AppLocalizations.of(context).c5altitude,
        process: AppLocalizations.of(context).c5process,
        varietal: AppLocalizations.of(context).c5varietal,
        cupping: AppLocalizations.of(context).c5cupping,
        description: AppLocalizations.of(context).c5description,
        imageUrl: 'assets/images/burundi.jpg',
      ),
      Coffee(
        id: 'c6',
        title: AppLocalizations.of(context).c6title,
        region: AppLocalizations.of(context).c6region,
        altitude: AppLocalizations.of(context).c6altitude,
        process: AppLocalizations.of(context).c6process,
        varietal: AppLocalizations.of(context).c6varietal,
        cupping: AppLocalizations.of(context).c6cupping,
        description: AppLocalizations.of(context).c6description,
        imageUrl: 'assets/images/indonesia.jpg',
      ),
      Coffee(
        id: 'c7',
        title: AppLocalizations.of(context).c7title,
        region: AppLocalizations.of(context).c7region,
        altitude: AppLocalizations.of(context).c7altitude,
        process: AppLocalizations.of(context).c7process,
        varietal: AppLocalizations.of(context).c7varietal,
        cupping: AppLocalizations.of(context).c7cupping,
        description: AppLocalizations.of(context).c7description,
        imageUrl: 'assets/images/brazil.jpg',
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
                itemCount: loadedCoffees.length,
                itemBuilder: (ctx, i) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/coffeedetail',
                        arguments: loadedCoffees[i].id);
                  },
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(
                          height: 400,
                          width: 300,
                          child: CoffeeItem(
                              loadedCoffees[i].id,
                              loadedCoffees[i].title,
                              loadedCoffees[i].imageUrl,
                              loadedCoffees[i].region),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: Text(
                          loadedCoffees[i].title.toUpperCase(),
                          style: TextStyle(fontSize: 14),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30),
              ),
            ),
          ],
        ));
  }
}
