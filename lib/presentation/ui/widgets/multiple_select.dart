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
    return ListView.separated(
      padding: const EdgeInsets.only(left: 10),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemBuilder: (context, index) {
        return ChoiceChip(
          label: Text(bloodGroups[index]['label']),
          selected: bloodGroups[index]['isSelected'],
          onSelected: (value) {
            if (mounted) {
              setState(() {
                bloodGroups[index]['isSelected'] = value;
              });
            }
            if (value) {
              selectedBloodGroups.add(bloodGroups[index]);
            } else {
              selectedBloodGroups.removeWhere(
                  (element) => element['label'] == bloodGroups[index]['label']);
            }
            widget.onSelected(selectedBloodGroups);
          },
        );
      },
      itemCount: bloodGroups.length,
    );
  }
}
