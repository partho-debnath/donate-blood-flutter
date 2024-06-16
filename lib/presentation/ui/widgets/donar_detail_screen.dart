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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('date'),
          );
        },
      ),
    );
  }
}
