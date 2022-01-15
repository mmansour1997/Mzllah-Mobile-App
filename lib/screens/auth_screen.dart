import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    bool arguments = ModalRoute.of(context).settings.arguments;
    if (arguments == null) {
      arguments = true;
    }
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      appBar: arguments ? null : AppBar(),
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(252, 249, 242, 1),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('assets/images/logo.png')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 3,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, dynamic> _authData = {
    'firstName': '',
    'lastName': '',
    'phone': '',
    'birthDate': '',
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An error occured'),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      if (_authMode == AuthMode.Login) {
        // await Provider.of<Auth>(context, listen: false)
        //     .login(_authData['email'], _authData['password']);

        UserCredential userCredential =
            await Provider.of<Auth>(context, listen: false)
                .login(_authData['email'], _authData['password']);

        Timer(Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });

        // Log user in
      } else {
        // Sign user up
        UserCredential userCredential =
            await Provider.of<Auth>(context, listen: false).signup(
                _authData['firstName'],
                _authData['lastName'],
                _authData['phone'],
                _authData['birthDate'],
                _authData['email'],
                _authData['password']);

        Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      }
    } on FirebaseAuthException catch (error) {
      var errorMessage = AppLocalizations.of(context).failedauth;
      if (error.code == 'email-already-in-use') {
        errorMessage = AppLocalizations.of(context).usedemail;
      } else if (error.code == 'invalid-email') {
        errorMessage = AppLocalizations.of(context).invalidemail2;
      } else if (error.code == 'weak-password') {
        errorMessage = AppLocalizations.of(context).weakpassword;
      } else if (error.code == 'user-not-found') {
        errorMessage = AppLocalizations.of(context).emailnotfound;
      } else if (error.code == 'wrong-password') {
        errorMessage = AppLocalizations.of(context).invalidpassword;
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      var errorMessage2 = AppLocalizations.of(context).laterauth;
      _showErrorDialog(errorMessage2);
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 500 : 400,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 500 : 400),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _authMode == AuthMode.Signup
                    ? TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).firstname,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).pleasename;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['firstName'] = value;
                        },
                      )
                    : Text(''),
                _authMode == AuthMode.Signup
                    ? TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).lastname,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).pleasename;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['lastName'] = value;
                        },
                      )
                    : Text(''),
                _authMode == AuthMode.Signup
                    ? TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).phone,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).pleasephone;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['phone'] = value;
                        },
                      )
                    : Text(''),
                _authMode == AuthMode.Signup
                    ? TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).dob,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        keyboardType: TextInputType.url,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('/')) {
                            return AppLocalizations.of(context).pleasedate;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['birthDate'] = value;
                        },
                      )
                    : Text(''),
                AutofillGroup(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).email,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return AppLocalizations.of(context).invalidemail;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).password,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                        obscureText: true,
                        controller: _passwordController,
                        autofillHints: [AutofillHints.password],
                        onEditingComplete: () {
                          try {
                            TextInput.finishAutofillContext();
                          } catch (error) {
                            Widget okButton = TextButton(
                              child: Text("OK"),
                              onPressed: () {},
                            );

                            AlertDialog alert = AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context).autofillerror),
                              content: Text(
                                  AppLocalizations.of(context).autofillmessage),
                              actions: [
                                okButton,
                              ],
                            );

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                          _submit();
                        },
                        validator: (value) {
                          if (value.isEmpty || value.length < 5) {
                            return AppLocalizations.of(context).passwordshort;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['password'] = value;
                        },
                      ),
                    ],
                  ),
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).confirmpassword,
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor))),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return AppLocalizations.of(context)
                                  .passwordmismatch;
                            }
                            return null;
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    child: Text(_authMode == AuthMode.Login
                        ? AppLocalizations.of(context).login
                        : AppLocalizations.of(context).signup),
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      primary: Theme.of(context).accentColor,
                      onPrimary:
                          Theme.of(context).primaryTextTheme.button.color,
                    ),
                  ),
                TextButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? AppLocalizations.of(context).newuser : AppLocalizations.of(context).existinguser} '),
                  onPressed: _switchAuthMode,
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    primary: Colors.black,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                TextButton(
                  child: Text(AppLocalizations.of(context).forgotpassword),
                  onPressed: () {
                    Navigator.pushNamed(context, "/reset");
                  },
                  style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                    primary: Colors.black,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
