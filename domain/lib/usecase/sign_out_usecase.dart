import 'package:domain/repository/auth_repository.dart';
import 'package:domain/usecase/usecase.dart';

class SignOutUserUseCase extends FutureUseCase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOutUserUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams params)  {
    return _authRepository.signOut();
  }
}
