import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../utils/gps_location.dart';

class AddBloodPostScreen extends StatefulWidget {
  const AddBloodPostScreen({super.key});

  @override
  State<AddBloodPostScreen> createState() => _AddBloodPostScreenState();
}

class _AddBloodPostScreenState extends State<AddBloodPostScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController _dateAndTimeTextController =
      TextEditingController();
  LocationData? locationData;

  @override
  void dispose() {
    _dateAndTimeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: ListView(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
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
            maxLines: 2,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Address',
              prefixIcon: const Icon(Icons.map, color: Colors.green),
              suffixIcon: IconButton(
                onPressed: () async {
                  locationData = await getGpsLocation();
                  if (locationData != null) {
                    log('locationData $locationData');
                    log('Latitude ${locationData!.latitude}');
                    log('Longitude ${locationData!.longitude}');
                  }
                },
                icon: const Tooltip(
                  message: 'Tap this Icon.',
                  child: Icon(Icons.gps_fixed),
                ),
              ),
            ),
            onSaved: (newValue) {
              log('Address: $newValue');
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your address.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            onTap: () {
              _selectDateTime(context);
            },
            readOnly: true,
            controller: _dateAndTimeTextController,
            decoration: InputDecoration(
              hintText: 'Date & Time',
              prefixIcon: IconButton(
                onPressed: () {
                  _selectDateTime(context);
                },
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.green,
                ),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Select date & time.';
              }
              return null;
            },
            onSaved: (newValue) {
              log('Date and time $newValue');
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 8,
            decoration: const InputDecoration(
              hintText: 'Description',
              prefixIcon: Icon(
                Icons.description_outlined,
                color: Colors.green,
              ),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Enter descriptions.';
              }
              return null;
            },
            onSaved: (newValue) {
              log('Description: $newValue');
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              if (form.currentState!.validate()) {
                form.currentState!.save();
              } else {
                log('---Error---');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (pickedDate != null && mounted == true) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dialOnly,
      );
      if (pickedTime != null) {
        setState(() {
          _dateAndTimeTextController.text =
              "${DateFormat.yMMMEd().format(pickedDate)}, ${pickedTime.format(context)}";
        });
      }
    }
  }
}
