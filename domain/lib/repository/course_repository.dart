import 'package:domain/domain.dart';

abstract class CourseRepository {
  Future<List<Course>> getAll();

  Future<void> save({required Course course});

  Future<void> register({
    required RegisterForCourseParams registerForCourseParams,
  });
}
