import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/mapper/firestore/school_mapper.dart';
import 'package:data/model/school.dart';
import 'package:data/provider/school_provider.dart';

class FirebaseSchoolProvider extends SchoolProvider {
  static const String _SCHOOLS = 'schools';

  @override
  Future<List<School>> getAll() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection(_SCHOOLS).get();

      return snapshot.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              SchoolFromFirestoreMapper.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Something went wrong while loading data');
    }
  }

  @override
  Future<void> save({required School school}) async {
    try {
      await FirebaseFirestore.instance
          .collection(_SCHOOLS)
          .add(SchoolToFirestoreMapper.toFirestore(school));
    } catch (e) {
      throw Exception('Something went wrong while saving data');
    }
  }
}
