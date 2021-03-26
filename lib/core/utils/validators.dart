import 'dart:async';
import '../../app.dart';

class Validators {
  final validatePhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (RegExp(r"^(?:[+0]+)?[0-9]{6,14}$").hasMatch(phone)) {
      sink.add(phone);
    } else {
      sink.addError(Constants.phoneValidator);
    }
  });
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  if (diff.inDays >= 1) {
    return "${diff.inDays} day's ago";
  } else if (diff.inHours >= 1) {
    return "${diff.inHours} hour'sago";
  } else if (diff.inMinutes >= 1) {
    return "${diff.inMinutes} minute's ago";
  } else if (diff.inSeconds >= 1) {
    return "${diff.inSeconds} second's ago";
  } else {
    return "just now";
  }
}
