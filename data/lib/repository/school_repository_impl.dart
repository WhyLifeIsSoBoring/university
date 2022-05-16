import 'package:data/mapper/school_mapper.dart';
import 'package:data/model/school.dart' as data;
import 'package:data/provider/school_provider.dart';
import 'package:domain/domain.dart';

class SchoolRepositoryImpl extends SchoolRepository {
  final SchoolProvider _schoolProvider;

  SchoolRepositoryImpl({
    required SchoolProvider schoolProvider,
  }) : _schoolProvider = schoolProvider;

  @override
  Future<List<School>> getAll() async {
    try {
      return (await _schoolProvider.getAll())
          .map((data.School school) => school.toDomain())
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> save({required School school}) async {
    try {
      await _schoolProvider.save(school: school.toData());
    } catch (e) {
      throw Exception(e);
    }
  }
}
