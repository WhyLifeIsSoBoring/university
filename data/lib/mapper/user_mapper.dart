import 'package:data/mapper/role_mapper.dart';
import 'package:data/model/user.dart' as data;
import 'package:domain/model/user.dart' as domain;

extension UserDataToDomainMapper on data.User {
  domain.User toDomain() {
    return domain.User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role.roleFromString(),
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
      role: role.toFirestore(),
    );
  }
}
