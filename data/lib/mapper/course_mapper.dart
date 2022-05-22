import 'package:data/model/course.dart' as data;
import 'package:domain/domain.dart' as domain;

extension CourseDataToDomainMapper on data.Course {
  domain.Course toDomain() {
    return domain.Course(
      title: title,
      description: description,
      schedule: schedule,
      price: price,
      contact: contact,
      registration: registration,
      teacherId: teacherId,
      studentIds: studentIds,
      enterStatus: enterStatus,
      infoForStudents: infoForStudents,
      videoRoomToken: videoRoomToken,
      videoRoomName: videoRoomName,
    );
  }
}

extension CourseDomainToDataMapper on domain.Course {
  data.Course toData() {
    return data.Course(
      title: title,
      description: description,
      schedule: schedule,
      price: price,
      contact: contact,
      registration: registration,
      teacherId: teacherId,
      studentIds: studentIds,
      enterStatus: enterStatus,
      infoForStudents: infoForStudents,
      videoRoomToken: videoRoomToken,
      videoRoomName: videoRoomName,
    );
  }
}
