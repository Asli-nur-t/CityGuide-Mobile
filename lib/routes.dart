import 'package:cityguidemob/screens/Login/login_screen.dart';
import 'package:cityguidemob/screens/detail/details_screen.dart';
import 'package:cityguidemob/screens/home/home_screen.dart';
import 'package:cityguidemob/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String details = '/details';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    signup: (context) => const SignUpScreen(),
    home: (context) => const HomeScreen(),
    details: (contest) => const DetailsScreen(
          placeName: '',
          description: '',
          address: '',
        ),
  };
}
