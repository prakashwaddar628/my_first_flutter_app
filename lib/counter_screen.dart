import 'package:flutter/material.dart';

import 'profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  String get counterMessage {
    if (counter == 0) {
      return 'Counter is at zero';
    } else if (counter < 0) {
      return 'Counter is negative';
    } else {
      return 'Counter is positive';
    }
  }

  void increaseCounter() {
    setState(() {
      counter += 1;
    });
  }

  void increaseFive() {
    setState(() {
      counter += 5;
    });
  }

  void decreaseCounter() {
    setState(() {
      if (counter >= 1) {
        counter -= 1;
      } else {
        counter = 0; // Prevent counter from going below 0
      }
    });
  }

  void decreaseFive() {
    setState(() {
      if (counter >= 5) {
        counter -= 5;
      } else {
        counter = 0;
      }
    });
  }

  void resetCounter() {
    setState(() {
      if (counter > 0) {
        counter = 0;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Counter is already at 0'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileSearch()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$counter',
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  counterMessage,
                  style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: decreaseCounter,
                  child: const Text('-1'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: decreaseFive,
                  child: const Text('-5'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: resetCounter,
                  child: const Text('Reset'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: increaseCounter,
                  child: const Text('+1'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: increaseFive,
                  child: const Text('+5'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
