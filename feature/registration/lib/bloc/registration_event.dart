import 'package:domain/domain.dart';

abstract class RegistrationEvent {}

class SignUp extends RegistrationEvent {
  final RegisterParams registerParams;

  SignUp({
    required this.registerParams,
  });
}

class SelectRole extends RegistrationEvent {
  final Role? role;

  SelectRole({required this.role});
}

class Pop extends RegistrationEvent {}
