import 'package:flutter/material.dart';

import 'models/user.dart';
import 'widgets/user_card.dart';
import 'profile_details.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // List<String> users = [];
  List<User> users = [];
  int? editingIndex;

  // Dispose the controllers when the widget is disposed
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'eg. John Doe',
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.trim().length < 4) {
                    return 'Please enter your name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'eg.  example@example.com',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final email = value.trim();

                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(email)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  hintText: 'eg. git, flutter, python',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      final user = User(
                        name: nameController.text.trim().toUpperCase(),
                        email: emailController.text.trim().toLowerCase(),
                        course: courseController.text.trim(),
                      );

                      if (editingIndex == null) {
                        users.add(user);
                      } else {
                        users[editingIndex!] = user;
                        editingIndex = null;
                      }
                    });

                    nameController.clear();
                    emailController.clear();
                    courseController.clear();
                  }
                },
                child: Text(
                  editingIndex == null ? 'Create Profile' : 'Update Profile',
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDetailsScreen(user: users[index]),
                          ),
                        );
                      },
                      user: users[index],
                      onEdit: () {
                        setState(() {
                          editingIndex = index;
                          nameController.text = users[index].name;
                          emailController.text = users[index].email;
                          courseController.text = users[index].course;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          users.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
