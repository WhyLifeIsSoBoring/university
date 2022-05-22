import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:social_event/bloc/social_event_event.dart';
import 'package:social_event/bloc/social_event_state.dart';

export 'social_event_event.dart';
export 'social_event_state.dart';

class SocialEventBloc extends Bloc<SocialEventEvent, SocialEventState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final UserRepository _userRepository = appDependencies.get<UserRepository>();
  final SocialEventRepository _socialEventRepository =
      appDependencies.get<SocialEventRepository>();

  SocialEventBloc({required SocialEvent socialEvent})
      : super(SocialEventState(
          event: socialEvent,
          isRegisterButtonEnabled: socialEvent.enterStatus,
        ));

  @override
  Stream<SocialEventState> mapEventToState(SocialEventEvent event) async* {
    if (event is Pop) {
      _appRouter.pop();
    } else if (event is Registration) {
      final User? currentUser = _userRepository.getCurrent();

      if (currentUser != null) {
        await _socialEventRepository.register(
          registerForSocialEventParams: RegisterForSocialEventParams(
              eventTitle: state.event.title,
              studentEmail: currentUser.email,
              studentFirstName: currentUser.firstName,
              studentLastName: currentUser.lastName,
              studentPhoneNumber: currentUser.phoneNumber),
        );

        yield state.copyWith(isRegisterButtonEnabled: false);
      }
    }
  }
}
