import 'dart:convert';

import 'package:core/core.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:domain/model/user.dart';

class PrefsProvider {
  final SharedPreferences _sharedPreferences;

  PrefsProvider({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const String _USER = 'user';

  Future<void> saveUser(User user) async {
    await _sharedPreferences.setString(
      _USER,
      jsonEncode(user.toMap()),
    );
  }

  User? getUser() {
    final String? userString = _sharedPreferences.getString(_USER);
    if (userString != null) {
      return UserDomainFromPrefsMapper.fromMap(
          jsonDecode(userString) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> signOut() async {
    await _sharedPreferences.remove(_USER);
  }
}
