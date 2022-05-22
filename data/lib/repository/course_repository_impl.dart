import 'package:data/mapper/course_mapper.dart';
import 'package:data/mapper/register_for_course_params_mapper.dart';
import 'package:data/model/course.dart' as data;
import 'package:data/provider/course_provider.dart';
import 'package:domain/domain.dart';

class CourseRepositoryImpl extends CourseRepository {
  final CourseProvider _courseProvider;

  CourseRepositoryImpl({
    required CourseProvider courseProvider,
  }) : _courseProvider = courseProvider;

  @override
  Future<List<Course>> getAll() async {
    try {
      return (await _courseProvider.getAll())
          .map((data.Course course) => course.toDomain())
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> save({required Course course}) async {
    try {
      await _courseProvider.save(course: course.toData());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> register({
    required RegisterForCourseParams registerForCourseParams,
  }) async {
    try {
      await _courseProvider.register(
        registerForCourseParams: registerForCourseParams.toData(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
