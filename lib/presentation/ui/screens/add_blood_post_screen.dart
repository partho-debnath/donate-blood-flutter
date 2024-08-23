import 'dart:developer';

import 'package:flutter/material.dart';

class AddBloodPostScreen extends StatefulWidget {
  const AddBloodPostScreen({super.key});

  @override
  State<AddBloodPostScreen> createState() => _AddBloodPostScreenState();
}

class _AddBloodPostScreenState extends State<AddBloodPostScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Select Blood Group',
            ),
            items: const <DropdownMenuItem>[
              DropdownMenuItem(
                value: 'A+',
                child: Text('A+'),
              ),
              DropdownMenuItem(
                value: 'A-',
                child: Text('A-'),
              ),
            ],
            onChanged: (value) {
              log(value.toString());
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Select Blood Group.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Address',
            ),
          ),
          const SizedBox(height: 10),
          // alignment: Alignment.center,
          TextFormField(),
        ],
      ),
    );
  }
}
