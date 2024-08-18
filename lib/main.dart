import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './applications/blood_donate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const BloodDonate());
}
