import 'package:flutter/material.dart';
import 'package:simple_feed/app.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.pink,
              ),
              child: Icon(
                Icons.message_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: Constants.welcome,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 18)),
                TextSpan(
                    text: ' ' + Constants.appTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 18))
              ])))
        ],
      ),
    );
  }
}

class VerficationHeader extends StatelessWidget {
  final String phone;
  const VerficationHeader({Key key, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(10.0, 10),
                  topRight: Radius.elliptical(10.0, 10),
                  bottomLeft: Radius.circular(80.0),
                  bottomRight: Radius.circular(80.0),
                  //  Radius.lerp(Radius.circular(10), Radius.circular(10), 10)
                ),
                color: Colors.pink,
              ),
              child: Icon(
                Icons.done,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: Constants.verificationMessage,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 16)),
                TextSpan(
                    text: phone,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16))
              ])))
        ],
      ),
    );
  }
}
