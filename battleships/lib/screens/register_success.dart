import 'package:flutter/material.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26), // Set the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Success",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 20), // Add some spacing between the text and the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}