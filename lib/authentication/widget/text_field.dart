import 'package:flutter/material.dart';
import 'package:simple_feed/app.dart';

class NumberInput extends StatelessWidget {
  final TextEditingController phoneTextController;
  final String labelText;
  NumberInput({@required this.phoneTextController, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        autofocus: true,
        controller: phoneTextController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
          prefix: labelText == Constants.phoneNumber
              ? Text(
                  '+251',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                )
              : Container(),
        ),
        validator: validateMobile,
      ),
    );
  }

  String validateMobile(String value) {
    if (value.length == 0) {
      return Constants.phoneValidator;
    } else if (value.length != 9) {
      return Constants.phoneLengthValidator;
    } else {
      return null;
    }
  }
}

class CodeNumberInput extends StatelessWidget {
  final TextEditingController verficationTextController;
  final String labelText;
  CodeNumberInput(
      {@required this.verficationTextController, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        autofocus: true,
        controller: verficationTextController,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.black,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 15, color: Colors.grey),
        ),
        validator: validateVerficationCode,
      ),
    );
  }

  String validateVerficationCode(String value) {
    if (value.length == 0) {
      return Constants.verificationValidator;
    } else if (value.length != 6) {
      return Constants.verificationLengthValidator;
    } else {
      return null;
    }
  }
}
