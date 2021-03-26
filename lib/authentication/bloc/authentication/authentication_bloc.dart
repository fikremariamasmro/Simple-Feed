import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../app.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : super(UninitializedState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      yield* _mapAppStartedToState();
    } else if (event is AuthenticatedEvent) {
      yield* _mapAuthenticatedToState();
    } else if (event is LoggedOutEvent) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    userRepository = UserRepository();
    final isAuthenticated = await userRepository.isAuthenticated();
    if (isAuthenticated) {
      yield AuthenticatedState();
    } else {
      yield UnauthenticatedState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticatedToState() async* {
    yield LoadingState();
    yield AuthenticatedState();
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    userRepository = UserRepository();
    yield LoadingState();
    userRepository.signOut();
    yield UnauthenticatedState();
  }
}
