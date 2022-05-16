import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:social_event/bloc/social_event_event.dart';
import 'package:social_event/bloc/social_event_state.dart';

export 'social_event_event.dart';
export 'social_event_state.dart';

class SocialEventBloc extends Bloc<SocialEventEvent, SocialEventState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();

  SocialEventBloc({required SocialEvent socialEvent})
      : super(SocialEventState(event: socialEvent));

  @override
  Stream<SocialEventState> mapEventToState(SocialEventEvent event) async* {
    if (event is Pop) {
      _appRouter.pop();
    }
  }
}
