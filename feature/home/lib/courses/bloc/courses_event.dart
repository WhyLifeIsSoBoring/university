import 'package:domain/domain.dart';

abstract class CoursesEvent {}

class InitEvent extends CoursesEvent {}

class UpdateSearchText extends CoursesEvent {
  final String? newSearchText;

  UpdateSearchText({required this.newSearchText});
}

class OpenCurrentCourse extends CoursesEvent {
  final Course course;

  OpenCurrentCourse({required this.course});
}
