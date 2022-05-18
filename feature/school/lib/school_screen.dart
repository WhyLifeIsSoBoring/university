import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:school/bloc/school_bloc.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (BuildContext context, SchoolState state) {
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
                  'Школы юных',
                ),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.read<SchoolBloc>().add(Pop());
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
                                  state.school.title,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
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
                                  state.school.description,
                                  style: TextStyle(fontSize: 14.0),
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
                                  state.school.schedule,
                                  style: TextStyle(fontSize: 14.0),
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
                                  state.school.price,
                                  style: TextStyle(fontSize: 14.0),
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
                                  state.school.contact,
                                  style: TextStyle(fontSize: 14.0),
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
                                  state.school.registration,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.school.enterStatus &&
                            !state.isUserSubscribed) ...<Widget>{
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
                                        //TODO
                                      },
                                      child: Center(
                                        child: Text('Регистрация в школу'),
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
                    Center(
                      child: Text(
                        'Скоро здесь появится информация',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  } else ...<Widget>{
                    Center(
                      child: Text(
                        'Вы не являетесь учеником данной школы',
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
}
