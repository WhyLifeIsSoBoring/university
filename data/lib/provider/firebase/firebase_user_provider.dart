import 'dart:developer';

import 'package:data/model/user.dart';
import 'package:data/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;


class FirebaseUserProvider extends UserProvider {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  @override
  User? getCurrent()  {
    final fb.User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    print('current fb user : $user');

    return User(
      id: user.uid,
      email: user.email!,
    );
  }
}
