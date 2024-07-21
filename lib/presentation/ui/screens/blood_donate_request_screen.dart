import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BloodDonateRequestScreen extends StatefulWidget {
  const BloodDonateRequestScreen({super.key});

  @override
  State<BloodDonateRequestScreen> createState() =>
      _BloodDonateRequestScreenState();
}

class _BloodDonateRequestScreenState extends State<BloodDonateRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          child: ListTile(
            dense: true,
            leading: Container(
              color: Colors.grey.shade300,
              height: 50,
              width: 50,
              child: FlutterLogo(),
            ),
            title: Text('Name of the.'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('A+'),
                Text(DateFormat.yMMMEd().format(DateTime.now())),
              ],
            ),
            onTap: () {
              log(index.toString());
            },
            enableFeedback: true,
            textColor: Colors.black,
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            trailing: const Chip(
              label: Text('Urgent'),
              labelPadding: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 2),
      itemCount: 60,
    );
  }
}
