import 'package:data/model/school.dart' as data;
import 'package:domain/domain.dart' as domain;

extension SchoolDataToDomainMapper on data.School {
  domain.School toDomain() {
    return domain.School(
      title: title,
      description: description,
      schedule: schedule,
      price: price,
      contact: contact,
      registration: registration,
      teacherId: teacherId,
      studentIds: studentIds,
      enterStatus: enterStatus,
    );
  }
}

extension SchoolDomainToDataMapper on domain.School {
  data.School toData() {
    return data.School(
      title: title,
      description: description,
      schedule: schedule,
      price: price,
      contact: contact,
      registration: registration,
      teacherId: teacherId,
      studentIds: studentIds,
      enterStatus: enterStatus,
    );
  }
}
