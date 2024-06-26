import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;
  final String imageUrl;
  final String rollNumber;
  final String batch;
  final String course;

  const ProfileScreen({
    super.key,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.rollNumber,
    required this.batch,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text('Username: $username'),
            Text('Email: $email'),
            Text('Roll Number: $rollNumber'),
            Text('Batch: $batch'),
            Text('Course: $course'),
          ],
        ),
      ),
    );
  }
}
