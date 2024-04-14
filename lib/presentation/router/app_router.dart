import 'package:flutter/material.dart';
import '../screens/login/login_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../../constants/screens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Screens.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}
