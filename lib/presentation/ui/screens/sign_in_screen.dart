import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import './sign_up_first_screen.dart';
import './home_screen.dart';
import 'send_email_otp_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/sign-in-screen/';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late String? password;
  bool isPasswordInvisible = true;
  final Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: Form(
          key: form,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    'images/blood-donation.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
                    ),
                    onSaved: (newValue) {
                      log('Email: $newValue');
                      formData.addAll({'email': newValue!});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter an E-mail.';
                      }
                      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!.trim()) ==
                          false) {
                        return 'Please Enter valid E-mail';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: isPasswordInvisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordInvisible = !isPasswordInvisible;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                    onSaved: (newValue) {
                      log('Password: $newValue');
                      formData.addAll({'password': newValue!});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter password.';
                      }
                      if (value!.length < 7) {
                        return 'Password is too short.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (form.currentState!.validate() == true) {
                        form.currentState!.save();
                        log(formData.toString());
                        form.currentState!.reset();
                        Get.offAllNamed(HomeScreen.routeName);
                      } else {
                        log('-----');
                      }
                    },
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(50, 30),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onPressed: () {
                      Get.toNamed(SendEmailOtpScreen.routeName);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xffff0000),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have\'t an account?',
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(SignUpFirstScreen.routeName);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xffff0000),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
