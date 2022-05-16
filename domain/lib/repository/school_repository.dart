import 'package:domain/domain.dart';

abstract class SchoolRepository {
  Future<List<School>> getAll();

  Future<void> save({required School school});
}
