import 'package:core/core.dart';
import 'package:data/provider/auth_provider.dart';
import 'package:data/provider/course_provider.dart';
import 'package:data/provider/file_provider.dart';
import 'package:data/provider/firebase/firebase_auth_provider.dart';
import 'package:data/provider/firebase/firebase_course_provider.dart';
import 'package:data/provider/firebase/firebase_file_provider.dart';
import 'package:data/provider/firebase/firebase_school_provider.dart';
import 'package:data/provider/firebase/firebase_social_event_provider.dart';
import 'package:data/provider/firebase/firebase_user_provider.dart';
import 'package:data/provider/prefs_provider.dart';
import 'package:data/provider/school_provider.dart';
import 'package:data/provider/social_event_provider.dart';
import 'package:data/repository/auth_repository_impl.dart';
import 'package:data/repository/course_repository_impl.dart';
import 'package:data/repository/school_repository_impl.dart';
import 'package:data/repository/social_event_repository_impl.dart';
import 'package:data/repository/user_repository_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';

class DataDi {
  final GetIt _serviceLocator;

  DataDi({
    required GetIt serviceLocator,
  }) : _serviceLocator = serviceLocator;

  Future<void> init() async {
    await _initProviders();
    _initRepositories();
    _initUseCases();
  }

  Future<void> _initProviders() async {
    await Firebase.initializeApp();

    await _initPrefs();

    _serviceLocator
        .registerLazySingleton<AuthProvider>(() => FirebaseAuthProvider());

    _serviceLocator.registerLazySingleton<FirebaseUserProvider>(
        () => FirebaseUserProvider());

    _serviceLocator.registerLazySingleton<FileProvider>(
      () => FirebaseFileProvider(),
    );

    _serviceLocator.registerLazySingleton<SocialEventProvider>(
      () => FirebaseSocialEventProvider(),
    );

    _serviceLocator.registerLazySingleton<SchoolProvider>(
      () => FirebaseSchoolProvider(),
    );

    _serviceLocator.registerLazySingleton<CourseProvider>(
      () => FirebaseCourseProvider(),
    );
  }

  void _initRepositories() {
    _serviceLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authProvider: _serviceLocator.get<AuthProvider>(),
        firebaseUserProvider: _serviceLocator.get<FirebaseUserProvider>(),
        prefsProvider: _serviceLocator.get<PrefsProvider>(),
      ),
    );

    _serviceLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        prefsProvider: _serviceLocator.get<PrefsProvider>(),
      ),
    );

    _serviceLocator.registerLazySingleton<SocialEventRepository>(
      () => SocialEventRepositoryImpl(
        socialEventProvider: _serviceLocator.get<SocialEventProvider>(),
      ),
    );

    _serviceLocator.registerLazySingleton<SchoolRepository>(
      () => SchoolRepositoryImpl(
        schoolProvider: _serviceLocator.get<SchoolProvider>(),
      ),
    );

    _serviceLocator.registerLazySingleton<CourseRepository>(
      () => CourseRepositoryImpl(
        courseProvider: _serviceLocator.get<CourseProvider>(),
      ),
    );
  }

  void _initUseCases() {
    _serviceLocator.registerFactory<SignInUseCase>(
      () => SignInUseCase(
        authRepository: _serviceLocator.get<AuthRepository>(),
      ),
    );

    _serviceLocator.registerFactory<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: _serviceLocator.get<AuthRepository>(),
      ),
    );
  }

  Future<void> _initPrefs() async {
    final SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    _serviceLocator.registerLazySingleton<PrefsProvider>(
      () => PrefsProvider(
        sharedPreferences: _sharedPreferences,
      ),
    );
  }
}
