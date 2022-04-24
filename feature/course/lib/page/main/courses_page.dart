import 'package:course/bloc/course_bloc.dart';
import 'package:course/page/main/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class Course {
  static Page<dynamic> page() => CoursePage();
}

class CoursePage extends Page<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<CourseBloc>(
        create: (_) => CourseBloc(
          appRouter: appDependencies.get<AppRouter>(),
        ),
        child: CourseScreen(),
      ),
    );
  }
}
