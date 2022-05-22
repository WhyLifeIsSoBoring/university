import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/mapper/firestore/register_for_social_event_params_mapper.dart';
import 'package:data/mapper/firestore/social_event_mapper.dart';
import 'package:data/model/params/register_for_social_event_params.dart';
import 'package:data/model/social_event.dart';
import 'package:data/provider/social_event_provider.dart';

class FirebaseSocialEventProvider extends SocialEventProvider {
  static const String _SOCIAL_EVENTS = 'social_events';
  static const String _EVENT_REGISTRATION = 'event_registration';
  static const String _ID = 'id';

  @override
  Future<List<SocialEvent>> getAll() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection(_SOCIAL_EVENTS)
              .orderBy(_ID)
              .get();

      return snapshot.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              SocialEventFromFirestoreMapper.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Something went wrong while loading data');
    }
  }

  @override
  Future<void> save({required SocialEvent socialEvent}) async {
    try {
      await FirebaseFirestore.instance
          .collection(_SOCIAL_EVENTS)
          .add(SocialEventToFirestoreMapper.toFirestore(socialEvent));
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }

  @override
  Future<void> register({
    required RegisterForSocialEventParams registerForSocialEventParams,
  }) async {
    try {
      await FirebaseFirestore.instance.collection(_EVENT_REGISTRATION).add(
          RegisterForSocialEventParamsToFirestoreMapper.toFirestore(
              registerForSocialEventParams));
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }
}
