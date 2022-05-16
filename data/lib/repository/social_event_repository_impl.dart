import 'package:data/mapper/social_event_mapper.dart';
import 'package:data/model/social_event.dart' as data;
import 'package:data/provider/social_event_provider.dart';
import 'package:domain/domain.dart';

class SocialEventRepositoryImpl extends SocialEventRepository {
  final SocialEventProvider _socialEventProvider;

  SocialEventRepositoryImpl({
    required SocialEventProvider socialEventProvider,
  }) : _socialEventProvider = socialEventProvider;

  @override
  Future<List<SocialEvent>> getAll() async {
    try {
      return (await _socialEventProvider.getAll())
          .map((data.SocialEvent socialEvent) => socialEvent.toDomain())
          .toList();
    } catch (e) {
      throw Exception('Something went wrong while loading data');
    }
  }

  @override
  Future<void> save({required SocialEvent socialEvent}) async {
    try {
      await _socialEventProvider.save(socialEvent: socialEvent.toData());
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }
}
