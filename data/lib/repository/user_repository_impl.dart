import 'package:data/provider/prefs_provider.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final PrefsProvider _prefsProvider;

  UserRepositoryImpl({
    required PrefsProvider prefsProvider,
  }) : _prefsProvider = prefsProvider;

  @override
  User? getCurrent() {
    return _prefsProvider.getUser();
  }

  @override
  Future<void> saveCurrent(User user) async {
    await _prefsProvider.saveUser(user);
  }
}
