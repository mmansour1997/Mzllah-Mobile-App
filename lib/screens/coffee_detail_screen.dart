import 'package:flutter/material.dart';
import '../classes/coffee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoffeeDetail extends StatelessWidget {
  static const routeName = '/coffeedetail';

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
    //final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final coffeeId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    Coffee loadedCoffee =
        loadedCoffees.firstWhere((coffee) => coffee.id == coffeeId);
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: deviceHeight / 2,
              width: double.infinity,
              child: Image.asset(
                loadedCoffee.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              loadedCoffee.title.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lyon'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).region + loadedCoffee.region,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).altitude + loadedCoffee.altitude,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).process + loadedCoffee.process,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).varietal + loadedCoffee.varietal,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).cupping + loadedCoffee.cupping,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                (loadedCoffee.description.isNotEmpty
                        ? AppLocalizations.of(context).farm
                        : "") +
                    loadedCoffee.description,
                softWrap: true,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 14),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
