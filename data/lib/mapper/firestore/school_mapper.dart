import 'package:data/model/school.dart';

const String _TITLE = 'title';
const String _DESCRIPTION = 'description';
const String _SCHEDULE = 'schedule';
const String _PRICE = 'price';
const String _CONTACT = 'contact';
const String _REGISTRATION = 'registration';
const String _TEACHER_ID = 'teacher_id';
const String _STUDENT_IDS = 'student_ids';
const String _ENTER_STATUS = 'enter_status';

class SchoolToFirestoreMapper {
  static Map<String, dynamic> toFirestore(School school) {
    return <String, dynamic>{
      _TITLE: school.title,
      _DESCRIPTION: school.description,
      _SCHEDULE: school.schedule,
      _PRICE: school.price,
      _CONTACT: school.contact,
      _REGISTRATION: school.registration,
      _TEACHER_ID: school.teacherId,
      _STUDENT_IDS: school.studentIds,
      _ENTER_STATUS: school.enterStatus,
    };
  }
}

class SchoolFromFirestoreMapper {
  static School fromFirestore(doc) {
    return SchoolFromFirestoreMapper.fromMap(
        doc.data() as Map<String, dynamic>);
  }

  static School fromMap(Map<String, dynamic> map) {
    return School(
      title: map[_TITLE] as String,
      description: map[_DESCRIPTION] as String,
      schedule: map[_SCHEDULE] as String,
      price: map[_PRICE] as String,
      contact: map[_CONTACT] as String,
      registration: map[_REGISTRATION] as String,
      teacherId: map[_TEACHER_ID] as String,
      studentIds: (map[_STUDENT_IDS] as List<dynamic>)
          .map((dynamic studentId) => studentId as String)
          .toList(),
      enterStatus: map[_ENTER_STATUS] as bool,
    );
  }
}
