import 'package:domain/model/register_params.dart';
import 'package:domain/model/sign_in_params.dart';

abstract class AuthRepository {
  Future<void> signIn(SignInParams params);

  Future<void> signOut();

  Future<void> signUp(RegisterParams params);
}
