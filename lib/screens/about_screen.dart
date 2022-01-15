import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: deviceWidth,
                  height: deviceHeight * 35 / 100,
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('assets/images/lpg.jpg'))),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: deviceHeight / 10,
                width: deviceWidth / 5,
                decoration: BoxDecoration(
                    image: new DecorationImage(
                  image: ExactAssetImage(
                    'assets/images/Mzllah_icon-01.png',
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  AppLocalizations.of(context).abouttitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lyon'),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    AppLocalizations.of(context).abouttext,
                    style: TextStyle(fontSize: 16, height: 1.8),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    AppLocalizations.of(context).abouttext2,
                    style: TextStyle(fontSize: 16, height: 1.8),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
