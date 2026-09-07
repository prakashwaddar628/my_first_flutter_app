# my_first_flutter_app

A new Flutter project.

### Getting Started

This project is a starting point for a Flutter application.
```
    Flutter Learning App
    │
    ├── Home Screen
    │   ├── Profile
    │   ├── Counter
    │   └── Settings
    │
    ├── Login Screen
    │
    ├── API Screen
    │
    └── Local Storage
```

### Understand the widget tree

```
MaterialApp
│
└── ProfileScreen
     │
     └── Scaffold
          │
          ├── AppBar
          │    └── Text
          │
          └── Center
               │
               └── Card
                    │
                    └── Padding
                         │
                         └── Column
                              │
                              ├── CircleAvatar
                              ├── SizedBox
                              ├── Text
                              ├── SizedBox
                              ├── Text
                              ├── SizedBox
                              ├── Row
                              │    ├── Icon
                              │    ├── SizedBox
                              │    └── Text
                              │
                              ├── SizedBox
                              └── ElevatedButton
```

Classes — VERY important

Flutter is heavily based on classes and objects.

Create:
```
class User {
  String name;
  String role;
  int age;

  User({
    required this.name,
    required this.role,
    required this.age,
  });
}

Now create an object:

void main() {
  User user = User(
    name: 'Prakash',
    role: 'AI Developer',
    age: 25,
  );

  print(user.name);
  print(user.role);
  print(user.age);
}
```
Think:
```
             User class
                 │
       ┌─────────┼─────────┐
       ↓         ↓         ↓
     name       role      age
       │         │         │
   Prakash   AI Developer  25
```

And this should look familiar:

class MyApp extends StatelessWidget

Your Flutter widgets are classes too.