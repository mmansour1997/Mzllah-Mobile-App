import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartScreen extends StatefulWidget {
  final bool active;
  StartScreen(this.active);
  static const routeName = '/start';
  @override
  _StartScreenState createState() => _StartScreenState(active);
}

class _StartScreenState extends State<StartScreen> {
  final bool active;
  _StartScreenState(this.active);
  String token;
  String userId;
  Future<Map<String, dynamic>> myData;

  @override
  void initState() {
    getFireToken();
    super.initState();
  }

  Future<void> getFireToken() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      userId = uid;
    }

    myData = getData(userId);
  }

  Future<Map<String, dynamic>> getData(String userId) async {
    var _database;
    Map<dynamic, dynamic> values;
    try {
      _database = FirebaseDatabase.instance
          .reference()
          .child("userData")
          .orderByChild('userId')
          .equalTo(userId);
      _database.once().then((DataSnapshot snapshot) {
        values = snapshot.value;
      });
      return values;
    } catch (error) {
      //Provider.of<Auth>(context).logout();

      throw error;
    }
  }

  String getName(Map<dynamic, dynamic> map) {
    String name;
    map.forEach((key, value) {
      name = map[key]['firstName'];
    });
    return name;
  }

  String getPoints(Map<dynamic, dynamic> map) {
    String points;
    map.forEach((key, value) {
      points = map[key]['points'];
    });
    double number = double.tryParse(points);
    int trimmed = number.toInt();
    String trimmedString = trimmed.toString();
    return trimmedString;
  }

  String getTotalPoints(Map<dynamic, dynamic> map) {
    String totalPoints;
    map.forEach((key, value) {
      totalPoints = map[key]['totalPoints'];
    });
    double number = double.tryParse(totalPoints);
    int trimmed = number.toInt();
    String trimmedString = trimmed.toString();
    return trimmedString;
  }

  String memberLevel(String points) {
    int number = int.tryParse(points);
    if (number > 3000 && number <= 10000) {
      return AppLocalizations.of(context).silver;
    }
    if (number > 10000 && number <= 20000) {
      return AppLocalizations.of(context).gold;
    }
    if (number > 20000) {
      return AppLocalizations.of(context).platinum;
    } else {
      return AppLocalizations.of(context).none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    double bigmultiplier = 30;

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: active ? null : AppBar(),
      body: FutureBuilder(
        future: FirebaseDatabase.instance
            .reference()
            .child("userData")
            .orderByChild('userId')
            .equalTo(userId)
            .once(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
                child: CircularProgressIndicator()); // widget while loading
          }

          if (!snapshot.hasData) {
            return AlertDialog(
              title: Text('An error occured.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Okay'))
              ],
            ); // widget when error happens
          }

          final data = snapshot.data;

          // Map<String,dynamic>
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 17,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: deviceHeight / 15,
                ),
              ),
              Flexible(
                child: Text(
                  AppLocalizations.of(context).hello +
                      getName(data.value).toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Flexible(
                child: Text(
                  AppLocalizations.of(context).balance,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Text(getPoints(data.value),
                    style: TextStyle(
                      fontFamily: 'Lyon',
                      fontSize: deviceHeight * 0.002 * bigmultiplier,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            onPrimary: Colors.black87,
                          ),
                          child: Text(AppLocalizations.of(context).earnpoints),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/loyaltyprice');
                          })),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            onPrimary: Colors.black87,
                          ),
                          child:
                              Text(AppLocalizations.of(context).redeempoints),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/loyalty');
                          })),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Flexible(
                  child: Text(
                '${AppLocalizations.of(context).accumulated} ${getTotalPoints(data.value)}'
                    .toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 15,
              ),
              Flexible(
                  child: Text(
                '${AppLocalizations.of(context).membership} ${memberLevel(getTotalPoints(data.value))}'
                    .toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 15,
              ),
              Flexible(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  onPrimary: Colors.black87,
                ),
                child: Text(AppLocalizations.of(context).learnmore),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/infoloyalty', arguments: false);
                },
              ))
            ],
          );
        },
      ),
    );
  }
}
