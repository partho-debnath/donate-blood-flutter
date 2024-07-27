import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../applications/app_colors.dart';

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
        return Container(
          // height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.colorSwatch[50],
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Material(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: AppColor.colorSwatch[100],
              borderRadius: BorderRadius.circular(5),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        'http://127.0.0.1:8000/media/profile_pictures/women_2.webp',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Eliana Nath',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('A+'),
                        Tooltip(
                          message: 'Donation Date.',
                          child:
                              Text(DateFormat.yMMMEd().format(DateTime.now())),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text('Urgent'),
                      labelPadding: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 2),
      itemCount: 4,
    );
  }
}
