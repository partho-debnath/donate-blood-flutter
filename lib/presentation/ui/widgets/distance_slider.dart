import 'package:blooddonate/applications/app_colors.dart';
import 'package:flutter/material.dart';

class DistanceSlider extends StatefulWidget {
  void Function(double value) onChange;
  DistanceSlider({super.key, required this.onChange});

  @override
  State<DistanceSlider> createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: distance.toStringAsFixed(0),
      activeColor: AppColor.primaryColor,
      divisions: 100,
      max: 100,
      min: 0,
      value: distance,
      onChanged: (value) {
        setState(() {
          distance = value;
        });
        widget.onChange.call(value);
      },
    );
  }
}
