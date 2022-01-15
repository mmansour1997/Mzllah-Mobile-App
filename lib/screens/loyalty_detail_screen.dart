import 'package:flutter/material.dart';
import '../classes/product.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoyaltyDetailScreen extends StatefulWidget {
  static const routeName = '/loyaltydetail';

  @override
  _LoyaltyDetailScreenState createState() => _LoyaltyDetailScreenState();
}

class _LoyaltyDetailScreenState extends State<LoyaltyDetailScreen> {
  String token;
  String userId;
  String universalKey;
  Future<Map<String, dynamic>> myData;
  Future<Map<String, dynamic>> myCode;
  String qrCode = 'my code';
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

  // String getPoints(Map<String, dynamic> map) {
  //   String points;
  //   map.forEach((key, value) {
  //     points = map[key]['points'];
  //   });
  //   return points;
  // }

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

  void refresh(BuildContext context) async {
    await Provider.of<Auth>(context, listen: false).getData(token, userId);
  }

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
    final deviceWidth = MediaQuery.of(context).size.width;
    //final deviceHeight = MediaQuery.of(context).size.height;
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    Product loadedProduct =
        loadedProducts.firstWhere((product) => product.id == productId);
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: AppBar(),
      body: FutureBuilder(
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
          return Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 400,
                child: Text(
                  loadedProduct.title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lyon'),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                '${loadedProduct.price}' + AppLocalizations.of(context).points,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lyon'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(fontFamily: 'Lyon', fontSize: 16),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 40,
                      width: deviceWidth * 2 / 3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            onPrimary: Colors.black87,
                          ),
                          child: Text(AppLocalizations.of(context).redeemitem),
                          onPressed: () async {
                            // String key;
                            // Iterable keys = data.keys;
                            // key = keys.elementAt(0);
                            String code;
                            code = getCode(codedata);
                            await scanQRCode();
                            if (code == qrCode) {
                              double points;
                              points = double.tryParse(getPoints(data.value));

                              int newPoints = points.toInt();

                              if (newPoints < loadedProduct.price) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('An error occured'),
                                        content: Text(
                                            'Cannot redeem item. Not enough points.'),
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
                                return;
                              }

                              int finalPoints = newPoints - loadedProduct.price;

                              final database =
                                  FirebaseDatabase.instance.reference();

                              final userref =
                                  database.child('userData/$universalKey');

                              try {
                                await userref.update({
                                  'points': finalPoints.toString(),
                                });
                              } catch (error) {
                                Provider.of<Auth>(context, listen: false)
                                    .logout();
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
                          })),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
