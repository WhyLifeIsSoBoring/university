import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/mapper/firestore/course_mapper.dart';
import 'package:data/mapper/firestore/register_for_course_params_mapper.dart';
import 'package:data/model/course.dart';
import 'package:data/model/params/register_for_course_params.dart';
import 'package:data/provider/course_provider.dart';

class FirebaseCourseProvider extends CourseProvider {
  static const String _COURSES = 'courses';
  static const String _COURSE_REGISTRATION = 'course_registration';

  @override
  Future<List<Course>> getAll() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection(_COURSES).get();

      return snapshot.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              CourseFromFirestoreMapper.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Something went wrong while loading data');
    }
  }

  @override
  Future<void> save({required Course course}) async {
    try {
      await FirebaseFirestore.instance
          .collection(_COURSES)
          .add(CourseToFirestoreMapper.toFirestore(course));
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }

  @override
  Future<void> register({
    required RegisterForCourseParams registerForCourseParams,
  }) async {
    try {
      await FirebaseFirestore.instance.collection(_COURSE_REGISTRATION).add(
            RegisterForCourseParamsToFirestoreMapper.toFirestore(
              registerForCourseParams,
            ),
          );
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }
}
