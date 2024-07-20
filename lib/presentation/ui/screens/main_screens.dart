import 'dart:developer';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main-screen/';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (mounted) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        backgroundColor: const Color(0xffff0000),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: bottomNavigationBarItemActiveIcon(
              const Icon(Icons.home),
            ),
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: const Color(0xffff0000),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
            backgroundColor: const Color(0xffff0000),
            activeIcon: bottomNavigationBarItemActiveIcon(
              const Icon(Icons.dashboard),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bloodtype_outlined),
            label: 'Ask Blood',
            backgroundColor: const Color(0xffff0000),
            activeIcon: bottomNavigationBarItemActiveIcon(
              const Icon(Icons.bloodtype_rounded),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_active_outlined),
            label: 'Notifications',
            backgroundColor: const Color(0xffff0000),
            activeIcon: bottomNavigationBarItemActiveIcon(
              const Icon(Icons.notifications_active_sharp),
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'Profile',
            backgroundColor: const Color(0xffff0000),
            activeIcon: bottomNavigationBarItemActiveIcon(
              const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }

  Container bottomNavigationBarItemActiveIcon(Icon icon) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.elliptical(20, 25),
        ),
        color: Colors.red.shade400,
      ),
      child: icon,
    );
  }
}
