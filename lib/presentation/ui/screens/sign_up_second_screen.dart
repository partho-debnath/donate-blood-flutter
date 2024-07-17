import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../utils/gps_location.dart';

class SignUpSecondScreen extends StatefulWidget {
  Map<String, dynamic> formData;
  static const String routeName = '/Sign-Up-Second-screen/';
  SignUpSecondScreen({super.key, required this.formData});

  @override
  State<SignUpSecondScreen> createState() => _SignUpSecondScreenState();
}

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late final TextEditingController _imageTextEditingController;
  late final _confirmPasswordFocus;
  late String? password, confirmPassword;
  File? imageFile;
  bool isPasswordInvisible = true, isConfirmPasswordInvisible = true;
  LocationData? locationData;

  @override
  void initState() {
    _imageTextEditingController =
        TextEditingController(text: 'No Image Select.');
    _confirmPasswordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _imageTextEditingController.dispose();
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
                  children: <Widget>[
                    if (imageFile != null)
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: MemoryImage(
                          imageFile!.readAsBytesSync(),
                          scale: 1,
                        ),
                      )
                    else
                      Image.asset(
                        'images/blood-donation.png',
                        width: 100,
                        height: 100,
                      ),
                    const SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      controller: _imageTextEditingController,
                      decoration: InputDecoration(
                        prefixIcon: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black54,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            await showImagePicker();
                          },
                          child: const Text('Image'),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value! == 'No Image Select.') {
                          return 'Please select an Image.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Height in Feet',
                                hintText: '6.7',
                                prefixIcon:
                                    Icon(Icons.height, color: Colors.green)),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Select your Date of Birth.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              widget.formData.addAll({'height': newValue});
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Weight',
                              hintText: '60Kg',
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Select your Date of Birth.';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              widget.formData.addAll({'weight': newValue});
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        prefixIcon: const Icon(Icons.map, color: Colors.green),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            locationData = await getGpsLocation();
                            if (locationData != null) {
                              log('locationData $locationData');
                              log('Latitude ${locationData!.latitude}');
                              log('Longitude ${locationData!.longitude}');
                            }
                          },
                          icon: const Tooltip(
                            message: 'Tap this Icon.',
                            child: Icon(Icons.gps_fixed),
                          ),
                        ),
                      ),
                      onSaved: (newValue) {
                        log('Address: $newValue');
                        widget.formData.addAll({'address': newValue});
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your address.';
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
                        widget.formData.addAll({'password': newValue});
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
                        widget.formData.addAll({'confirm_password': newValue});
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
                          log('------Ok-------');
                          log(widget.formData.toString());
                          // form.currentState!.reset();
                        } else {
                          print('---Error--');
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

  Future<ImageSource?> showImageSource() async {
    final ImageSource? imageSource = await showDialog<ImageSource?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Camera'),
                leading: const Icon(Icons.camera),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                leading: const Icon(Icons.photo),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );

    return imageSource;
  }

  Future<void> showImagePicker() async {
    final ImageSource? imageSource = await showImageSource();
    if (imageSource != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: imageSource);
      log("${image?.name}");
      if (image != null) {
        if (mounted) {
          setState(() {
            _imageTextEditingController.text = image.name;
            imageFile = File(image.path);
          });
        }
      }
    }
  }
}
