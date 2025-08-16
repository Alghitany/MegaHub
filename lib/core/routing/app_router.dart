import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hub/core/routing/routes.dart';
import 'package:mega_hub/features/authentication/login/ui/login_screen.dart';
import 'package:mega_hub/features/authentication/signup/ui/signup_screen.dart';

import '../../features/authentication/signup/logic/signup_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../di/dependecy_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
