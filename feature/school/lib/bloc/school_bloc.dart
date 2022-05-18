import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:school/bloc/school_event.dart';
import 'package:school/bloc/school_state.dart';

export 'school_event.dart';
export 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final UserRepository _userRepository = appDependencies.get<UserRepository>();

  SchoolBloc({required School school}) : super(SchoolState(school: school));

  @override
  Stream<SchoolState> mapEventToState(SchoolEvent event) async* {
    try {
      if (event is InitEvent) {
        final User? currentUser = _userRepository.getCurrent();
        if (currentUser != null &&
            state.school.studentIds.contains(currentUser.id)) {
          yield state.copyWith(isUserSubscribed: true);
        }
      } else if (event is Pop) {
        _appRouter.pop();
      }
    } catch (e) {
      yield state.copyWith(
        errorMessage: 'Что-то пошло не так при загрузке данных',
      );
    }
  }
}
