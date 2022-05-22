import 'package:course/bloc/course_bloc.dart';
import 'package:course/course_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CourseFeature {
  static Page<void> page({required Course course}) =>
      CoursePage(course: course);
}

class CoursePage extends Page<void> {
  final Course course;

  const CoursePage({required this.course});

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<CourseBloc>(
        create: (_) => CourseBloc(course: course)..add(InitEvent()),
        child: CourseScreen(),
      ),
    );
  }
}
