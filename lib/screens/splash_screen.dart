import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
