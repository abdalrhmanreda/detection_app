import 'package:detection_app/config/routes/routes_path.dart';
import 'package:detection_app/core/di/dependancy_injection.dart';
import 'package:detection_app/features/home/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/controller/auth_cubit.dart';
import '../../features/authentication/screens/login_screen/login_screen.dart';
import '../../features/authentication/screens/register_screen/register_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument is used to pass data from one screen to another
    final arguments = settings.arguments;
    switch (settings.name) {
      case RoutePath.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const LoginScreen()),
        );
      case RoutePath.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<AuthCubit>(),
              child: const RegisterScreen()),
        );
      case RoutePath.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
