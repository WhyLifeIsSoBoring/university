import 'package:data/mapper/role_mapper.dart';
import 'package:data/model/auth_user.dart';
import 'package:data/model/user.dart';
import 'package:data/provider/auth_provider.dart';
import 'package:data/provider/firebase/firebase_user_provider.dart';
import 'package:domain/domain.dart' as domain;

class AuthRepositoryImpl extends domain.AuthRepository {
  final AuthProvider _authProvider;
  final FirebaseUserProvider _firebaseUserProvider;

  AuthRepositoryImpl({
    required AuthProvider authProvider,
    required FirebaseUserProvider firebaseUserProvider,
  })  : _authProvider = authProvider,
        _firebaseUserProvider = firebaseUserProvider;

  @override
  Future<void> signIn(domain.SignInParams params) async {
    final AuthUser user = await _authProvider.signIn(
      EmailAndPassword(
        email: params.email,
        password: params.password,
      ),
    );
  }

  @override
  Future<void> signOut() {
    return _authProvider.signOut();
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
      user: User(
        id: newUser.id,
        firstName: params.firstName,
        lastName: params.lastName,
        email: newUser.email,
        role: params.role.toFirestore(),
      ),
    );
  }
}
