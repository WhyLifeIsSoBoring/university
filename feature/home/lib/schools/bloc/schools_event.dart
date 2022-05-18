import 'package:domain/domain.dart';

abstract class SchoolsEvent {}

class InitEvent extends SchoolsEvent {}

class UpdateSearchText extends SchoolsEvent {
  final String? newSearchText;

  UpdateSearchText({required this.newSearchText});
}

class OpenCurrentSchool extends SchoolsEvent {
  final School school;

  OpenCurrentSchool({required this.school});
}
