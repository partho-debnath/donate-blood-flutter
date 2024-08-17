import 'dart:developer';

import 'package:blooddonate/applications/app_colors.dart';
import 'package:flutter/material.dart';

import './home_screen.dart';
import './dashboard_screen.dart';
import './ask_blood_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main-screen/';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    screens = [
      const HomeScreen(),
      const DashboardScreen(),
      const AskBloodScreen(),
      Text('Notification'),
      Text('Profile'),
    ];
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (mounted) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        backgroundColor: AppColor.primaryColor,
        items: bottomNavigationBarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: bottomNavigationBarItemActiveIcon(
          const Icon(Icons.home),
        ),
        icon: const Icon(Icons.home_outlined),
        label: 'Home',
        backgroundColor: AppColor.primaryColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.dashboard_outlined),
        label: 'Dashboard',
        backgroundColor: AppColor.primaryColor,
        activeIcon: bottomNavigationBarItemActiveIcon(
          const Icon(Icons.dashboard),
        ),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.bloodtype_outlined),
        label: 'Ask Blood',
        backgroundColor: AppColor.primaryColor,
        activeIcon: bottomNavigationBarItemActiveIcon(
          const Icon(Icons.bloodtype_rounded),
        ),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.notifications_active_outlined),
        label: 'Notifications',
        backgroundColor: AppColor.primaryColor,
        activeIcon: bottomNavigationBarItemActiveIcon(
          const Icon(Icons.notifications_active_sharp),
        ),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_outline),
        label: 'Profile',
        backgroundColor: AppColor.primaryColor,
        activeIcon: bottomNavigationBarItemActiveIcon(
          const Icon(Icons.person),
        ),
      ),
    ];
  }

  Container bottomNavigationBarItemActiveIcon(Icon icon) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.elliptical(20, 25),
        ),
        color: AppColor.colorSwatch[400],
      ),
      child: icon,
    );
  }
}
