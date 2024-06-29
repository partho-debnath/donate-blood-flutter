import 'package:blooddonate/presentation/ui/screens/login_screen.dart';
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
  bool isPasswordInvisible = true, isConfirmPasswordInvisible = true;

  @override
  void initState() {
    _confirmPasswordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _confirmPasswordFocus.dispose();
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (newValue) {
                        print('Email: $newValue');
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
                        print('Password: $newValue');
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
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (form.currentState!.validate() == true) {
                          form.currentState!.save();
                          form.currentState!.reset();
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
}
