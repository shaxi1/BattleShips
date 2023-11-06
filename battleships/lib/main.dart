import 'package:flutter/material.dart';

import 'routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BattleShips',
      debugShowCheckedModeBanner: false,
      // theme: themeData(),
      initialRoute: '/',
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
