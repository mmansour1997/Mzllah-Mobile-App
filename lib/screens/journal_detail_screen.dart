import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/entry.dart';
import '../providers/entry_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JournalDetail extends StatelessWidget {
  static const routeName = '/journaldetail';
  @override
  Widget build(BuildContext context) {
    final String entryId = ModalRoute.of(context).settings.arguments as String;
    Entry entry = Provider.of<Entries>(context).findById(entryId);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text(
                  entry.title.toUpperCase(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).producer,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        entry.producer,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).origin,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        entry.origin,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).roaster,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        entry.roaster,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).roastdate,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.roastdate,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).grindsetting,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.grind,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).price,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.price == null ? '' : entry.price.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).brew.toUpperCase(),
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            Provider.of<Entries>(context)
                                .determinebrewed(entry.brewed),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).location,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.location,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).pickeddate.toUpperCase(),
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            DateFormat.yMd().format(entry.date),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).pickedtime.toUpperCase(),
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            DateFormat.Hm().format(entry.time),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).dose,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.dose == null ? '' : entry.dose.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).watermass,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.mass == null ? '' : entry.mass.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).temperature,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.temp == null ? '' : entry.temp.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).extractiontime,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Text(
                            entry.exmin == null
                                ? ''
                                : entry.exmin.toStringAsFixed(0),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(':'),
                          Text(
                            entry.exsec == null
                                ? ''
                                : entry.exsec.toStringAsFixed(0),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).tds,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.tds == null ? '' : entry.tds.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).extractionyield,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.exyield == null
                                ? ''
                                : entry.exyield.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).notes,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            entry.notes,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).rating,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Lyon', fontSize: 22),
                ),
              ),
              RatingBar.builder(
                initialRating: entry.rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                ignoreGestures: true,
                itemSize: 20,
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
