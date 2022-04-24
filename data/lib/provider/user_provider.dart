import 'package:data/model/user.dart';

abstract class UserProvider {
  User? getCurrent();
}
