import 'package:data/mapper/role_mapper.dart';
import 'package:data/mapper/user_mapper.dart';
import 'package:data/model/auth_user.dart';
import 'package:data/model/user.dart' as data;
import 'package:data/provider/auth_provider.dart';
import 'package:data/provider/firebase/firebase_user_provider.dart';
import 'package:data/provider/prefs_provider.dart';
import 'package:domain/domain.dart' as domain;

class AuthRepositoryImpl extends domain.AuthRepository {
  final AuthProvider _authProvider;
  final FirebaseUserProvider _firebaseUserProvider;
  final PrefsProvider _prefsProvider;

  AuthRepositoryImpl({
    required AuthProvider authProvider,
    required FirebaseUserProvider firebaseUserProvider,
    required PrefsProvider prefsProvider,
  })  : _authProvider = authProvider,
        _firebaseUserProvider = firebaseUserProvider,
        _prefsProvider = prefsProvider;

  @override
  Future<void> signIn(domain.SignInParams params) async {
    final AuthUser firebaseUser = await _authProvider.signIn(
      EmailAndPassword(
        email: params.email,
        password: params.password,
      ),
    );

    final data.User user =
        await _firebaseUserProvider.getById(id: firebaseUser.id);

    await _prefsProvider.saveUser(user.toDomain());
  }

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _prefsProvider.signOut();
  }

  @override
  Future<void> signUp(domain.RegisterParams params) async {
    final AuthUser newUser = await _authProvider.signUp(
      EmailAndPassword(
        email: params.email,
        password: params.password,
      ),
    );

    await _firebaseUserProvider.save(
      user: data.User(
        id: newUser.id,
        firstName: params.firstName,
        lastName: params.lastName,
        email: newUser.email,
        role: params.role.toCustomString(),
      ),
    );
  }
}
