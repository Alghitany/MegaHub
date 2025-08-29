import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hub/core/routing/routes.dart';
import 'package:mega_hub/features/achivement/ui/achivement_screen.dart';
import 'package:mega_hub/features/authentication/login/logic/login_cubit.dart';
import 'package:mega_hub/features/authentication/login/ui/login_screen.dart';
import 'package:mega_hub/features/authentication/signup/ui/signup_screen.dart';
import 'package:mega_hub/features/profile/ui/profile_screen.dart';
import '../../features/authentication/signup/logic/signup_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../di/dependecy_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupScreen(),
              ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ));
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case Routes.achievementScreen:
        return MaterialPageRoute(builder: (_) => const AchivementScreen());
      default:
        return null;

    }
  }
}
