import 'package:domain/domain.dart';

const String _TITLE = 'title';
const String _DESCRIPTION = 'description';
const String _DATE = 'date';
const String _IMAGE_URL = 'imageUrl';

class SocialEventToFirestoreMapper {
  static Map<String, dynamic> toFirestore(SocialEvent socialEvent) {
    return <String, dynamic>{
      _TITLE: socialEvent.title,
      _DESCRIPTION: socialEvent.description,
      _DATE: socialEvent.date,
      _IMAGE_URL: socialEvent.imageUrl,
    };
  }
}

class SocialEventFromFirestoreMapper {
  static SocialEvent fromFirestore(doc) {
    return SocialEventFromFirestoreMapper.fromMap(
        doc.data() as Map<String, dynamic>);
  }

  static SocialEvent fromMap(Map<String, dynamic> map) {
    return SocialEvent(
      title: map[_TITLE] as String,
      date: map[_DATE] as String,
      description: map[_DESCRIPTION] as String,
      imageUrl: map[_IMAGE_URL] as String,
    );
  }
}
