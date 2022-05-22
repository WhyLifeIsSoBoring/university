import 'package:domain/domain.dart';

extension RoleToViewMapper on Role {
  static const String _ADMIN = 'Админ';
  static const String _STUDENT = 'Ученик';
  static const String _TEACHER = 'Учитель';
  static const String _PARENT = 'Родитель';

  String toView() {
    switch (this) {
      case Role.ADMIN:
        return _ADMIN;
      case Role.STUDENT:
        return _STUDENT;
      case Role.TEACHER:
        return _TEACHER;
      case Role.PARENT:
        return _PARENT;
    }
  }
}
