import 'package:course/bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseInfoForSubscribers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Информация курса для учащихся',
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
            'Материалы, тесты, и т.д.',
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
                        .add(OpenVideoConference());
                  },
                  child: Center(
                    child: Text('Видео конференция'),
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
      ],
    );
  }
}
