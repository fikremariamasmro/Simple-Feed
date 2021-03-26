import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class SmsSentState extends LoginState {
  @override
  List<Object> get props => [];
}

class PhoneVerifiedState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginCompleteState extends LoginState {
  final User user;

  LoginCompleteState(this.user);

  @override
  List<Object> get props => [user];
}

class ExceptionState extends LoginState {
  final String message;

  ExceptionState({this.message});

  @override
  List<Object> get props => [message];
}

class VerficationExceptionState extends LoginState {
  final String message;

  VerficationExceptionState({this.message});

  @override
  List<Object> get props => [message];
}
