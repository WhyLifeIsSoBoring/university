import 'package:domain/model/params/register_params.dart';
import 'package:domain/model/params/sign_in_params.dart';

abstract class AuthRepository {
  Future<void> signIn(SignInParams params);

  Future<void> signOut();

  Future<void> signUp(RegisterParams params);
}
