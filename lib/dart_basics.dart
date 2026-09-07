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
  print('----- Student -----');
  print('Name: ${student.name}');
  print('Age: ${student.age}');
  print('Course: ${student.course}');
  print('Skills:');

  for (var skill in student.skills) {
    print('- $skill');
  }

  if (student.age >= 18) {
    print('Status: Adult');
  } else {
    print('Status: Minor');
  }

  print('');
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