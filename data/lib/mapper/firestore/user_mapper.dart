import 'package:data/model/user.dart';

const String _ID = 'id';
const String _FIRST_NAME = 'first_name';
const String _LAST_NAME = 'last_name';
const String _EMAIL = 'email';
const String _ROLE = 'role';

class UserToFirestoreMapper {
  static Map<String, dynamic> toFirestore(User user) {
    return <String, dynamic>{
      _ID: user.id,
      _FIRST_NAME: user.firstName,
      _LAST_NAME: user.lastName,
      _EMAIL: user.email,
      _ROLE: user.role,
    };
  }
}

class UserFromFirestoreMapper {
  static User fromFirestore(doc) {
    return _fromMap(doc.data() as Map<String, dynamic>);
  }

  static User _fromMap(Map<String, dynamic> map) {
    return User(
      id: map[_ID] as String,
      firstName: map[_FIRST_NAME] as String,
      lastName: map[_LAST_NAME] as String,
      email: map[_EMAIL] as String,
      role: map[_ROLE] as String,
    );
  }
}
