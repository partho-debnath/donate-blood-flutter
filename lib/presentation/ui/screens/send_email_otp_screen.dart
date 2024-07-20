import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp.dart';

class SendEmailOtpScreen extends StatefulWidget {
  const SendEmailOtpScreen({super.key});
  static const String routeName = '/send-email-otp-screen/';

  @override
  State<SendEmailOtpScreen> createState() => _SendEmailOtpScreenState();
}

class _SendEmailOtpScreenState extends State<SendEmailOtpScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final ValueNotifier _otpExpiredTimeCounter = ValueNotifier<int>(0);
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Email OTP'),
      ),
      body: Center(
        child: Form(
          key: _form,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.email),
                    ),
                    onSaved: (newValue) {
                      log('E-mail: $newValue');
                      _formData.addAll({'email': newValue!});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email.';
                      }
                      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!.trim()) ==
                          false) {
                        return 'Please enter your valid email.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.grey.shade400,
                    ),
                    onPressed: () {
                      if (_form.currentState!.validate() == true) {
                        _form.currentState!.save();
                        log(_formData.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return OtpScreen(formData: _formData);
                            },
                          ),
                        );
                      } else {
                        log('-----');
                      }
                    },
                    child: const Text(
                      'Send OTP',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Remember Password?',
                        style: TextStyle(
                          color: Colors.red.shade300,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Sign In',
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
