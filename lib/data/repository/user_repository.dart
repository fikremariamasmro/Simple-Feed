import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

abstract class Authentication {
  Future<User> getCurrentUser();
  Future verifyPhoneNumber(
      String phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout);
  Future verifyAndLogin(String verificationId, String smsCode);
  Future<bool> isAuthenticated();
  Future<String> getToken();
  Future<void> signOut();
}

class UserRepository extends Authentication {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+251" + phoneNumber,
        timeout: timeOut,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<UserCredential> verifyAndLogin(
      String verificationId, String smsCode) async {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    UserCredential userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithCredential(authCredential);
    } on FirebaseException catch (e) {
      userCredential = null;
      print(e.toString());
    }
    return userCredential;
  }

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<User> getCurrentUser() async {
    final currentUser = await _firebaseAuth.authStateChanges().first;
    return currentUser;
  }

  @override
  Future<String> getToken() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String token = await auth.currentUser.getIdToken();
    return 'Bearer ' + token;
  }

  @override
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
