import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    _launchURL() async {
      const url = 'https://goo.gl/maps/pC712v2ET4Cfm9bYA';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).contactusdrawer,
                style: TextStyle(fontFamily: 'Lyon', fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(),
                  ),
                ),
                height: deviceHeight / 10,
                width: deviceWidth * 11 / 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).email,
                      style: TextStyle(fontFamily: 'Lyon', fontSize: 18),
                    ),
                    Text('info@mzllah.ae',
                        style: TextStyle(fontFamily: 'Lyon', fontSize: 18))
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: deviceHeight / 10,
                width: 1,
              ),
              Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(),
                  ),
                ),
                height: deviceHeight / 10,
                width: deviceWidth * 11 / 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).phone,
                        style: TextStyle(fontFamily: 'Lyon', fontSize: 18)),
                    Text('+97192245111',
                        style: TextStyle(fontFamily: 'Lyon', fontSize: 18)),
                  ],
                ),
              ),
            ],
          )),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(3.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(), bottom: BorderSide()),
              ),
              height: deviceHeight / 10,
              width: deviceWidth * 23 / 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context).address,
                      style: TextStyle(fontFamily: 'Lyon', fontSize: 18),
                    ),
                  ),
                  Flexible(
                    child: Text(AppLocalizations.of(context).addressline1,
                        style: TextStyle(fontFamily: 'Lyon', fontSize: 18)),
                  ),
                  Flexible(
                    child: Text(AppLocalizations.of(context).addressline2,
                        style: TextStyle(fontFamily: 'Lyon', fontSize: 18)),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _launchURL,
            child: Container(
              height: deviceHeight * 0.45,
              width: deviceWidth * 23 / 25,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                image: ExactAssetImage(
                  'assets/images/map.JPG',
                ),
                fit: BoxFit.cover,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
