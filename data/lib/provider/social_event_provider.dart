import 'package:data/model/params/register_for_social_event_params.dart';
import 'package:data/model/social_event.dart';

abstract class SocialEventProvider {
  Future<List<SocialEvent>> getAll();

  Future<void> save({required SocialEvent socialEvent});

  Future<void> register({
    required RegisterForSocialEventParams registerForSocialEventParams,
  });
}
