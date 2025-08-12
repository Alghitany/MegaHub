import 'package:flutter/material.dart';
import 'package:mega_hub/core/routing/routes.dart';
import '../../features/home/ui/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}