import 'package:data/model/social_event.dart' as data;
import 'package:domain/domain.dart' as domain;

extension SocialEventDataToDomainMapper on data.SocialEvent {
  domain.SocialEvent toDomain() {
    return domain.SocialEvent(
      title: title,
      description: description,
      date: date,
      imageUrl: imageUrl,
    );
  }
}

extension SocialEventDomainToDataMapper on domain.SocialEvent {
  data.SocialEvent toData() {
    return data.SocialEvent(
      title: title,
      description: description,
      date: date,
      imageUrl: imageUrl,
    );
  }
}
