import 'package:domain/domain.dart';

abstract class SocialEventRepository {
  Future<List<SocialEvent>> getAll();

  Future<void> save({required SocialEvent socialEvent});
}
