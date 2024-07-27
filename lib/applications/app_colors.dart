import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xffff0000);
  static ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: AppColor.primaryColor);
  static const Map<int, Color> colorSwatch = {
    50: Color(0xfffff0f0),
    100: Color(0xffffdddd),
    200: Color(0xffffc0c0),
    300: Color(0xffff9494),
    400: Color(0xffff5757),
    500: Color(0xffff2323),
    600: Color(0xffff0000),
    700: Color(0xffd70000),
    800: Color(0xffb10303),
    900: Color(0xff920a0a),
    950: Color(0xff500000),
  };
}
