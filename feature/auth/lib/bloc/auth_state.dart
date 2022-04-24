class AuthState {
  final AuthError? error;

  AuthState({this.error});
}

abstract class AuthError {}

class WrongCredentials extends AuthError {}

class EmailInUse extends AuthError {}