import 'package:data/model/auth_user.dart';

abstract class AuthProvider {
  Future<AuthUser> signIn(SignInParams params);

  Future<void> signOut();

  Future<AuthUser> signUp(SignUpParams params);
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