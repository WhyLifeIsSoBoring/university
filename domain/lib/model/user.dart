import 'package:domain/model/role.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final Role role;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });
}
