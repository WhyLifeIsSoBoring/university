import 'package:domain/model/role.dart';

class RegisterParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final Role role;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
  });
}
