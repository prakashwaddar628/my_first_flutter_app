import 'package:flutter/material.dart';

import 'models/user.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final User user;

  const ProfileDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Course: ${user.course}'),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Profile Viewed!');
              },
              child: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
