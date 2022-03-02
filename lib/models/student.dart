import 'package:hive_project/common.dart';

part 'student.g.dart';

@HiveType(typeId: kStudentKey)
class Student extends HiveObject {
  @HiveField(0)
  final String studentId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final String bio;

  Student({
    required this.studentId,
    required this.name,
    required this.age,
    required this.bio,
  });
}
