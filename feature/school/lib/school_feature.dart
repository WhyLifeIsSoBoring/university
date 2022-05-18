import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:school/bloc/school_bloc.dart';
import 'package:school/school_screen.dart';

class SchoolFeature {
  static Page<void> page({required School school}) =>
      SchoolPage(school: school);
}

class SchoolPage extends Page<void> {
  final School school;

  const SchoolPage({required this.school});

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<SchoolBloc>(
        create: (_) => SchoolBloc(school: school)..add(InitEvent()),
        child: SchoolScreen(),
      ),
    );
  }
}
