import 'package:flutter/material.dart';
import 'package:guliva/core/error/exceptions.dart';
import 'package:guliva/features/auth/presentation/screens/login_screen.dart';
import 'package:guliva/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:guliva/features/vehicles/presentation/screens/vehicles_and_passengers_screen.dart';

class AppRouter {
  //main menu
  static const String home = '/';
  //authentication
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => const VehiclesAndPassengersScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
