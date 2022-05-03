import 'package:domain/domain.dart';

class RegistrationState {
  final RegistrationError? error;
  final Role? selectedRole;

  RegistrationState({this.error, this.selectedRole});

  RegistrationState copyWith({
    RegistrationError? error,
    Role? selectedRole,
  }) {
    return RegistrationState(
      error: error ?? error,
      selectedRole: selectedRole ?? selectedRole,
    );
  }
}

abstract class RegistrationError {}

class WrongCredentials extends RegistrationError {}

class EmailInUse extends RegistrationError {}
