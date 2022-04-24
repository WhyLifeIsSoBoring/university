import 'package:course/bloc/course_bloc.dart';
import 'package:course/widget/course_description.dart';
import 'package:course/widget/course_info.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CourseDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (BuildContext context, CourseState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Подготовка к ЦТ',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(Icons.navigate_before),
              color: AppColorTheme.black,
              tooltip: 'Назад',
              onPressed: () {
                BlocProvider.of<CourseBloc>(context).add(Pop());
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseDescription(),
                CourseInfoForSubscribers(),
              ],
            ),
          ),
        );
      },
    );
  }
}
