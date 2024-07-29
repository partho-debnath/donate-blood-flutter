import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../applications/app_colors.dart';

class BloodDonatedListScreen extends StatefulWidget {
  const BloodDonatedListScreen({super.key});

  @override
  State<BloodDonatedListScreen> createState() => _BloodDonatedListScreenState();
}

class _BloodDonatedListScreenState extends State<BloodDonatedListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                        'https://www.shutterstock.com/image-photo/profile-picture-smiling-young-african-260nw-1873784920.jpg',
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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('1 Beg'),
                        SizedBox(height: 10),
                        Chip(
                          label: Text('Urgent'),
                          labelPadding: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}
