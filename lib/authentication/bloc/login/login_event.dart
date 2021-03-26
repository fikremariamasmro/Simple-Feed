import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStartEvent extends LoginEvent {}

class SendCodeEvent extends LoginEvent {
  final String phoneNumber;

  SendCodeEvent({this.phoneNumber});
}

class SmsSendEvent extends LoginEvent {}

class ResendCodeEvent extends LoginEvent {
  final String phoneNumber;

  ResendCodeEvent({this.phoneNumber});
}

class VerifyPhoneNumberEvent extends LoginEvent {
  final String code;

  VerifyPhoneNumberEvent({this.code});
}

class LoginCompleteEvent extends LoginEvent {
  final User user;
  LoginCompleteEvent(this.user);
}

class LoginExceptionEvent extends LoginEvent {
  final String message;

  LoginExceptionEvent(this.message);
}

class LogoutEvent extends LoginEvent {}
