import 'dart:developer';

import 'package:auth/bloc/auth_event.dart';
import 'package:auth/bloc/auth_state.dart';
import 'package:course/course.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:registration/registration.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  final AppRouter _appRouter = appDependencies.get();
  final SignInUseCase _signInUseCase = SignInUseCase(
    authRepository: appDependencies.get(),
  );

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignIn) {
      yield* _handleSignIn(event);
    } else if (event is SignUp) {
      _appRouter.push(RegistrationFeature.page());
    }
  }

  Stream<AuthState> _handleSignIn(SignIn event) async* {
    try {
      await _signInUseCase.execute(event.signInParams);
      _appRouter.push(Course.page());
    } on WrongCredentialsException catch (_) {
      yield AuthState(error: WrongCredentials());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
