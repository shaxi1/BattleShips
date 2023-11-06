import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      if (currentIndex == index) return;
      switch (index) {
        case 0:
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          break;
        case 1:
          Navigator.pushNamed(context, '/TODO');
          break;
        case 2:
          Navigator.pushNamed(context, '/TODO2');
          break;
      }
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Blank',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color.fromARGB(255, 225, 225, 225),
      onTap: onItemTapped,
    );
  }
}
