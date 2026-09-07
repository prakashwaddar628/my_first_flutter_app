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
      home: Scaffold(
        appBar: AppBar(title: const Text('My Flutter')),
        body: const Center(
          child: Text('Welcome Prakash', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action when button is pressed
            print('Floating Action Button Pressed');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
