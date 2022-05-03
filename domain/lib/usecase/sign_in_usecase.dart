import 'package:domain/model/sign_in_params.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SignInUseCase extends FutureUseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(SignInParams params) async {
    await _authRepository.signIn(params);
  }
}
