import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_feed/app.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  MockUserRepository mockUserRepository;
  AuthenticationBloc authenticationBloc;

  setUp(() {
    mockUserRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: mockUserRepository);
  });

  group('AuthenticationBloc', () {
    test('AuthenticationState.UninitializedState', () {
      final authenticationBloc = AuthenticationBloc(
        userRepository: mockUserRepository,
      );
      expect(authenticationBloc.state, UninitializedState());
      authenticationBloc.close();
    });

    test('AuthenticationState.UnauthenticatedState', () {
      final authenticationBloc = AuthenticationBloc(
        userRepository: mockUserRepository,
      );
      authenticationBloc.add(LoggedOutEvent());
      expect(authenticationBloc.state, UnauthenticatedState());
      authenticationBloc.close();
    });

    test('AuthenticationState.UnauthenticatedState', () {
      final authenticationBloc = AuthenticationBloc(
        userRepository: mockUserRepository,
      );
      // authenticationBloc.add(AuthenticatedEvent(user: User()));
      expect(authenticationBloc.state, AuthenticatedState());
      authenticationBloc.close();
    });
  });
}
