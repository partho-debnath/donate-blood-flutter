import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration-screen/';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late final _confirmPasswordFocus;
  late String? password, confirmPassword;
  final TextEditingController _dateAndBirthTextController =
      TextEditingController();
  bool isPasswordInvisible = true, isConfirmPasswordInvisible = true;

  @override
  void initState() {
    _confirmPasswordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _confirmPasswordFocus.dispose();
    _dateAndBirthTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: form,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                            onSaved: (newValue) {},
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
                            onSaved: (newValue) {},
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
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (newValue) {
                        log('Email: $newValue');
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
                            onSaved: (value) {
                              log('Gender $value');
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: DropdownButtonFormField(
                            hint: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Blood ",
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.bloodtype_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
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
                            onSaved: (value) {
                              log('blood $value');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
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
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: DropdownButtonFormField(
                            onChanged: (value) {},

                            hint: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Height ",
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.height,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            items: <DropdownMenuItem>[
                              ...getHeightList().map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text('$value'),
                                );
                              }),
                            ],
                            // onChanged: (value) {
                            //   log(value);
                            // },
                            validator: (value) {
                              if (value == null) {
                                return 'Select your height.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              log('Height $value');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 11,
                      decoration: const InputDecoration(
                        hintText: 'Mobile No',
                        labelText: '+88',
                        prefixIcon: Icon(Icons.phone, color: Colors.green),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                      onSaved: (newValue) {
                        log('Mobile No: $newValue');
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your mobile number.';
                        }
                        if (value!.length < 7) {
                          return 'Password is too short.';
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
                      },
                      onFieldSubmitted: (value) {
                        _confirmPasswordFocus.requestFocus();
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
                    TextFormField(
                      focusNode: _confirmPasswordFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: isConfirmPasswordInvisible,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordInvisible =
                                  !isConfirmPasswordInvisible;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      onSaved: (newValue) {
                        print('Password: $newValue');
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter password.';
                        }
                        if (value!.length < 7) {
                          return 'Password is too short.';
                        }
                        if (password != confirmPassword) {
                          return 'Password and Confirm Password must be same.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (form.currentState!.validate() == true) {
                          form.currentState!.save();
                          // form.currentState!.reset();
                        } else {
                          print('-----');
                        }
                      },
                      child: const Text(
                        'Sign Up',
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
                            'Login',
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
      setState(() {
        _dateAndBirthTextController.text = date.toString();
      });
    }
    return;
  }

  List<double> getHeightList() {
    final List<double> heightList = [
      5.6,
      6.0,
      6.5,
    ];
    return heightList;
  }
}
