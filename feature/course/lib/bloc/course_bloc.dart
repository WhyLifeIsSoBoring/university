import 'package:course/bloc/course_event.dart';
import 'package:course/bloc/course_state.dart';
import 'package:course/page/current_course/course_page.dart';
import 'package:presentation/presentation.dart';
import 'package:video/page/video_page.dart';

export 'course_event.dart';
export 'course_state.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final AppRouter appRouter;

  CourseBloc({required this.appRouter}) : super(CourseInitState());

  @override
  Stream<CourseState> mapEventToState(CourseEvent event,) async* {
    if(event is OpenCourseInfo) {
      appRouter.push(CourseDescription.page());
    }
    if(event is OpenVideoConference) {
      appRouter.push(VideoFeature.page());
    }
    if(event is Pop) {
      appRouter.pop();
    }
  }
}
