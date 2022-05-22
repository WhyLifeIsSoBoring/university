import 'package:data/model/course.dart';
import 'package:data/model/params/register_for_course_params.dart';

abstract class CourseProvider {
  Future<List<Course>> getAll();

  Future<void> save({required Course course});

  Future<void> register({
    required RegisterForCourseParams registerForCourseParams,
  });
}
