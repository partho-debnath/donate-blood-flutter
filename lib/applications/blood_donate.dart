import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../presentation/ui/screens/home_screen.dart';
import '../presentation/ui/screens/login_screen.dart';
import '../presentation/ui/screens/registration_screen.dart';
import '../presentation/ui/screens/splash_screen.dart';
import './binders.dart';

class BloodDonate extends StatelessWidget {
  const BloodDonate({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Donate',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        colorSchemeSeed: const Color(0xffff0000),
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: const Color(0xffff0000),
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            // gapPadding: 4,
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll<Color>(
              Colors.white,
            ),
            textStyle: const WidgetStatePropertyAll<TextStyle>(
              TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const WidgetStatePropertyAll<Color>(
              Color(0xffff0000),
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            minimumSize: const WidgetStatePropertyAll(
              Size.fromHeight(40),
            ),
            maximumSize: const WidgetStatePropertyAll(
              Size.fromHeight(80),
            ),
          ),
        ),
      ),
      initialRoute: LoginScreen.routeName,
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RegistrationScreen.routeName,
          page: () => const RegistrationScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
