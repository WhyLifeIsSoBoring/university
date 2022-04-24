import 'package:course/bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Курс по подготовке к ЦТ по математике',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Описание',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Описание курса: кто проводит, результаты курса и т.д.',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Расписание',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Информация про расписание',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Цена',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Информация о цене',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Контактная информация',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Телефоны, почты и т.д.',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Регистрация',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          'Информация по регистрации',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CourseBloc>(context)
                      .add(OpenCourseRegistration());
                },
                child: Center(
                  child: Text('Регистрация на курс'),
                ),
              ),
            )
          ],
        ),
      ),
      Divider(
        height: 1.0,
        thickness: 2,
      ),
    ]);
  }
}
