import 'package:data/model/school.dart';

abstract class SchoolProvider {
  Future<List<School>> getAll();

  Future<void> save({required School school});
}
