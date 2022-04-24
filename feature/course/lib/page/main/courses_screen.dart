import 'package:course/bloc/course_bloc.dart';
import 'package:course/bloc/course_event.dart';
import 'package:course/bloc/course_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseScreen extends StatelessWidget {
  final List<String> description = [
    'Курсы по подготовке к ЦТ по математике. Проводит механико-математический факультет.',
    'Курсы по подготовке к ЦТ по биологии. Проводит биологический факультет.',
    'Курсы по подготовке к ЦТ по русскому языку. Проводит такой-то факультет.',
    'Курсы по подготовке к ЦТ по английскому языку. Проводит факультет междунородных отношений.',
    'Курсы по подготовке к ЦТ по физике. Проводит физический факультет.',
    'Курсы по подготовке к ЦТ по физике. Проводит факультет радиофизики и компьютерных технологий.',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
    'Курсы по подготовке к ЦТ по физике',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
        builder: (BuildContext context, CourseState state) {
      return Scaffold(
          //backgroundColor: Colors.blue,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Подготовка к ЦТ',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView.builder(
              itemCount: description.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              '${description[index]}',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          SizedBox(
                            width: 110,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {BlocProvider.of<CourseBloc>(context).add(OpenCourseInfo());},
                              child: Center(
                                child: Text('Описание'),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }));
    });
  }
}
