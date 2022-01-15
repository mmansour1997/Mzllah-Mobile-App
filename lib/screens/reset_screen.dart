import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetScreen extends StatefulWidget {
  static const routeName = '/reset';
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final snackBar =
        SnackBar(content: Text(AppLocalizations.of(context).resetmessage));
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration:
                  InputDecoration(hintText: AppLocalizations.of(context).email),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text(AppLocalizations.of(context).sendrequest),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  primary: Theme.of(context).accentColor,
                  onPrimary: Theme.of(context).primaryTextTheme.button.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
