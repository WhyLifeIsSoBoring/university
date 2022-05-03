import 'dart:developer';

import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:registration/bloc/registration_event.dart';
import 'package:registration/bloc/registration_state.dart';

export 'registration_event.dart';
export 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState());

  final AppRouter _appRouter = appDependencies.get();
  final SignUpUseCase _signUpUseCase = SignUpUseCase(
    authRepository: appDependencies.get(),
  );

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignUp) {
      yield* _handleSignUp(event);
    } else if (event is Pop) {
      _appRouter.pop();
    } else if (event is SelectRole) {
      yield state.copyWith(selectedRole: event.role);
    }
  }

  Stream<RegistrationState> _handleSignUp(SignUp event) async* {
    try {
      await _signUpUseCase.execute(event.registerParams);
      _appRouter.pop();
    } on EmailInUseException catch (_) {
      yield RegistrationState(error: EmailInUse());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
