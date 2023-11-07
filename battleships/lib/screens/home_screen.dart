import 'package:flutter/material.dart';
import 'package:battleships/screens/login_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final buttonColor = Color(0xFF446792); // Define the button color
    final buttonHeight = 50.0; // Define the button height

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your logo or image
            Image.asset('assets/images/logo.png', width: 220, height: 220), // Replace with the actual path to your logo image.

            // Add some spacing
            SizedBox(height: 60),

            // Use FractionallySizedBox to make the buttons 80% of the screen width
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight, // Set the button height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the login button press
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Login'),
                ),
              ),
            ),

            // Add spacing between the buttons
            SizedBox(height: 40),

            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight, // Set the button height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the register button press
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}