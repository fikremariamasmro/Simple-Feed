import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => [];
}

class AuthenticatedEvent extends AuthenticationEvent {
  final User user;
  AuthenticatedEvent({@required this.user}) : super([user]);

  @override
  String toString() => 'LoggedIn { user: $user }';

  @override
  List<Object> get props => [user];
}

class LoggedOutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => [];
}
