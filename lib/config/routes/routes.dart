import 'package:bloc_clean/config/routes/route_name.dart';
import 'package:bloc_clean/view/view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
