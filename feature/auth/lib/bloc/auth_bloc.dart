import 'dart:developer';

import 'package:auth/bloc/auth_event.dart';
import 'package:auth/bloc/auth_state.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/user/sign_in_usecase.dart';
import 'package:presentation/presentation.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  final AppRouter _appRouter = appDependencies.get();
  final SignInUseCase _signInUseCase = SignInUseCase(
    authRepository: appDependencies.get(),
  );
  final SignUpUseCase _signUpUseCase = SignUpUseCase(
    authRepository: appDependencies.get(),
  );
  final GetRoleUseCase _getRoleUseCase = GetRoleUseCase(
    roleRepository: appDependencies.get(),
    userRepository: appDependencies.get(),
  );

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignIn) {
      yield* _handleSignIn(event);
    } else if (event is SignUp) {
      yield* _handleSignUp(event);
    }
  }

  Stream<AuthState> _handleSignIn(SignIn event) async* {
    try {
      await _signInUseCase.execute(event.signInParams);
      _appRouter.replace(
        mapRoleToFirstPage(await _getRoleUseCase.execute(NoParams())),
      );
    } on WrongCredentialsException catch (_) {
      yield AuthState(error: WrongCredentials());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<AuthState> _handleSignUp(SignUp event) async* {
    try {
      await _signUpUseCase.execute(event.emailAndPassword);
      _appRouter.replace(CreateRoleFeature.selectRolePage());
    } on EmailInUseException catch (_) {
      yield AuthState(error: EmailInUse());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
