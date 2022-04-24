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

  }

  void _initRepositories() {

  }

  void _initUseCases() {
  }
}
