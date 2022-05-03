import 'package:domain/model/register_params.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SignUpUseCase extends FutureUseCase<void, RegisterParams> {
  final AuthRepository _authRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(RegisterParams params) async {
     await _authRepository.signUp(params);
  }
}
