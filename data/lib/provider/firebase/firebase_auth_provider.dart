import 'dart:developer';

import 'package:core/core.dart';
import 'package:data/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../model/user.dart';

class FirebaseAuthProvider extends AuthProvider {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;

  @override
  Future<User> signIn(SignInParams params) async {
    if (params is EmailAndPassword) {
      final fb.User? user;
      try {
        user = (await _firebaseAuth.signInWithEmailAndPassword(
          email: params.email,
          password: params.password,
        ))
            .user;
      } catch (e) {
        throw WrongCredentialsException();
      }

      if (user == null) {
        log('User is missing');
        throw Exception('User is null');
      }
      print('sign in fb user : $user');

      return User(
        id: user.uid,
        email: user.email!,
      );
    } else {
      throw Exception('');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<User> signUp(SignUpParams params) async {
    if (params is EmailAndPassword) {
      final fb.User? user;
      try {
        user = (await _firebaseAuth.createUserWithEmailAndPassword(
          email: params.email,
          password: params.password,
        ))
            .user;
      } catch (e) {
        throw EmailInUseException();
      }

      if (user == null) {
        log('User is missing');
        throw Exception('User is null');
      }

      print('registered fb user : $user');

      return User(
        id: user.uid,
        email: user.email!,
      );
    } else {
      throw Exception();
    }
  }
}
