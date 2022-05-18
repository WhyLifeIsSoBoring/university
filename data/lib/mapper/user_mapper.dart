import 'package:data/mapper/role_mapper.dart';
import 'package:data/model/user.dart' as data;
import 'package:domain/model/user.dart' as domain;

const String _ID = 'id';
const String _FIRST_NAME = 'first_name';
const String _LAST_NAME = 'last_name';
const String _EMAIL = 'email';
const String _ROLE = 'role';

extension UserDataToDomainMapper on data.User {
  domain.User toDomain() {
    return domain.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role.fromString(),
    );
  }
}

extension UserDomainToDataMapper on domain.User {
  data.User toData() {
    return data.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role.toCustomString(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      _ID: id,
      _FIRST_NAME: firstName,
      _LAST_NAME: lastName,
      _EMAIL: email,
      _ROLE: role.toCustomString(),
    };
  }
}

class UserDomainFromPrefsMapper {
  static domain.User fromMap(Map<String, dynamic> map) {
    return domain.User(
      id: map[_ID] as String,
      firstName: map[_FIRST_NAME] as String,
      lastName: map[_LAST_NAME] as String,
      email: map[_EMAIL] as String,
      role: (map[_ROLE] as String).fromString(),
    );
  }
}
