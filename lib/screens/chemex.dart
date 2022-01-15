import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Chemex extends StatelessWidget {
  static const routeName = '/chemex';
  @override
  Widget build(BuildContext context) {
    //final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  'assets/images/chemex.png',
                  height: deviceHeight / 4,
                  fit: BoxFit.contain,
                ),
              ),
              Text(AppLocalizations.of(context).chemextitle,
                  style: TextStyle(
                    fontFamily: 'Lyon',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 15,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: AppLocalizations.of(context).recipebrew,
                              style: new TextStyle(
                                  fontFamily: 'Lyon',
                                  fontWeight: FontWeight.bold)),
                          new TextSpan(
                              text:
                                  AppLocalizations.of(context).chemexrecipebrew,
                              style: new TextStyle(
                                fontFamily: 'Lyon',
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('${AppLocalizations.of(context).step1}',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step2}                                                      ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step3}                                                      ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step4}                                                      ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step5}                                                       ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep5),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step6}                                                      ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        '${AppLocalizations.of(context).step7}                                                      ',
                        style: TextStyle(
                          fontFamily: 'Lyon',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(AppLocalizations.of(context).chemexstep7),
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
