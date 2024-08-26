import 'package:blooddonate/applications/app_colors.dart';
import 'package:flutter/material.dart';

class DonarDetailScreen extends StatelessWidget {
  const DonarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <IconButton>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            padding: const EdgeInsets.all(30),
            // height: 415,
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 80,
                  foregroundImage: NetworkImage(
                    'https://www.shutterstock.com/image-photo/profile-picture-smiling-young-african-260nw-1873784920.jpg',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'John Weak',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.colorSwatch[300],
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                        ),
                        Text(
                          '766',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.colorSwatch[300],
                          ),
                          child: const Icon(
                            Icons.star,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                        ),
                        Text(
                          '5000',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green.withOpacity(0.30),
                          ),
                          child: const Icon(
                            Icons.label,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        Text(
                          'Abc',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Friend'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
