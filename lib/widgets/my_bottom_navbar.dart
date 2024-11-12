import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/recycle_center_screen.dart';
import '../screens/reward_screen.dart';
import '../utils.dart';

class MyBottomNavbar extends StatelessWidget {
  const MyBottomNavbar({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: lightGreen,
      // unselectedItemColor: darkGreen,
      currentIndex: selectedIndex,
      onTap: (value) {
        if (value == selectedIndex) return;

        Navigator.pop(context);

        switch (value) {
          case 0:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
            break;
          case 1:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const RecycleCenterScreen()),
            );
            break;
          case 2:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const RewardScreen()),
            );
          case 3:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          default:
            return;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.factory_rounded),
          label: 'Recycle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Rewards',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
