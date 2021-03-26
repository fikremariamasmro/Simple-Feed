import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_feed/app.dart';

class AppRouter {
  static final userRepository =
      UserRepository(firebaseAuth: FirebaseAuth.instance);

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Constants.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case Constants.loginScreenRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(userRepository: userRepository));
        break;
      case Constants.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => FeedListScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child:
                          Text('No route defined for ${routeSettings.name}')),
                ));
    }
  }
}
