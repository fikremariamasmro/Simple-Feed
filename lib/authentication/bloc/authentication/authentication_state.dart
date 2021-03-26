import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class UninitializedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class InitialState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
