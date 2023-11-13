import 'package:flutter/material.dart';

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
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the login button press
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Gra rankingowa'),
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
                    Navigator.pushNamed(context, '/second');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Utworz pokoj'),
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
                    Navigator.pushNamed(context, '/third');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Utworz turniej'),
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
                    Navigator.pushNamed(context, '/fourth');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                  ),
                  child: Text('Przegladaj turnieje'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
