import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:user_profile/bloc/user_profile_event.dart';
import 'package:user_profile/bloc/user_profile_state.dart';

export 'user_profile_event.dart';
export 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final UserRepository _userRepository = appDependencies.get<UserRepository>();

  UserProfileBloc() : super(UserProfileState());

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is InitEvent) {
      final User? currentUser = await _userRepository.getCurrent();
      yield UserProfileState(user: currentUser);
    } else if (event is Pop) {
      _appRouter.pop();
    }
  }
}
