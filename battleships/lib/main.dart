import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'routes.dart';
import 'package:battleships/theme.dart';
import 'package:provider/provider.dart';
import 'package:battleships/providers/AuthProvider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
      title: 'BattleShips',
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      // initialRoute:
      //     '/ship-deployment', // TODO: remove line, only for ship deployment testing
      onGenerateRoute: MyRouter.generateRoute, // class containing app's routes
    )
    );
  }
}
