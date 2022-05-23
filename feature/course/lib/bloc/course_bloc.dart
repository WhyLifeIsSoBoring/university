import 'package:course/bloc/course_event.dart';
import 'package:course/bloc/course_state.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

export 'course_event.dart';
export 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final UserRepository _userRepository = appDependencies.get<UserRepository>();
  final CourseRepository _courseRepository =
      appDependencies.get<CourseRepository>();

  CourseBloc({required Course course})
      : super(CourseState(
          course: course,
          isRegisterButtonEnabled: course.enterStatus,
        ));

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    if (event is Pop) {
      _appRouter.pop();
    } else if (event is Registration) {
      final User? currentUser = await _userRepository.getCurrent();

      if (currentUser != null) {
        await _courseRepository.register(
          registerForCourseParams: RegisterForCourseParams(
              courseTitle: state.course.title,
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
