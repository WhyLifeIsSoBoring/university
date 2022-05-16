import 'package:data/model/social_event.dart';

abstract class SocialEventProvider {
  Future<List<SocialEvent>> getAll();

  Future<void> save({required SocialEvent socialEvent});
}
