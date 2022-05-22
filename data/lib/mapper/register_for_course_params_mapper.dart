import 'package:data/model/params/register_for_course_params.dart' as data;
import 'package:domain/domain.dart' as domain;

extension RegisterInSchoolParamsDomainToDataMapper
    on domain.RegisterForCourseParams {
  data.RegisterForCourseParams toData() {
    return data.RegisterForCourseParams(
      courseTitle: courseTitle,
      studentEmail: studentEmail,
      studentFirstName: studentFirstName,
      studentLastName: studentLastName,
      studentPhoneNumber: studentPhoneNumber,
    );
  }
}
