import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStartedEvent()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  // final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final UserRepository userRepository;
  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: _buildApp(),
    );
  }

  _buildApp() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is UninitializedState) {
          return SplashScreen();
        } else if (state is UnauthenticatedState) {
          return LoginScreen(
            userRepository: userRepository,
          );
        } else if (state is AuthenticatedState) {
          return FeedsScreen();
        } else if (state is LoadingState) {
          return LoadingIndicator();
        }
        return SplashScreen();
      },
    );
  }
}
