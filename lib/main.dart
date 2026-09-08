import 'package:flutter/material.dart';

import 'counter_screen.dart';
import 'create_profile.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<_DashboardAction> actions = [
    _DashboardAction(
      title: 'Counter',
      icon: Icons.calculate_outlined,
      color: Colors.blue,
      destination: const CounterScreen(),
    ),
    _DashboardAction(
      title: 'Profile',
      icon: Icons.person_outline,
      color: Colors.deepPurple,
      destination: const ProfileSearch(),
    ),
    _DashboardAction(
      title: 'Create Profile',
      icon: Icons.person_add_alt_1_outlined,
      color: Colors.green,
      destination: const CreateProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose what you want to do today.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: actions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final action = actions[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => action.destination,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: action.color.withAlpha((255 * 0.12).round()),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: action.color.withAlpha((255 * 0.3).round()),
                        ),
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(action.icon, size: 38, color: action.color),
                          const SizedBox(height: 12),
                          Text(
                            action.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardAction {
  const _DashboardAction({
    required this.title,
    required this.icon,
    required this.color,
    required this.destination,
  });

  final String title;
  final IconData icon;
  final Color color;
  final Widget destination;
}
