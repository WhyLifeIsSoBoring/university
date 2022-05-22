import 'package:domain/model/role.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final Role role;
  final List<String> achievements;
  final List<String> schools;
  final List<String> courses;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.achievements,
    required this.schools,
    required this.courses,
  });
}
