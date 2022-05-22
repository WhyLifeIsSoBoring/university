import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:school/bloc/school_event.dart';
import 'package:school/bloc/school_state.dart';
import 'package:video/page/video_page.dart';

export 'school_event.dart';
export 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final UserRepository _userRepository = appDependencies.get<UserRepository>();
  final SchoolRepository _schoolRepository =
      appDependencies.get<SchoolRepository>();

  SchoolBloc({required School school}) : super(SchoolState(school: school));

  @override
  Stream<SchoolState> mapEventToState(SchoolEvent event) async* {
    try {
      if (event is InitEvent) {
        final User? currentUser = _userRepository.getCurrent();
        yield state.copyWith(user: currentUser);

        if (currentUser != null &&
            (state.school.studentIds.contains(currentUser.id) ||
                state.school.teacherId == currentUser.id)) {
          yield state.copyWith(isUserSubscribed: true);
        }
      } else if (event is Pop) {
        _appRouter.pop();
      } else if (event is Registration) {
        if (state.user != null) {
          await _schoolRepository.register(
            registerInSchoolParams: RegisterInSchoolParams(
                schoolTitle: state.school.title,
                studentEmail: state.user!.email,
                studentFirstName: state.user!.firstName,
                studentLastName: state.user!.lastName,
                studentPhoneNumber: state.user!.phoneNumber),
          );

          yield state.copyWith(isRegisterButtonEnabled: false);
        }
      } else if (event is OpenVideoConference) {
        _appRouter.push(
          VideoFeature.page(
            roomName: state.school.videoRoomName,
            roomToken: state.school.videoRoomToken,
          ),
        );
      }
    } catch (e) {
      yield state.copyWith(
        errorMessage: 'Что-то пошло не так при загрузке данных',
      );
    }
  }
}
