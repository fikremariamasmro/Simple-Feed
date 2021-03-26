import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _splashScreen();
  }

  _splashScreen() {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: DecoratedBox(
            child: Center(
              child: Text("Simple Feed",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.deepOrange, Colors.redAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )));
  }
}
