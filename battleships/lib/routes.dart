import 'package:flutter/material.dart';

import 'package:battleships/screens/login_screen.dart';
import 'package:battleships/screens/main_screen.dart';
import 'package:battleships/screens/register_screen.dart';
import 'package:battleships/screens/register_success.dart';
import 'package:battleships/screens/home_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/registersuccess':
        return MaterialPageRoute(builder: (_) => const RegisterSuccess());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      // case '/game':
      //   return MaterialPageRoute(builder: (_) => const GameScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
