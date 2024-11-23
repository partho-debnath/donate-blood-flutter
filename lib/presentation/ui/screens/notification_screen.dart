import 'package:blooddonate/applications/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/main-screen/';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            selected: index == 5,
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.colorSwatch[200],
              ),
              child: const Icon(
                Icons.bloodtype,
                size: 30,
              ),
            ),
            title: const Text('Name'),
            subtitle: const Text('friend request accepted.'),
            trailing: const Text('2 days ago.'),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 5,
        ),
        itemCount: 10,
      ),
    );
  }
}
