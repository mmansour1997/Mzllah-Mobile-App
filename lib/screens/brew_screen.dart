import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrewScreen extends StatefulWidget {
  final bool active;
  BrewScreen(this.active);
  static const routeName = '/brew';
  @override
  _BrewScreenState createState() => _BrewScreenState(active);
}

class _BrewScreenState extends State<BrewScreen> {
  final bool active;
  _BrewScreenState(this.active);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  final TextEditingController _ratioController = TextEditingController();
  TextEditingController _coffeeController = TextEditingController();
  TextEditingController _waterController = TextEditingController();
  bool choice = false;
  double ratio = 15;
  double water;
  double coffee;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    double bigmultiplier = 30;
    double smallmultiplier = 22;
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: active ? null : AppBar(),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: 0,
        builder: (context, snap) {
          final value = snap.data;
          final displayTime = StopWatchTimer.getDisplayTime(value,
              hours: false, milliSecond: false);
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context).brewcalculator,
                style: TextStyle(
                  fontSize: deviceHeight * 0.001 * bigmultiplier,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: deviceHeight / 60,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  AppLocalizations.of(context).brewdescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: deviceHeight * 0.001 * smallmultiplier,
                    color: Colors.black,
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context).brewmeasure,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: deviceHeight * 0.001 * smallmultiplier,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          AlertDialog alert = AlertDialog(
                            title: Text(
                              AppLocalizations.of(context).brewcommand,
                            ),
                            content: TextField(
                              onChanged: (value) {},
                              controller: _ratioController,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context).brewhint,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                    if (coffee == null || water == null) {
                                      setState(() {
                                        try {
                                          ratio = double.parse(
                                              _ratioController.text);
                                        } catch (error) {}
                                      });
                                    } else {
                                      setState(() {
                                        try {
                                          ratio = double.parse(
                                              _ratioController.text);
                                        } catch (error) {}
                                      });
                                    }
                                  },
                                  child:
                                      Text(AppLocalizations.of(context).okay))
                            ],
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              });
                        })
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.001 * bigmultiplier,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Container(
                        width: deviceWidth / 20,
                        child: Text(
                          '/',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.001 * bigmultiplier,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Container(
                        width: deviceWidth / 8,
                        child: Text(
                          ratio.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: deviceHeight * 0.001 * bigmultiplier,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.black,
                  height: 1,
                  width: deviceWidth * 23 / 25,
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context).waterml,
                            style: TextStyle(
                              fontSize: deviceHeight * 0.001 * smallmultiplier,
                              fontFamily: 'Lyon',
                            ),
                          ),
                          Container(
                              child: SizedBox(
                            height: deviceHeight / 20,
                            width: deviceWidth / 4,
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context).ml,
                                  hintStyle: TextStyle(
                                      fontSize:
                                          deviceHeight * 0.001 * bigmultiplier,
                                      fontFamily: 'Lyon',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal)),
                              key: Key(water != null
                                  ? water.toStringAsFixed(0)
                                  : null),
                              onTap: () {
                                AlertDialog alert = AlertDialog(
                                  title: Text(AppLocalizations.of(context)
                                      .watercommand),
                                  content: TextFormField(
                                    onChanged: (value) {},
                                    controller: _waterController,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)
                                          .brewhint200,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          if (_waterController.text.isEmpty) {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            return;
                                          } else {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            setState(() {
                                              if (_waterController
                                                  .text.isNotEmpty) {
                                                water = double.parse(
                                                    _waterController.text);
                                              }

                                              coffee = water / ratio;
                                            });
                                          }
                                        },
                                        child: Text(
                                            AppLocalizations.of(context).okay))
                                  ],
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    });
                              },
                              initialValue: (water == null)
                                  ? null
                                  : water.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Text('   '),
                          Container(
                            height: deviceHeight / 20,
                            width: deviceWidth / 20,
                            child: Text(
                              '/',
                              style: TextStyle(
                                fontSize: deviceHeight * 0.001 * bigmultiplier,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Text(AppLocalizations.of(context).coffeegr,
                              style: TextStyle(
                                fontSize:
                                    deviceHeight * 0.001 * smallmultiplier,
                                fontFamily: 'Lyon',
                              )),
                          Container(
                              child: SizedBox(
                            height: deviceHeight / 20,
                            width: deviceWidth / 4,
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context).gr,
                                  hintStyle: TextStyle(
                                      fontSize:
                                          deviceHeight * 0.001 * bigmultiplier,
                                      fontFamily: 'Lyon',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal)),
                              key: Key(coffee != null
                                  ? coffee.toStringAsFixed(0)
                                  : null),
                              onTap: () {
                                AlertDialog alert = AlertDialog(
                                  title: Text(
                                    AppLocalizations.of(context).coffeecommand,
                                  ),
                                  content: TextFormField(
                                    onChanged: (value) {
                                      if (value.isNotEmpty &&
                                          double.tryParse(value) == null) {
                                        return 'Please provide a valid value';
                                      }
                                    },
                                    controller: _coffeeController,
                                    decoration: InputDecoration(
                                      hintText: AppLocalizations.of(context)
                                          .brewhint10,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          if (_coffeeController.text.isEmpty) {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            return;
                                          } else {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            setState(() {
                                              if (_coffeeController
                                                  .text.isNotEmpty) {
                                                coffee = double.parse(
                                                    _coffeeController.text);
                                              }

                                              water = coffee * ratio;
                                            });
                                          }
                                        },
                                        child: Text(
                                            AppLocalizations.of(context).okay))
                                  ],
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    });
                              },
                              initialValue: (coffee == null)
                                  ? null
                                  : coffee.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,
                  height: 1,
                  width: deviceWidth * 23 / 25,
                ),
              ),
              Text(
                AppLocalizations.of(context).timer,
                style: TextStyle(
                  fontSize: deviceHeight * 0.001 * smallmultiplier,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  displayTime,
                  style: TextStyle(
                    fontSize: deviceHeight * 0.001 * bigmultiplier,
                    fontFamily: 'Lyon',
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                        child: Text(
                          AppLocalizations.of(context).start,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                        }),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                        child: Text(
                          AppLocalizations.of(context).pause,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        }),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                        child: Text(
                          AppLocalizations.of(context).reset,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight / 40,
              ),
              Text(
                AppLocalizations.of(context).recipes,
                style: TextStyle(
                  fontSize: deviceHeight * 0.001 * smallmultiplier,
                  fontFamily: 'Lyon',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: deviceHeight / 60,
              ),
              Flexible(
                child: Container(
                  width: deviceWidth,
                  height: deviceHeight / 10,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/aeropress');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              'assets/images/aeropress.png',
                              height: deviceHeight / 15,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        width: deviceWidth / 3,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/chemex');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              'assets/images/chemex.png',
                              height: deviceHeight / 15,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        width: deviceWidth / 3,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/v60');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              'assets/images/v60.png',
                              height: deviceHeight / 15,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        width: deviceWidth / 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
