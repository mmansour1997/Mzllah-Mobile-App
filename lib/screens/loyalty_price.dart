import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoyaltyPrice extends StatefulWidget {
  static const routeName = '/loyaltyprice';
  @override
  _LoyaltyPriceState createState() => _LoyaltyPriceState();
}

class _LoyaltyPriceState extends State<LoyaltyPrice> {
  String token;
  String userId;
  String universalKey;
  Future<Map<String, dynamic>> myData;
  Future<Map<String, dynamic>> myCode;
  String qrCode = 'my code';
  TextEditingController pointsController = TextEditingController();
  var mybuilder;

  // @override
  // void initState() {
  //   final authData = Provider.of<Auth>(context, listen: false);
  //   token = authData.token;
  //   userId = authData.userId;
  //   myData = Provider.of<Auth>(context, listen: false)
  //       .getData(authData.token, authData.userId);
  //   myCode = Provider.of<Auth>(context, listen: false).getCode();
  //   super.initState();
  // }
  @override
  void initState() {
    getFireToken();
    mybuilder = FutureBuilder(
      future: Future.wait([
        FirebaseDatabase.instance
            .reference()
            .child("userData")
            .orderByChild('userId')
            .equalTo(userId)
            .once(),
        myCode
      ]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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

        final data = snapshot.data[0];

        final codedata = snapshot.data[1];
        final deviceWidth = MediaQuery.of(context).size.width;
        final deviceHeight = MediaQuery.of(context).size.height;
        // Map<String,dynamic>
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            ]),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  AppLocalizations.of(context).loyaltytabtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lyon'),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight / 10,
            ),
            SizedBox(
              width: 200,
              child: Text(
                AppLocalizations.of(context).baristatext,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pointsController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(20)),
                      labelText: AppLocalizations.of(context).amount,
                      labelStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(20))),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      onPrimary: Colors.black87,
                    ),
                    child: Text(AppLocalizations.of(context).submit),
                    onPressed: () async {
                      if (pointsController.text.isNotEmpty) {
                        //String key;
                        //Iterable keys = data.keys;
                        //key = data.key;
                        String code;
                        code = getCode(codedata);
                        await scanQRCode();
                        if (code == qrCode) {
                          double points;
                          double totalPoints;
                          points = double.tryParse(getPoints(data.value));

                          totalPoints =
                              double.tryParse(getTotalPoints(data.value));

                          double newPoints =
                              double.tryParse(pointsController.text);

                          double finalPoints = points + newPoints;
                          double finalTotalPoints = totalPoints + newPoints;
                          final database =
                              FirebaseDatabase.instance.reference();

                          final userref =
                              database.child('userData/$universalKey');

                          try {
                            await userref.update({
                              'points': finalPoints.toString(),
                              'totalPoints': finalTotalPoints.toString()
                            });
                          } catch (error) {
                            Provider.of<Auth>(context, listen: false).logout();

                            throw error;
                          }
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed('/tabs')
                              .then((value) => refresh(context));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('An error occured'),
                                  content: Text(
                                      'Scanning failed! Please try again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('An error occured'),
                                content: Text('Please enter a valid amount.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Okay'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    })),
          ],
        );
      },
    );
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
    myCode = Provider.of<Auth>(context, listen: false).getCode();
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

        values.forEach((key, values) {
          universalKey = key;
        });
      });
      return values;
    } catch (error) {
      //Provider.of<Auth>(context).logout();
      throw error;
    }
  }

  void refresh(BuildContext context) async {
    await Provider.of<Auth>(context, listen: false).getData(token, userId);
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

  String getCode(Map<String, dynamic> map) {
    String code;

    code = map['qrcode'];

    return code;
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: AppBar(),
        body: mybuilder);
  }
}
