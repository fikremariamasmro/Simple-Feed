import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/app.dart';

class MockUser extends Mock implements User {}

main() {
  MockUser mockUser;

  setUp(() {
    mockUser = MockUser();
  });
  group('AuthenticationEvent.', () {
    group('AuthenticationEvent.AppStartedEvent', () {
      test('supports value comparisons', () {
        expect(
          AppStartedEvent(),
          AppStartedEvent(),
        );
      });
    });
    group('AuthenticationStatusChanged', () {
      test('supports value comparisons', () {
        expect(
          AuthenticatedEvent(user: mockUser),
          AuthenticatedEvent(user: mockUser),
        );
      });
    });

    group('AuthenticationEvent.LoggedOutEvent', () {
      test('supports value comparisons', () {
        expect(
          LoggedOutEvent(),
          LoggedOutEvent(),
        );
      });
    });
  });
}
