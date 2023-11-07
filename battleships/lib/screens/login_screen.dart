import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> loginUser(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pushNamed(context, '/home');
  } catch (e) {
    // Handle login failure
  }
}



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers to free up resources when the widget is removed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  controller: emailController,
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
                  controller: passwordController,
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
                    // Get the text from the email and password fields
                    String email = emailController.text;
                    String password = passwordController.text;

                    // You can now use the email and password variables as needed.
                    loginUser(email, password, context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Login'),
                ),
              ),
            ),

            // Add spacing between the buttons
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
