import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            SizedBox(height: 20),

            // Email field
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight, // Set the input field height
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),

            // Add spacing between email and password fields
            SizedBox(height: 20),

            // Password field
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight, // Set the input field height
                child: TextField(
                  obscureText: true, // To hide the password
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                  ),
                ),
              ),
            ),

            // Add spacing between the input fields and buttons
            SizedBox(height: 40),

            // Login button
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight, // Set the button height
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the login button press
                    
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}