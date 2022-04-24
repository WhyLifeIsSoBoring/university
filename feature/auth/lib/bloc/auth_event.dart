import 'package:domain/domain.dart';

abstract class AuthEvent {}

class SignIn extends AuthEvent {
  final SignInParams signInParams;

  SignIn({
    required this.signInParams,
  });
}

class SignUp extends AuthEvent {}
