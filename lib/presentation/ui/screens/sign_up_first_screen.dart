import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/helpers.dart';

import '../widgets/PhoneNumberFormField.dart';
import 'sign_up_second_screen.dart';

class SignUpFirstScreen extends StatefulWidget {
  static const String routeName = '/sign-up-first-screen/';
  const SignUpFirstScreen({super.key});

  @override
  State<SignUpFirstScreen> createState() => _SignUpFirstScreenState();
}

class _SignUpFirstScreenState extends State<SignUpFirstScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController _dateAndBirthTextController =
      TextEditingController();
  late DateTime dateAndBirth;
  final Map<String, dynamic> formData = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Form(
          key: form,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/blood-donation.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your first name.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            formData.addAll({'first_name': newValue});
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Enter your last name.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            formData.addAll({'last_name': newValue});
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                    ),
                    onSaved: (newValue) {
                      log('Email: $newValue');
                      formData.addAll({'email': newValue});
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(10.0),
                          hint: const Text('Gender'),
                          items: <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: 'm',
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  text: 'Male ',
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Icon(Icons.male),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'f',
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  text: 'Female ',
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Icon(Icons.female),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Select your gender';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            log('Gender $newValue');
                            formData.addAll({'gender': newValue});
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(10.0),
                          hint: const Row(
                            children: <Widget>[
                              Icon(
                                Icons.bloodtype_outlined,
                                color: Colors.red,
                              ),
                              Text('Blood Group'),
                            ],
                          ),
                          items: const <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: 'a+',
                              child: Text('A Positive'),
                            ),
                            DropdownMenuItem(
                              value: 'a-',
                              child: Text('A Negative'),
                            ),
                          ],
                          onChanged: (value) {
                            log(value);
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Select your blood group';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            log('blood $newValue');
                            formData.addAll({'blood_group': newValue});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTap: () {
                      showCalender(context);
                    },
                    readOnly: true,
                    controller: _dateAndBirthTextController,
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      prefixIcon: IconButton(
                        onPressed: () {
                          showCalender(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Select your Date of Birth.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      log('Date of Birth $newValue');
                      formData.addAll({'date_of_birth': dateAndBirth});
                    },
                  ),
                  const SizedBox(height: 10),
                  PhoneNumberFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Enter your mobile number.';
                      } else if (!isNumeric(value.number)) {
                        return 'Invalid mobile number';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      log('Phone Number ->: $newValue');
                      formData.addAll({'mobile_number': 'newValue'});
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (form.currentState!.validate() == true) {
                        form.currentState!.save();
                        log(formData.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpSecondScreen(
                                formData: formData,
                              );
                            },
                          ),
                        );
                        // form.currentState!.reset();
                        log('------Ok-------');
                      } else {
                        print('---Error--');
                      }
                    },
                    child: const Text(
                      'Next',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account?',
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

  Future<void> showCalender(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (date != null) {
      dateAndBirth = date;
      setState(() {
        _dateAndBirthTextController.text = DateFormat.yMMMEd().format(date);
      });
    }
    return;
  }
}
