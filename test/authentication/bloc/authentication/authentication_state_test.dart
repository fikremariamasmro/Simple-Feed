import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/app.dart';

class MockUser extends Mock implements User {}

main() {
  group('Authentication State', () {
    group('Authentication.UninitializedState', () {
      test('Supports value comparisons', () {
        expect(
          UninitializedState(),
          UninitializedState(),
        );
      });
    });

    group('Authentication.AuthenticatedState', () {
      test('Supports value comparisons', () {
        expect(
          AuthenticatedState(),
          AuthenticatedState(),
        );
      });
    });

    group('Authentication.UnauthenticatedState', () {
      test('Supports value comparisons', () {
        expect(
          UnauthenticatedState(),
          UnauthenticatedState(),
        );
      });
    });
  });
}
