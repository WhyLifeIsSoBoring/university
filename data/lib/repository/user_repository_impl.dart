import 'package:data/mapper/user_mapper.dart';
import 'package:data/model/user.dart' as data;
import 'package:data/provider/prefs_provider.dart';
import 'package:data/provider/user_provider.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final PrefsProvider _prefsProvider;
  final UserProvider _userProvider;

  UserRepositoryImpl({
    required PrefsProvider prefsProvider,
    required UserProvider userProvider,
  })  : _prefsProvider = prefsProvider,
        _userProvider = userProvider;

  @override
  Future<User?> getCurrent() async {
    final User? _userFromDevice = _prefsProvider.getUser();

    if (_userFromDevice != null) {
      final data.User _userFromDb =
          await _userProvider.getById(id: _userFromDevice.id);
      return _userFromDb.toDomain();
    } else {
      return _userFromDevice;
    }
  }

  @override
  Future<void> saveCurrent(User user) async {
    await _prefsProvider.saveUser(user);
  }
}
