import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../app.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  // ignore: cancel_subscriptions
  StreamSubscription subscription;

  String verID = "";

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(InitialLoginState());

  @override
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SendCodeEvent) {
      yield LoginLoadingState();
      subscription = sendOtp(event.phoneNumber).listen((event) {
        add(event);
      });
    } else if (event is SmsSendEvent) {
      yield SmsSentState();
    } else if (event is LoginCompleteEvent) {
      yield LoginLoadingState();
      var user = await _userRepository.getCurrentUser();
      yield LoginCompleteState(user);
    } else if (event is LoginExceptionEvent) {
      yield ExceptionState(message: event.message);
    } else if (event is VerifyPhoneNumberEvent) {
      yield LoginLoadingState();
      try {
        UserCredential result =
            await _userRepository.verifyAndLogin(verID, event.code);
        if (result != null) {
          yield LoginCompleteState(result.user);
        } else {
          yield VerficationExceptionState(message: "Invalid code!");
        }
      } catch (e) {
        yield ExceptionState(message: "Invalid code!");
      }
    }
  }

  Stream<LoginEvent> sendOtp(String phoNo) async* {
    StreamController<LoginEvent> eventStream = StreamController();
    final phoneVerificationCompleted = (AuthCredential authCredential) {
      _userRepository.getCurrentUser().catchError((onError) {
        eventStream.add(LoginExceptionEvent(onError));
      }).then((user) {
        eventStream.add(LoginCompleteEvent(user));
        eventStream.close();
      });
    };
    final phoneVerificationFailed = (FirebaseException authException) {
      eventStream.add(LoginExceptionEvent(authException.message));
      eventStream.close();
    };
    final phoneCodeSent = (String verId, [int forceResent]) {
      this.verID = verId;
      eventStream.add(SmsSendEvent());
    };
    final phoneCodeAutoRetrievalTimeout = (String verid) {
      this.verID = verid;
      eventStream.close();
    };

    try {
      await _userRepository.verifyPhoneNumber(
          phoNo,
          Duration(seconds: 1),
          phoneVerificationFailed,
          phoneVerificationCompleted,
          phoneCodeSent,
          phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      print(e);
    }

    yield* eventStream.stream;
  }

  Future<void> close() async {
    super.close();
  }
}
