import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.red,
        letterSpacing: 1.5,
      ),
    );
  }
}
