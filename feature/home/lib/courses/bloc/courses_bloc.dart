import 'package:course/course_feature.dart';
import 'package:domain/domain.dart';
import 'package:home/courses/bloc/courses_event.dart';
import 'package:home/courses/bloc/courses_state.dart';
import 'package:presentation/presentation.dart';

export 'courses_event.dart';
export 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CourseRepository _courseRepository =
      appDependencies.get<CourseRepository>();
  final AppRouter _appRouter = appDependencies.get<AppRouter>();

  CoursesBloc() : super(CoursesState());

  @override
  Stream<CoursesState> mapEventToState(CoursesEvent event) async* {
    try {
      if (event is InitEvent) {
        final List<Course> courses = await _courseRepository.getAll();
        yield state.copyWith(
          allCourses: courses,
          filteredCourses: courses,
        );
      } else if (event is UpdateSearchText) {
        yield state.copyWith(searchText: event.newSearchText);

        final List<Course> _filteredCourses = state.allCourses
            .where((Course course) => course.title
                .toLowerCase()
                .contains(state.searchText.toLowerCase()))
            .toList();
        yield state.copyWith(filteredCourses: _filteredCourses);
      } else if (event is OpenCurrentCourse) {
        _appRouter.push(CourseFeature.page(course: event.course));
      }
    } catch (e) {
      yield state.copyWith(
        errorMessage: 'Что-то пошло не так при загрузке данных',
      );
    }
  }
}
