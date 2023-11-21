import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:battleships/providers/AuthProvider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define button height and color
    double buttonHeight = 50.0;
    final buttonColor = Color(0xFF446792); // D

    return Scaffold(
      backgroundColor: Color(0xFF141D26), // Set the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                // Check if the user is authenticated
                if (authProvider.user != null && authProvider.userData != null) {
                  String nickname = authProvider.userData!['nickname'];

                  // Display the user's nickname
                  return Text(
                    'Welcome, $nickname!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  );
                  
                } else {
                  // If the user is not authenticated, show a login button
                  return FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Container(
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(buttonColor),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 20), // Add spacing between buttons
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the second button press
                    // Replace '/second' with your desired route
                    //Navigator.pushNamed(context, '/second');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Utwórz pokój'),
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the second button press
                    // Replace '/second' with your desired route
                    //Navigator.pushNamed(context, '/second');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Szukaj pokojów'),
                ),
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the third button press
                    // Replace '/third' with your desired route
                    //Navigator.pushNamed(context, '/third');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Znajomi'),
                ),
              ),
            ),
            SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the fourth button press
                    // Replace '/fourth' with your desired route
                    //Navigator.pushNamed(context, '/fourth');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Ranking'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
