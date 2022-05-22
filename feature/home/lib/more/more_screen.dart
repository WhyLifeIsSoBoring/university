import 'package:flutter/material.dart';
import 'package:home/more/bloc/more_bloc.dart';
import 'package:presentation/presentation.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoreBloc>(
      create: (_) => MoreBloc(),
      child: BlocBuilder<MoreBloc, MoreState>(
        builder: (BuildContext context, MoreState state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Ещё',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 8.0,
                right: 8.0,
              ),
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      context.read<MoreBloc>().add(OpenLibrary());
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.menu_book_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Библиотека',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      context.read<MoreBloc>().add(OpenTests());
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.check_box_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Тестирование',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      context.read<MoreBloc>().add(OpenUserCabinet());
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.account_circle_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Личный кабинет',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      context.read<MoreBloc>().add(SignOut());
                    },
                    child: Container(
                      height: 40,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.logout_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Выйти',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
