import 'package:data/model/params/register_for_social_event_params.dart'
    as data;
import 'package:domain/domain.dart' as domain;

extension RegisterForSocialEventParamsDomainToDataMapper
    on domain.RegisterForSocialEventParams {
  data.RegisterForSocialEventParams toData() {
    return data.RegisterForSocialEventParams(
      eventTitle: eventTitle,
      studentEmail: studentEmail,
      studentFirstName: studentFirstName,
      studentLastName: studentLastName,
      studentPhoneNumber: studentPhoneNumber,
    );
  }
}
