import 'package:data/model/auth_user.dart';
import 'package:data/model/user.dart';

abstract class UserProvider {
  AuthUser? getCurrent();

  Future<User> getById({required String id});

  Future<void> save({required User user});
}
