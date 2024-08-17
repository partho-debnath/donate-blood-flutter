import 'package:flutter/material.dart';

class MultipleSelect extends StatefulWidget {
  final void Function(List<Map<String, dynamic>> value) onSelected;
  const MultipleSelect({super.key, required this.onSelected});

  @override
  State<MultipleSelect> createState() => _MultipleSelectState();
}

class _MultipleSelectState extends State<MultipleSelect> {
  List<Map<String, dynamic>> bloodGroups = [
    {'label': 'O+', 'value': 'O+', 'isSelected': false},
    {'label': 'O-', 'value': 'O-', 'isSelected': false},
    {'label': 'A+', 'value': 'A+', 'isSelected': false},
    {'label': 'A-', 'value': 'A-', 'isSelected': false},
    {'label': 'B+', 'value': 'B+', 'isSelected': false},
    {'label': 'B-', 'value': 'B-', 'isSelected': false},
    {'label': 'AB+', 'value': 'AB+', 'isSelected': false},
    {'label': 'AB-', 'value': 'AB-', 'isSelected': false},
  ];
  List<Map<String, dynamic>> selectedBloodGroups = [];

  @override
  Widget build(context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: <Widget>[
        ...bloodGroups.map<SizedBox>((item) {
          return SizedBox(
            height: 35,
            child: ChoiceChip(
              label: Text(item['label']),
              selected: item['isSelected'],
              onSelected: (value) {
                final int index = bloodGroups.indexWhere(
                  (element) {
                    return element['label'] == item['label'];
                  },
                );
                if (mounted) {
                  setState(() {
                    bloodGroups[index]['isSelected'] = value;
                  });
                }
                if (value) {
                  selectedBloodGroups.add(item);
                } else {
                  selectedBloodGroups.removeWhere(
                      (element) => element['label'] == item['label']);
                }
                widget.onSelected(selectedBloodGroups);
              },
            ),
          );
        }),
      ],
    );
  }
}
