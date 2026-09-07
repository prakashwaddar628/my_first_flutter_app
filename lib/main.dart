import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileSearch(),
    );
  }
}

class ProfileSearch extends StatelessWidget {
  const ProfileSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Search'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // this all comes under the column widget which is used to arrange the widgets vertically
              children : [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Prakash',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Software Engineer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Text(
                      'prakash@example.com'
                    )
                  ]
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: const Text('Contact'),
                ),
              ]
            ),
          ),
        ),
        )
    );
  }
}