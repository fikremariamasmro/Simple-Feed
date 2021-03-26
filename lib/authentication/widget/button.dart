import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  SigninButton({@required this.onPressed, @required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RawMaterialButton(
          fillColor: Colors.pink,
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  label,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
    );
  }
}
