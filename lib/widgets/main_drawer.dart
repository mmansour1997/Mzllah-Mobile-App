import 'package:flutter/material.dart';
import '../screens/about_screen.dart';
import '../screens/brew_screen.dart';
import '../screens/location_screen.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/locale_provider.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function tapHandler) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lyon'),
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(252, 249, 242, 1),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/logo.png')),
              ),
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildListTile(AppLocalizations.of(context).home.toUpperCase(),
                      () {
                    Navigator.of(context).pushNamed('/');
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  buildListTile(AppLocalizations.of(context).loyaltyprogram,
                      () {
                    FirebaseAuth.instance.currentUser != null
                        ? Navigator.of(context).pushNamed('/start')
                        : Navigator.of(context)
                            .pushNamed('/infoloyalty', arguments: false);
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  buildListTile(AppLocalizations.of(context).coffeejournal, () {
                    FirebaseAuth.instance.currentUser != null
                        ? Navigator.of(context).pushNamed('/journallist')
                        : Navigator.of(context)
                            .pushNamed('/infojournal', arguments: false);
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  buildListTile(AppLocalizations.of(context).brewcalculator,
                      () {
                    Navigator.of(context).pushNamed(BrewScreen.routeName);
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  buildListTile(AppLocalizations.of(context).aboutus, () {
                    Navigator.of(context).pushNamed(AboutScreen.routeName);
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  buildListTile(AppLocalizations.of(context).contactusdrawer,
                      () {
                    Navigator.of(context).pushNamed(LocationScreen.routeName);
                  }),
                  Divider(
                    thickness: 2,
                    indent: 120,
                    endIndent: 120,
                  ),
                  provider.locale.toString() != "ar"
                      ? ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Center(
                              child: Align(
                            alignment: Alignment(-0.4, 0),
                            child: Text(
                              AppLocalizations.of(context).logout,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lyon'),
                            ),
                          )),
                          onTap: () {
                            Navigator.of(context).pop();
                            Provider.of<Auth>(context, listen: false).logout();
                            final _snackBar = SnackBar(
                                content: Text('Successfully logged out.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar);
                          },
                        )
                      : Container(),
                  provider.locale.toString() == "ar"
                      ? ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Center(
                              child: Align(
                            alignment: Alignment(0.4, 0),
                            child: Text(
                              AppLocalizations.of(context).logout,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lyon'),
                            ),
                          )),
                          onTap: () {
                            Navigator.of(context).pop();
                            Provider.of<Auth>(context, listen: false).logout();
                            final _snackBar = SnackBar(
                                content: Text('Successfully logged out.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(_snackBar);
                          },
                        )
                      : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Theme.of(context).primaryColor),
                          child: Text(
                            "EN",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            final provider = Provider.of<LocaleProvider>(
                                context,
                                listen: false);
                            provider.setLocale(Locale('en'));
                          }),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Theme.of(context).primaryColor),
                          child: Text(
                            "عربي",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            final provider = Provider.of<LocaleProvider>(
                                context,
                                listen: false);
                            provider.setLocale(Locale('ar'));
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
