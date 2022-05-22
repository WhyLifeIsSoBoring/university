import 'package:data/model/params/register_in_school_params.dart' as data;
import 'package:domain/domain.dart' as domain;

extension RegisterInSchoolParamsDomainToDataMapper
    on domain.RegisterInSchoolParams {
  data.RegisterInSchoolParams toData() {
    return data.RegisterInSchoolParams(
      schoolTitle: schoolTitle,
      studentEmail: studentEmail,
      studentFirstName: studentFirstName,
      studentLastName: studentLastName,
      studentPhoneNumber: studentPhoneNumber,
    );
  }
}
