import 'package:data/model/course.dart';

const String _TITLE = 'title';
const String _DESCRIPTION = 'description';
const String _SCHEDULE = 'schedule';
const String _PRICE = 'price';
const String _CONTACT = 'contact';
const String _REGISTRATION = 'registration';
const String _TEACHER_ID = 'teacher_id';
const String _STUDENT_IDS = 'student_ids';
const String _ENTER_STATUS = 'enter_status';
const String _ADDITIONAL_INFO = 'additional_info';
const String _ROOM_TOKEN = 'room_token';
const String _ROOM_NAME = 'room_name';

class CourseToFirestoreMapper {
  static Map<String, dynamic> toFirestore(Course course) {
    return <String, dynamic>{
      _TITLE: course.title,
      _DESCRIPTION: course.description,
      _SCHEDULE: course.schedule,
      _PRICE: course.price,
      _CONTACT: course.contact,
      _REGISTRATION: course.registration,
      _TEACHER_ID: course.teacherId,
      _STUDENT_IDS: course.studentIds,
      _ENTER_STATUS: course.enterStatus,
      _ADDITIONAL_INFO: course.infoForStudents,
      _ROOM_TOKEN: course.videoRoomToken,
      _ROOM_NAME: course.videoRoomName,
    };
  }
}

class CourseFromFirestoreMapper {
  static Course fromFirestore(doc) {
    return CourseFromFirestoreMapper.fromMap(
        doc.data() as Map<String, dynamic>);
  }

  static Course fromMap(Map<String, dynamic> map) {
    return Course(
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
      infoForStudents: map[_ADDITIONAL_INFO] as String,
      videoRoomToken: map[_ROOM_TOKEN] as String,
      videoRoomName: map[_ROOM_NAME] as String,
    );
  }
}
