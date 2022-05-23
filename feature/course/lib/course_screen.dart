import 'package:course/bloc/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (BuildContext context, CourseState state) {
        if (state.errorMessage != null) {
          return Center(
            child: Text(
              state.errorMessage!,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Подготовительные курсы',
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.read<CourseBloc>().add(Pop());
                  },
                ),
                bottom: TabBar(
                  tabs: const <Widget>[
                    Tab(text: 'Общая информация'),
                    Tab(text: 'Информация для учащихся'),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  state.course.title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Описание',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  state.course.description,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Расписание',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  state.course.schedule,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Цена',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  state.course.price,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Контактная информация',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  state.course.contact,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  'Регистрация',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  state.course.registration,
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.course.enterStatus &&
                            !state.isUserSubscribed &&
                            state.isRegisterButtonEnabled) ...<Widget>{
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CourseBloc>()
                                            .add(Registration());
                                        _showSnackBar(context);
                                      },
                                      child: Center(
                                        child: Text('Регистрация на курс'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        } else ...<Widget>{
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Регистрация недоступна',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                  ),
                  if (state.isUserSubscribed) ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              state.course.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Divider(
                            height: 1.0,
                            thickness: 2,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            state.course.infoForStudents,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CourseBloc>()
                                            .add(OpenVideoConference());
                                      },
                                      child: Center(
                                        child: Text('Войти в видеоконференцию'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  } else ...<Widget>{
                    Center(
                      child: Text(
                        'Вы не зарегистрированы на данный курс',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  }
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Заявка на регистрацию на курс отправлена'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
