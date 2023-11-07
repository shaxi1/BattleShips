import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26), // Set the background color
      body: Center(
        child: Text(
          "In Construction",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}