import 'package:domain/domain.dart';

abstract class SchoolEvent {}

class InitEvent extends SchoolEvent {}

class UpdateSearchText extends SchoolEvent {
  final String? newSearchText;

  UpdateSearchText({required this.newSearchText});
}

class OpenCurrentSchool extends SchoolEvent {
  final School school;

  OpenCurrentSchool({required this.school});
}
