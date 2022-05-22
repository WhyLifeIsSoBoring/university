import 'package:data/model/params/register_in_school_params.dart';
import 'package:data/model/school.dart';

abstract class SchoolProvider {
  Future<List<School>> getAll();

  Future<void> save({required School school});

  Future<void> register({
    required RegisterInSchoolParams registerInSchoolParams,
  });
}
