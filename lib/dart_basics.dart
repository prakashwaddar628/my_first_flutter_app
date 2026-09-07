import 'dart:developer' as developer;

class Student {
  String name;
  int age;
  String course;
  List<String> skills;

  Student({
    required this.name,
    required this.age,
    required this.course,
    required this.skills,
  });
}

void printStudentDetails(Student student) {
  developer.log('----- Student -----');
  developer.log('Name: ${student.name}');
  developer.log('Age: ${student.age}');
  developer.log('Course: ${student.course}');
  developer.log('Skills:');

  for (var skill in student.skills) {
    developer.log('- $skill');
  }

  if (student.age >= 18) {
    developer.log('Status: Adult');
  } else {
    developer.log('Status: Minor');
  }

  developer.log('');
}

void main() {
  List<Student> students = [
    Student(
      name: 'Prakash L Waddar',
      age: 25,
      course: 'Flutter Development',
      skills: [
        'Dart',
        'Flutter',
        'Firebase',
      ],
    ),
    Student(
      name: 'John Doe',
      age: 30,
      course: 'Web Development',
      skills: [
        'HTML',
        'CSS',
        'JavaScript',
      ],
    ),
    Student(
      name: 'Jane Smith',
      age: 28,
      course: 'Data Science',
      skills: [
        'Python',
        'R',
        'SQL',
      ],
    ),
  ];

  for (var student in students) {
    printStudentDetails(student);
  }
}