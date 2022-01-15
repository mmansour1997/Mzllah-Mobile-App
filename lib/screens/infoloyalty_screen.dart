import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoLoyaltyScreen extends StatelessWidget {
  static const routeName = '/infoloyalty';
  final bool tab;
  InfoLoyaltyScreen(this.tab);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    bool arguments = ModalRoute.of(context).settings.arguments;
    if (arguments == null) {
      arguments = true;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: arguments == true ? null : AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  AppLocalizations.of(context).mzllahnewloyalty,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lyon'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text(
                    AppLocalizations.of(context).infoloyalty1,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
                child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      AppLocalizations.of(context).infoloyalty2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ))),
            SizedBox(
              height: 20,
            ),
            Flexible(
                child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      AppLocalizations.of(context).infoloyalty3,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ))),
            FirebaseAuth.instance.currentUser == null
                ? Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          AppLocalizations.of(context).infoloyalty4,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )))
                : Container(),
            FirebaseAuth.instance.currentUser == null
                ? Flexible(
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      onPrimary: Colors.black87,
                    ),
                    child: Text(AppLocalizations.of(context).infoloyalty5),
                    onPressed: () {
                      if (tab == true) {
                        Navigator.of(context)
                            .pushNamed('/auth', arguments: false);
                      } else {
                        Navigator.of(context)
                            .popAndPushNamed('/auth', arguments: false);
                      }
                    },
                  ))
                : Container()
          ],
        ),
      ),
    );
  }
}
