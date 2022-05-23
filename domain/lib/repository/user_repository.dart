import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<void> saveCurrent(User user);

  Future<User?> getCurrent();
}
