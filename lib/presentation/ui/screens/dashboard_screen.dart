import 'package:flutter/material.dart';

import './blood_donate_request_screen.dart';
import './blood_donated_list_screen.dart';
import './add_blood_post_screen.dart';

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
      length: 3,
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
              Tab(text: 'Add Blood Post'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BloodDonateRequestScreen(),
            BloodDonatedListScreen(),
            AddBloodPostScreen(),
          ],
        ),
      ),
    );
  }
}
