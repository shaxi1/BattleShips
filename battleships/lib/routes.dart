import 'package:flutter/material.dart';

import 'package:battleships/screens/home_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
