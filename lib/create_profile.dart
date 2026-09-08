import 'package:flutter/material.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();

  List<String> users = [];

  // Dispose the controllers when the widget is disposed
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    courseController.dispose();
    super.dispose();
  }

  void validateAndSubmit() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final course = courseController.text.trim();

    if (name.isEmpty || email.isEmpty || course.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields'),
      )
      );
    }

    void validateEmail(String email) {
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
    }
    }

    if (name.isNotEmpty && email.isNotEmpty && course.isNotEmpty) {
      validateEmail(email);
      setState(() {
        users.add('Name: $name, Email: $email, Course: $course');
      });

      nameController.clear();
      emailController.clear();
      courseController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile created successfully')),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'eg. John Doe',
              )
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'eg.  example@example.com',
              )
            ),

            const SizedBox(height: 20),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: 'Course',
                hintText: 'eg. git, flutter, python',
              )
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                validateAndSubmit();
              },
              child: const Text('Create Profile'),
            )
          ],
        )
      )  
    );
  }
}