import 'package:course/bloc/course_bloc.dart';
import 'package:course/page/current_course/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CourseDescription {
  static Page<dynamic> page() => CourseDescriptionPage();
}

class CourseDescriptionPage extends Page<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<CourseBloc>(
        create: (_) => CourseBloc(
          appRouter: appDependencies.get<AppRouter>(),
        ),
        child: CourseDescriptionScreen(),
      ),
    );
  }
}
