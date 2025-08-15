import 'package:flutter/material.dart';
import 'package:mega_hub/core/routing/routes.dart';
import '../../features/Signup/ui/signup_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
          case Routes.signupScreen:
            return MaterialPageRoute(
              builder: (_) => const SignupScreen(),
            );
          default:
            return null;
        }
  }
}