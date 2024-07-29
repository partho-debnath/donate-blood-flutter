import 'package:flutter/material.dart';

import './blood_donate_request_screen.dart';
import './blood_donated_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard-screen/';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            tabs: <Tab>[
              Tab(
                text: 'Requested',
              ),
              Tab(text: 'Donated'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BloodDonateRequestScreen(),
            BloodDonatedListScreen()
          ],
        ),
      ),
    );
  }
}
