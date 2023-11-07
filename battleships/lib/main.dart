import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:battleships/screens/home_screen.dart';
import 'package:battleships/screens/login_screen.dart';
import 'package:battleships/screens/register_screen.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        // '/home': (context) => const HomeScreen(),
        // '/game': (context) => const GameScreen(),
      },
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
