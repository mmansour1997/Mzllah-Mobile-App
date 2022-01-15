import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoJournalScreen extends StatelessWidget {
  static const routeName = '/infojournal';
  final bool tab;
  InfoJournalScreen(this.tab);
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
      appBar: arguments ? null : AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppLocalizations.of(context).mzllahnewjournal,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lyon'),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 100, 25, 10),
                child: Text(
                  AppLocalizations.of(context).journalmessage,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )),
          ),
          Flexible(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              onPrimary: Colors.black87,
            ),
            child: Text(AppLocalizations.of(context).infoloyalty5),
            onPressed: () {
              if (tab == true) {
                Navigator.of(context).pushNamed('/auth', arguments: false);
              } else {
                Navigator.of(context)
                    .popAndPushNamed('/auth', arguments: false);
              }
            },
          ))
        ],
      ),
    );
  }
}
