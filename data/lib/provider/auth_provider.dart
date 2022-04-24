import 'package:data/model/user.dart';

abstract class AuthProvider {
  Future<User> signIn(SignInParams params);

  Future<void> signOut();

  Future<void> signUp(SignUpParams params);
}

abstract class SignInParams {}
abstract class SignUpParams {}

class EmailAndPassword implements SignInParams, SignUpParams {
  final String email;
  final String password;

  EmailAndPassword({
    required this.email,
    required this.password,
  });
}