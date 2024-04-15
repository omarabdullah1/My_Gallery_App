import 'package:flutter/material.dart';
import 'package:my_gallery_app/presentation/screens/home/home_screen.dart';
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
        case Screens.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
