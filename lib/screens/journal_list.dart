import 'package:flutter/material.dart';
import '../providers/entry_data.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JournalList extends StatefulWidget {
  final bool active;
  JournalList(this.active);
  static const routeName = '/journallist';

  @override
  _JournalListState createState() => _JournalListState(active);
}

class _JournalListState extends State<JournalList> {
  final bool active;
  _JournalListState(this.active);
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Entries>(context, listen: false).fetchAndSetEntries();
  }

  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Entries>(context).fetchAndSetEntries().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    //final deviceHeight = MediaQuery.of(context).size.height;
    final scaffold = ScaffoldMessenger.of(context);
    final entryData = Provider.of<Entries>(context);
    final entries = entryData.items;
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: active
          ? null
          : AppBar(
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/journal');
                    }),
              ],
            ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : entries.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(AppLocalizations.of(context).noentry,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        child: Text(
                          AppLocalizations.of(context).addentry,
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/journal');
                        })
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: Stack(children: <Widget>[
                    Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    '/journaldetail',
                                    arguments: entries[index].id);
                              },
                              child: Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                child: ListTile(
                                  title: Text(
                                    entries[index].title.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  subtitle: Text(DateFormat.yMMMd()
                                      .format(entries[index].date)),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.cover,
                                        child: Container(
                                          width: deviceWidth / 4,
                                          child: RatingBar.builder(
                                            initialRating:
                                                entries[index].rating,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: deviceWidth / 20,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                            ignoreGestures: true,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed('/journal',
                                                    arguments:
                                                        entries[index].id)
                                                .then((_) =>
                                                    _refreshProducts(context));
                                          }),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Theme.of(context).errorColor,
                                        onPressed: () async {
                                          try {
                                            await Provider.of<Entries>(context,
                                                    listen: false)
                                                .deleteEntry(entries[index].id);
                                          } catch (error) {
                                            scaffold.showSnackBar(SnackBar(
                                              content: Text(
                                                AppLocalizations.of(context)
                                                    .deletefailed,
                                                textAlign: TextAlign.center,
                                              ),
                                            ));
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: entries.length,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/journal');
                            },
                            elevation: 5.0,
                            fillColor: Theme.of(context).accentColor,
                            child: Icon(
                              Icons.add,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          )),
                    ),
                  ]),
                ),
    );
  }
}
