import 'package:data/mapper/role_mapper.dart';
import 'package:data/model/user.dart' as data;
import 'package:domain/model/user.dart' as domain;

const String _ID = 'id';
const String _FIRST_NAME = 'first_name';
const String _LAST_NAME = 'last_name';
const String _EMAIL = 'email';
const String _PHONE_NUMBER = 'phone_number';
const String _ROLE = 'role';
const String _ACHIEVEMENTS = 'achievements';
const String _COURSES = 'courses';
const String _SCHOOLS = 'schools';

extension UserDataToDomainMapper on data.User {
  domain.User toDomain() {
    return domain.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      role: role.fromString(),
      achievements: achievements,
      courses: courses,
      schools: schools,
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
      phoneNumber: phoneNumber,
      role: role.toCustomString(),
      achievements: achievements,
      courses: courses,
      schools: schools,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      _ID: id,
      _FIRST_NAME: firstName,
      _LAST_NAME: lastName,
      _EMAIL: email,
      _PHONE_NUMBER: phoneNumber,
      _ROLE: role.toCustomString(),
      _ACHIEVEMENTS: achievements,
      _COURSES: courses,
      _SCHOOLS: schools,
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
      phoneNumber: map[_PHONE_NUMBER] as String,
      role: (map[_ROLE] as String).fromString(),
      achievements: (map[_ACHIEVEMENTS] as List<dynamic>)
          .map((dynamic imageUrl) => imageUrl as String)
          .toList(),
      courses: (map[_COURSES] as List<dynamic>)
          .map((dynamic imageUrl) => imageUrl as String)
          .toList(),
      schools: (map[_SCHOOLS] as List<dynamic>)
          .map((dynamic imageUrl) => imageUrl as String)
          .toList(),
    );
  }
}
