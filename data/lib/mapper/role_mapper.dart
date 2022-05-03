import 'package:domain/model/role.dart';

const String _ADMIN = 'ADMIN';
const String _STUDENT = 'STUDENT';
const String _TEACHER = 'TEACHER';
const String _PARENT = 'PARENT';

extension RoleToFirestoreMapper on Role {
  String toFirestore() {
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

extension RoleFromStringMapper on String {
  Role roleFromString() {
    switch (this) {
      case _ADMIN:
        return Role.ADMIN;
      case _STUDENT:
        return Role.STUDENT;
      case _TEACHER:
        return Role.TEACHER;
      case _PARENT:
        return Role.PARENT;
      default:
        return Role.STUDENT;
    }
  }
}
