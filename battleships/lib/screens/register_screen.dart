import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> registerUser(String email, String password, String nickname, String repeatPassword, BuildContext context) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'friends': [],
        'nickname': nickname,
        'points': 0,
        'isAvailable': false,
      });
    Navigator.pushNamed(context, '/registersuccess');
  } catch (e) {
    // Handle registration failure
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> { 
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

    @override
  void dispose() {
    // Dispose of the controllers to free up resources when the widget is removed
    emailController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = Color(0xFF446792); // Define the button color
    final buttonHeight = 50.0; // Define the button height

    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Your smaller logo or image
              Image.asset('assets/images/logo.png', width: 150, height: 150), // Replace with the actual path to your smaller logo image.
      
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
      
              // Add spacing between email and nickname fields
              SizedBox(height: 20),
      
              // Nickname field
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  height: buttonHeight, // Set the input field height
                  child: TextField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nickname',
                    ),
                  ),
                ),
              ),
      
              // Add spacing between nickname and password fields
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
      
              // Add spacing between password and repeat password fields
              SizedBox(height: 20),
      
              // Repeat Password field
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  height: buttonHeight, // Set the input field height
                  child: TextField(
                    controller: repeatPasswordController,
                    obscureText: true, // To hide the repeat password
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Repeat Password',
                    ),
                  ),
                ),
              ),
      
              // Add spacing between the input fields and buttons
              SizedBox(height: 40),
      
              // Registration button
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  height: buttonHeight, // Set the button height
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the registration button press
                      String email = emailController.text;
                      String password = passwordController.text;
                      String nickname = nicknameController.text;
                      String repeatPassword = repeatPasswordController.text;
      
                      //dodac checkowanie czy hasla sa takie same itd.
      
                      registerUser(email, password, nickname, repeatPassword, context);
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
      ),
    );
  }
}