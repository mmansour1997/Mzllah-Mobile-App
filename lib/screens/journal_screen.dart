import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../classes/entry.dart';
import '../providers/entry_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/locale_provider.dart';

class JournalScreen extends StatefulWidget {
  static const routeName = '/journal';
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  int x = 0;
  double _bodyValue = 0;
  double _citrusValue = 0;
  double _berryValue = 0;
  double _floralValue = 0;
  double _spiceValue = 0;
  double _smokeValue = 0;
  double _nutValue = 0;
  double _chocolateValue = 0;
  double _caramelValue = 0;
  double _sweetValue = 0;
  double _sourValue = 0;
  double _bitterValue = 0;
  double _saltValue = 0;
  double _finishValue = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var initDate = DateTime.now();

  Widget getSlider(x) {
    switch (x) {
      case 0:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).body,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['body'] == null ? 0.0 : _editedentry.body,
              min: 0,
              max: 100,
              divisions: 100,
              label: _bodyValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _bodyValue = value;
                  _editedentry.body = value;
                });
              },
            ),
          ],
        );

        break;

      case 1:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).citrus,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['citrus'] == null ? 0.0 : _editedentry.citrus,
              min: 0,
              max: 100,
              divisions: 100,
              label: _citrusValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _citrusValue = value;
                  _editedentry.citrus = value;
                });
              },
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).berry,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['berry'] == null ? 0.0 : _editedentry.berry,
              min: 0,
              max: 100,
              divisions: 100,
              label: _berryValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _berryValue = value;
                  _editedentry.berry = value;
                });
              },
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).floral,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['floral'] == null ? 0.0 : _editedentry.floral,
              min: 0,
              max: 100,
              divisions: 100,
              label: _floralValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _floralValue = value;
                  _editedentry.floral = value;
                });
              },
            ),
          ],
        );
      case 4:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).spice,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['spice'] == null ? 0.0 : _editedentry.spice,
              min: 0,
              max: 100,
              divisions: 100,
              label: _spiceValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _spiceValue = value;
                  _editedentry.spice = value;
                });
              },
            ),
          ],
        );
      case 5:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).smoke,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['smoke'] == null ? 0.0 : _editedentry.smoke,
              min: 0,
              max: 100,
              divisions: 100,
              label: _smokeValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _smokeValue = value;
                  _editedentry.smoke = value;
                });
              },
            ),
          ],
        );
      case 6:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).nut,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['nut'] == null ? 0.0 : _editedentry.nut,
              min: 0,
              max: 100,
              divisions: 100,
              label: _nutValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _nutValue = value;
                  _editedentry.nut = value;
                });
              },
            ),
          ],
        );

      case 7:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).chocolate,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['chocolate'] == null
                  ? 0.0
                  : _editedentry.chocolate,
              min: 0,
              max: 100,
              divisions: 100,
              label: _chocolateValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _chocolateValue = value;
                  _editedentry.chocolate = value;
                });
              },
            ),
          ],
        );

      case 8:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).caramel,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value:
                  _initValues['caramel'] == null ? 0.0 : _editedentry.caramel,
              min: 0,
              max: 100,
              divisions: 100,
              label: _caramelValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _caramelValue = value;
                  _editedentry.caramel = value;
                });
              },
            ),
          ],
        );

      case 9:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).sweet,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['sweet'] == null ? 0.0 : _editedentry.sweet,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sweetValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sweetValue = value;
                  _editedentry.sweet = value;
                });
              },
            ),
          ],
        );

      case 10:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).sour,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['sour'] == null ? 0.0 : _editedentry.sour,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sourValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sourValue = value;
                  _editedentry.sour = value;
                });
              },
            ),
          ],
        );

      case 11:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).bitter,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['bitter'] == null ? 0.0 : _editedentry.bitter,
              min: 0,
              max: 100,
              divisions: 100,
              label: _bitterValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _bitterValue = value;
                  _editedentry.bitter = value;
                });
              },
            ),
          ],
        );
      case 12:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).salt,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['salt'] == null ? 0.0 : _editedentry.salt,
              min: 0,
              max: 100,
              divisions: 100,
              label: _saltValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _saltValue = value;
                  _editedentry.salt = value;
                });
              },
            ),
          ],
        );

      case 13:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).finish,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['finish'] == null ? 0.0 : _editedentry.finish,
              min: 0,
              max: 100,
              divisions: 100,
              label: _finishValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _finishValue = value;
                  _editedentry.finish = value;
                });
              },
            ),
          ],
        );

      default:
        return Column(
          children: [
            Text(
              AppLocalizations.of(context).body,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Slider(
              activeColor: Colors.amber,
              value: _initValues['body'] == null ? 0.0 : _editedentry.body,
              min: 0,
              max: 100,
              divisions: 100,
              label: _bodyValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _bodyValue = value;
                  _editedentry.body = value;
                });
              },
            ),
          ],
        );
    }
  }

  var _editedentry = Entry(
    id: null,
    title: '',
    producer: '',
    origin: '',
    roaster: '',
    roastdate: '',
    grind: '',
    price: double.tryParse(''),
    brewed: null,
    location: '',
    date: DateTime.now(),
    time: DateTime.now(),
    dose: double.tryParse(''),
    mass: double.tryParse(''),
    temp: double.tryParse(''),
    exmin: double.tryParse(''),
    exsec: double.tryParse(''),
    tds: double.tryParse(''),
    exyield: double.tryParse(''),
    rating: 0.0,
    notes: '',
    body: 0.0,
    citrus: 0.0,
    berry: 0.0,
    floral: 0.0,
    spice: 0.0,
    smoke: 0.0,
    nut: 0.0,
    chocolate: 0.0,
    caramel: 0.0,
    sweet: 0.0,
    sour: 0.0,
    bitter: 0.0,
    salt: 0.0,
    finish: 0.0,
  );

  int _selectedBrew;
  var _isLoading = false;

  Future<void> onPressedSubmit() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedentry.id != null) {
      await Provider.of<Entries>(context, listen: false)
          .updateEntry(_editedentry.id, _editedentry, _selectedBrew);
    } else {
      try {
        await Provider.of<Entries>(context, listen: false)
            .addEntry(_editedentry, _selectedBrew);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occured'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  List<DropdownMenuItem<int>> brewList = [];

  void loadBrewList() {
    brewList = [];
    brewList.add(new DropdownMenuItem(
      child: new Text('Unknown'),
      value: 0,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Press'),
      value: 1,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Drip'),
      value: 2,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Percolator'),
      value: 3,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Espresso'),
      value: 4,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Vacuum'),
      value: 5,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Pour-over'),
      value: 6,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Turkish'),
      value: 7,
    ));
    brewList.add(new DropdownMenuItem(
      child: new Text('Cupping'),
      value: 8,
    ));
  }

  var _isInit = true;
  var _initValues = {
    'title': '',
    'producer': '',
    'origin': '',
    'roaster': '',
    'roastdate': '',
    'grind': '',
    'price': double.tryParse(''),
    'brewed': null,
    'location': '',
    'date': DateTime.now(),
    'time': TimeOfDay.now(),
    'dose': double.tryParse(''),
    'mass': double.tryParse(''),
    'temp': double.tryParse(''),
    'exmin': double.tryParse(''),
    'exsec': double.tryParse(''),
    'tds': double.tryParse(''),
    'exyield': double.tryParse(''),
    'rating': 0.0,
    'notes': '',
    'body': 0.0,
    'citrus': 0.0,
    'berry': 0.0,
    'floral': 0.0,
    'spice': 0.0,
    'smoke': 0.0,
    'nut': 0.0,
    'chocolate': 0.0,
    'caramel': 0.0,
    'sweet': 0.0,
    'sour': 0.0,
    'bitter': 0.0,
    'salt': 0.0,
    'finish': 0.0,
  };
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final entryId = ModalRoute.of(context).settings.arguments as String;
      if (entryId != null) {
        _editedentry = Provider.of<Entries>(context).findById(entryId);
        _initValues = {
          'title': _editedentry.title,
          'producer': _editedentry.producer,
          'origin': _editedentry.origin,
          'roaster': _editedentry.roaster,
          'roastdate': _editedentry.roastdate,
          'grind': _editedentry.grind,
          'price': _editedentry.price.toString(),
          'brewed': _editedentry.brewed,
          'location': _editedentry.location,
          'date': DateFormat.yMd().format(_editedentry.date),
          'time': DateFormat.Hm().format(_editedentry.time),
          'dose': _editedentry.dose.toString(),
          'mass': _editedentry.mass.toString(),
          'temp': _editedentry.temp.toString(),
          'exmin': _editedentry.exmin.toString(),
          'exsec': _editedentry.exsec.toString(),
          'tds': _editedentry.tds.toString(),
          'exyield': _editedentry.exyield.toString(),
          'rating': _editedentry.rating,
          'notes': _editedentry.notes,
          'body': _editedentry.body,
          'citrus': _editedentry.citrus,
          'berry': _editedentry.berry,
          'floral': _editedentry.floral,
          'spice': _editedentry.spice,
          'smoke': _editedentry.smoke,
          'nut': _editedentry.nut,
          'chocolate': _editedentry.chocolate,
          'caramel': _editedentry.caramel,
          'sweet': _editedentry.sweet,
          'sour': _editedentry.sour,
          'bitter': _editedentry.bitter,
          'salt': _editedentry.salt,
          'finish': _editedentry.finish,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _producerFocusNode.dispose();
    _originFocusNode.dispose();
    _roasterFocusNode.dispose();
    _roastdateFocusNode.dispose();
    _grindFocusNode.dispose();
    _priceFocusNode.dispose();
    _locationFocusNode.dispose();
    _doseFocusNode.dispose();
    _massFocusNode.dispose();
    _tempFocusNode.dispose();
    _extractionFocusNode.dispose();
    _extractionFocusNode2.dispose();
    _tdsFocusNode.dispose();
    _yieldFocusNode.dispose();
    _notesFocusNode.dispose();
    super.dispose();
  }

  final _titleFocusNode = FocusNode();
  final _producerFocusNode = FocusNode();
  final _originFocusNode = FocusNode();
  final _roasterFocusNode = FocusNode();
  final _roastdateFocusNode = FocusNode();
  final _grindFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _locationFocusNode = FocusNode();
  final _doseFocusNode = FocusNode();
  final _massFocusNode = FocusNode();
  final _tempFocusNode = FocusNode();
  final _extractionFocusNode = FocusNode();
  final _extractionFocusNode2 = FocusNode();
  final _tdsFocusNode = FocusNode();
  final _yieldFocusNode = FocusNode();
  final _notesFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    const ticks = [20, 40, 60, 80, 100];
    var features = [
      AppLocalizations.of(context).body,
      AppLocalizations.of(context).citrus,
      AppLocalizations.of(context).berry,
      AppLocalizations.of(context).floral,
      AppLocalizations.of(context).spice,
      AppLocalizations.of(context).smoke,
      AppLocalizations.of(context).nut,
      AppLocalizations.of(context).chocolate,
      AppLocalizations.of(context).caramel,
      AppLocalizations.of(context).sweet,
      AppLocalizations.of(context).sour,
      AppLocalizations.of(context).bitter,
      AppLocalizations.of(context).salt,
      AppLocalizations.of(context).finish
    ];
    var data = [
      [
        _editedentry.body.toInt(),
        _editedentry.citrus.toInt(),
        _editedentry.berry.toInt(),
        _editedentry.floral.toInt(),
        _editedentry.spice.toInt(),
        _editedentry.smoke.toInt(),
        _editedentry.nut.toInt(),
        _editedentry.chocolate.toInt(),
        _editedentry.caramel.toInt(),
        _editedentry.sweet.toInt(),
        _editedentry.sour.toInt(),
        _editedentry.bitter.toInt(),
        _editedentry.salt.toInt(),
        _editedentry.finish.toInt()
      ],
    ];
    bool useSides = true;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    loadBrewList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Text(
              AppLocalizations.of(context).addentry,
              style: TextStyle(fontFamily: 'Lyon', fontSize: 20),
            ),
            Text(AppLocalizations.of(context).rateflavours,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 20)),
          ]),
          actions: <Widget>[
            Padding(
                padding: provider.locale.toString() != "ar"
                    ? EdgeInsets.only(right: 20.0)
                    : EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: onPressedSubmit,
                  child: Icon(
                    Icons.save,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
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
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              AppLocalizations.of(context).tasterjournal,
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lyon'),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).title),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['title'],
                                        focusNode: _titleFocusNode,
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .title,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_producerFocusNode);
                                        },
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.title = newValue;
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return AppLocalizations.of(context)
                                                .pleasetitle;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).producer),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['producer'],
                                        focusNode: _producerFocusNode,
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .producer,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_originFocusNode);
                                        },
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.producer = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).origin),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['origin'],
                                        focusNode: _originFocusNode,
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .origin,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_roasterFocusNode);
                                        },
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.origin = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).roaster),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['roaster'],
                                        focusNode: _roasterFocusNode,
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .roaster,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _roastdateFocusNode);
                                        },
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.roaster = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).roastdate),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['roastdate'],
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .roastdate,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        focusNode: _roastdateFocusNode,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_grindFocusNode);
                                        },
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.roastdate = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: deviceWidth * 1 / 4,
                                      child: Text(AppLocalizations.of(context)
                                          .grindsetting)),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['grind'],
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .grindsetting,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_priceFocusNode);
                                        },
                                        focusNode: _grindFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.grind = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).price),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.price == null
                                            ? null
                                            : _initValues['price'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .price,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_locationFocusNode);
                                        },
                                        focusNode: _priceFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.price =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleaseprice;
                                          }
                                          if (value.isNotEmpty &&
                                              double.parse(value) < 0) {
                                            return AppLocalizations.of(context)
                                                .pleaseprice;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: deviceWidth * 1 / 4,
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .selectbrewing,
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: DropdownButton(
                                        hint: Text(AppLocalizations.of(context)
                                            .selectbrewing),
                                        value: (_initValues['brewed'] == null)
                                            ? _selectedBrew
                                            : _editedentry.brewed,
                                        items: brewList,
                                        onChanged: (value) {
                                          setState(() {
                                            _initValues['brewed'] = null;
                                            _selectedBrew = value;
                                          });
                                        },
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).location),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['location'],
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .location,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_doseFocusNode);
                                        },
                                        focusNode: _locationFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.location = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, top: 16.0, bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppLocalizations.of(context).pickdate),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      width: deviceWidth * 1 / 7,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).accentColor,
                                            elevation: 5,
                                          ),
                                          child: Icon(
                                              Icons.calendar_today_rounded),
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2021),
                                                    lastDate: DateTime.now())
                                                .then((pickedDate) {
                                              if (pickedDate == null) {
                                                return;
                                              }
                                              setState(() {
                                                _editedentry.date = pickedDate;
                                              });
                                            });
                                          }),
                                    ),
                                    Text(
                                      _editedentry.date == null
                                          ? AppLocalizations.of(context)
                                              .pleasedate
                                          : '${AppLocalizations.of(context).pickeddate} ${DateFormat.yMd().format(_editedentry.date)}',
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, top: 16.0, bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppLocalizations.of(context).picktime),
                                    SizedBox(
                                      width: 0.1,
                                    ),
                                    Container(
                                      width: deviceWidth * 1 / 7,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).accentColor,
                                            elevation: 5,
                                          ),
                                          child: Icon(Icons
                                              .history_toggle_off_outlined),
                                          onPressed: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((pickedTime) {
                                              if (pickedTime == null) {
                                                return;
                                              }
                                              setState(() {
                                                _editedentry.time =
                                                    new DateTime(
                                                        initDate.year,
                                                        initDate.month,
                                                        initDate.day,
                                                        pickedTime.hour,
                                                        pickedTime.minute);
                                              });
                                            });
                                          }),
                                    ),
                                    Text(
                                      _editedentry.time == null
                                          ? AppLocalizations.of(context)
                                              .pleasetime
                                          : '${AppLocalizations.of(context).pickedtime} ${DateFormat.Hm().format(_editedentry.time)}',
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).dose),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.dose == null
                                            ? null
                                            : _initValues['dose'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .dose,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_massFocusNode);
                                        },
                                        focusNode: _doseFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.dose =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleasedose;
                                          }
                                          if (value.isNotEmpty &&
                                              double.parse(value) < 0) {
                                            return AppLocalizations.of(context)
                                                .pleasedose;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).watermass),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.mass == null
                                            ? null
                                            : _initValues['mass'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .watermass,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_tempFocusNode);
                                        },
                                        focusNode: _massFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.mass =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleasemass;
                                          }
                                          if (value.isNotEmpty &&
                                              double.parse(value) < 0) {
                                            return AppLocalizations.of(context)
                                                .pleasemass;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      AppLocalizations.of(context).temperature),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.temp == null
                                            ? null
                                            : _initValues['temp'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .temperature,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context).requestFocus(
                                              _extractionFocusNode);
                                        },
                                        focusNode: _tempFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.temp =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleasetemp;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: deviceWidth * 2 / 4,
                                      child: Text(AppLocalizations.of(context)
                                          .extractiontime)),
                                  Flexible(
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      initialValue: _editedentry.exmin == null
                                          ? null
                                          : _initValues['exmin'].toString(),
                                      decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .minute,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .accentColor))),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context).requestFocus(
                                            _extractionFocusNode2);
                                      },
                                      focusNode: _extractionFocusNode,
                                      onSaved: (newValue) {
                                        setState(() {
                                          _editedentry.exmin =
                                              double.tryParse(newValue);
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isNotEmpty &&
                                            double.tryParse(value) == null) {
                                          return AppLocalizations.of(context)
                                              .pleasemin;
                                        }
                                        if (value.isNotEmpty &&
                                            double.parse(value) < 0) {
                                          return AppLocalizations.of(context)
                                              .pleasemin;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      ':',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      initialValue: _editedentry.exsec == null
                                          ? null
                                          : _initValues['exsec'].toString(),
                                      decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .second,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .accentColor))),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onFieldSubmitted: (_) {
                                        FocusScope.of(context)
                                            .requestFocus(_tdsFocusNode);
                                      },
                                      focusNode: _extractionFocusNode2,
                                      onSaved: (newValue) {
                                        setState(() {
                                          _editedentry.exsec =
                                              double.tryParse(newValue);
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isNotEmpty &&
                                            double.tryParse(value) == null) {
                                          return AppLocalizations.of(context)
                                              .pleasesec;
                                        }
                                        if (value.isNotEmpty &&
                                            double.parse(value) < 0) {
                                          return AppLocalizations.of(context)
                                              .pleasesec;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).tds),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.tds == null
                                            ? null
                                            : _initValues['tds'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .tds,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_yieldFocusNode);
                                        },
                                        focusNode: _tdsFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.tds =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleasepercent;
                                          }
                                          if (value.isNotEmpty &&
                                              double.parse(value) < 0) {
                                            return AppLocalizations.of(context)
                                                .pleasepercent;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context)
                                      .extractionyield),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _editedentry.exyield ==
                                                null
                                            ? null
                                            : _initValues['exyield'].toString(),
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .extractionyield,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_notesFocusNode);
                                        },
                                        focusNode: _yieldFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.exyield =
                                                double.tryParse(newValue);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isNotEmpty &&
                                              double.tryParse(value) == null) {
                                            return AppLocalizations.of(context)
                                                .pleasepercent;
                                          }
                                          if (value.isNotEmpty &&
                                              double.parse(value) < 0) {
                                            return AppLocalizations.of(context)
                                                .pleasepercent;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context).rating,
                                  style: TextStyle(
                                      fontFamily: 'Lyon', fontSize: 16),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16.0, top: 25.0, bottom: 16.0),
                                    child: RatingBar.builder(
                                      initialRating: _initValues['rating'],
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        _editedentry.rating = rating;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppLocalizations.of(context).notes),
                                  Flexible(
                                    child: Container(
                                      width: deviceWidth * 2 / 3,
                                      child: TextFormField(
                                        initialValue: _initValues['notes'],
                                        decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)
                                                    .notes,
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .accentColor))),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        focusNode: _notesFocusNode,
                                        onSaved: (newValue) {
                                          setState(() {
                                            _editedentry.notes = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            height: deviceHeight * 1 / 2,
                            width: deviceWidth * 3 / 4,
                            child: RadarChart.light(
                              ticks: ticks,
                              features: features,
                              data: data,
                              reverseAxis: false,
                              useSides: useSides,
                            ),
                          ),
                        ),
                        getSlider(x),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                                onPrimary: Colors.black87,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (x > 0) {
                                    x--;
                                  } else {
                                    x = 13;
                                  }
                                });
                              },
                              icon: Icon(Icons.arrow_back),
                              label: Text(AppLocalizations.of(context).back),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).accentColor,
                                onPrimary: Colors.black87,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (x < 13) {
                                    x++;
                                  } else {
                                    x = 0;
                                  }
                                });
                              },
                              icon: Icon(Icons.arrow_forward),
                              label: Text(AppLocalizations.of(context).next),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
