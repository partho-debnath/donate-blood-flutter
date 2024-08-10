import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final Map<String, dynamic> formData;
  const OtpScreen({super.key, required this.formData});
  static const String routeName = '/verify-otp-screen/';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final ValueNotifier _otpExpiredTimeCounter = ValueNotifier<int>(-1);
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: Center(
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/blood-donation.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    errorTextSpace: 20,
                    errorTextMargin: const EdgeInsets.only(left: 26),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.black54,
                    ),
                    onSaved: (newValue) {
                      log('OTP: $newValue');
                      _formData.addAll({'otp': newValue!});
                    },
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter the OTP.';
                      } else if (value!.length < 6) {
                        return 'Enter the valid OTP';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate() == true) {
                        _form.currentState!.save();
                        log('==' + _formData.toString());
                        _form.currentState!.reset();

                        // _form.currentState!.reset();
                      } else {
                        log('---Error--');
                      }
                    },
                    child: const Text(
                      'Next',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: _otpExpiredTimeCounter,
                    child: const Text('Resend OTP'),
                    builder: (context, value, child) {
                      return OutlinedButton.icon(
                        onPressed: _otpExpiredTimeCounter.value == -1
                            ? () {
                                log('Send OTP');
                                timer();
                              }
                            : null,
                        label: _otpExpiredTimeCounter.value == -1
                            ? child!
                            : Text('$value Sec.'),
                        icon: const Icon(Icons.send),
                      );
                    },
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

  void timer() {
    _otpExpiredTimeCounter.value = 0;
    Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        if (_otpExpiredTimeCounter.value >= 10) {
          time.cancel();
          _otpExpiredTimeCounter.value = -1;
        } else {
          _otpExpiredTimeCounter.value += 1;
        }
      },
    );
  }
}
