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
                print(nameController.text);
                print(emailController.text);
                print(courseController.text);
              },
              child: const Text('Create Profile'),
            )
          ],
        )
      )  
    );
  }
}