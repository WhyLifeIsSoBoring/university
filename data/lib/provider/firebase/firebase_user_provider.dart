import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/mapper/firestore/user_mapper.dart';
import 'package:data/model/auth_user.dart';
import 'package:data/model/user.dart';
import 'package:data/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class FirebaseUserProvider extends UserProvider {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static const String _USERS = 'users';

  @override
  AuthUser? getCurrent() {
    final fb.User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    print('current fb user : $user');

    return AuthUser(
      id: user.uid,
      email: user.email!,
    );
  }

  @override
  Future<User> getById({required String id}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firebaseFirestore.collection(_USERS).get();

      return snapshot.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              UserFromFirestoreMapper.fromFirestore(doc))
          .toList()
          .firstWhere((User user) => user.id == id);
    } catch (e) {
      throw Exception('Something went wrong while loading data');
    }
  }

  @override
  Future<void> save({required User user}) async {
    try {
      await _firebaseFirestore
          .collection(_USERS)
          .add(UserToFirestoreMapper.toFirestore(user));
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }
}
