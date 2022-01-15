import 'package:flutter/material.dart';
import '../custom_icons_icons.dart' as CustomIcons;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _MenuItem {
  final IconData icon;
  final String title;
  final Color color;
  final String id;
  _MenuItem(this.icon, this.title, this.color, this.id);
}

class HomeItemsScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeItemsScreenState createState() => _HomeItemsScreenState();
}

class _HomeItemsScreenState extends State<HomeItemsScreen> {
  int _selectedIndex = 0;
  void selectItem(BuildContext ctx, String id) {
    if (id == 'c1') {
      Navigator.of(ctx).pushNamed('/about');
    } else if (id == 'c2') {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.of(ctx).pushNamed('/start')
          : Navigator.of(ctx).pushNamed('/infoloyalty', arguments: false);
    } else if (id == 'c3') {
      Navigator.of(ctx).pushNamed('/brew');
    } else if (id == 'c4') {
      FirebaseAuth.instance.currentUser != null
          ? Navigator.of(ctx).pushNamed('/journallist')
          : Navigator.of(ctx).pushNamed('/infojournal', arguments: false);
    } else if (id == 'c5') {
      Navigator.of(ctx).pushNamed('/location');
    } else if (id == 'c6') {
      Navigator.of(ctx).pushNamed('/coffee');
    }
  }

  List menuList = [
    _MenuItem(CustomIcons.CustomIcons.loyalty_new, 'LOYALTY PROGRAM',
        Colors.orange.shade200, 'c2'),
    _MenuItem(CustomIcons.CustomIcons.about, 'ABOUT MZLLAH',
        Colors.amber.shade100, 'c1'),
    _MenuItem(CustomIcons.CustomIcons.journal, 'COFFEE JOURNAL',
        Colors.amber.shade100, 'c4'),
    _MenuItem(CustomIcons.CustomIcons.loyalty, 'OUR                COFFEE',
        Colors.orange.shade200, 'c6'),
    _MenuItem(CustomIcons.CustomIcons.location, 'CONTACT           US',
        Colors.orange.shade200, 'c5'),
    _MenuItem(CustomIcons.CustomIcons.calc, 'BREW CALCULATOR',
        Colors.amber.shade100, 'c3'),
  ];
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    List menuList = [
      _MenuItem(
          CustomIcons.CustomIcons.loyalty_new,
          AppLocalizations.of(context).loyaltyprogram,
          Colors.orange.shade200,
          'c2'),
      _MenuItem(
          CustomIcons.CustomIcons.about,
          AppLocalizations.of(context).aboutmzllah,
          Colors.amber.shade100,
          'c1'),
      _MenuItem(
          CustomIcons.CustomIcons.journal,
          AppLocalizations.of(context).coffeejournal,
          Colors.amber.shade100,
          'c4'),
      _MenuItem(CustomIcons.CustomIcons.loyalty,
          AppLocalizations.of(context).ourcoffee, Colors.orange.shade200, 'c6'),
      _MenuItem(CustomIcons.CustomIcons.location,
          AppLocalizations.of(context).contactus, Colors.orange.shade200, 'c5'),
      _MenuItem(
          CustomIcons.CustomIcons.calc,
          AppLocalizations.of(context).brewcalculator,
          Colors.amber.shade100,
          'c3'),
    ];

    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover))),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: deviceHeight / 7,
                                width: deviceWidth / 1.5,
                                decoration: BoxDecoration(
                                    image: new DecorationImage(
                                  image: ExactAssetImage(
                                    'assets/images/logo.png',
                                  ),
                                  fit: BoxFit.contain,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Directionality(
                            textDirection:
                                AppLocalizations.of(context).language ==
                                        "English"
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                            child: Container(
                              width: (deviceWidth *
                                          MediaQuery.of(context)
                                              .devicePixelRatio) >
                                      1500
                                  ? deviceWidth * 0.32
                                  : deviceWidth * 0.70,
                              child: GridView.builder(
                                physics: new NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: deviceHeight / 50,
                                  childAspectRatio: 1,
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, position) {
                                  return Center(
                                    child: Center(
                                      child: InkWell(
                                        onLongPress: () {
                                          setState(() {
                                            if (_selectedIndex == position) {
                                              _selectedIndex = -1;
                                            } else {
                                              _selectedIndex = position;
                                            }
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            if (_selectedIndex == position) {
                                              _selectedIndex = -1;
                                            } else {
                                              _selectedIndex = position;
                                            }
                                          });
                                          selectItem(
                                              context, menuList[position].id);
                                        },
                                        child: Card(
                                          elevation: 0,
                                          color: menuList[position].color,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100.0)),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      Alignment(1.5, -0.5),
                                                  child: Icon(
                                                    menuList[position].icon,
                                                    size: 60,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Flexible(
                                                child: Container(
                                                  width: 100,
                                                  child: Align(
                                                    alignment:
                                                        Alignment(0, -3.0),
                                                    child: Text(
                                                      menuList[position].title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: menuList.length,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
