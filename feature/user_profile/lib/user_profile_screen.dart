import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:user_profile/bloc/user_profile_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (BuildContext context, UserProfileState state) {
        final User? _user = state.user;
        if (_user == null) {
          return Loader();
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Личный кабинет',
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  context.read<UserProfileBloc>().add(Pop());
                },
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.info_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Личная информация',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Фамилия: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _user.lastName,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Имя: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _user.firstName,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Почта: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _user.email,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Телефон: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _user.phoneNumber,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Роль: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _user.role.toView(),
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.star_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Текущие курсы',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_user.courses.isNotEmpty) ...<Widget>{
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _user.courses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            _user.courses[index],
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.justify,
                          ),
                        );
                      },
                    ),
                  } else ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Вы не зарегистрированы ни на один курс',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  },
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.school_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Текущие школы',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_user.schools.isNotEmpty) ...<Widget>{
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _user.schools.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            _user.schools[index],
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.justify,
                          ),
                        );
                      },
                    ),
                  } else ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Вы не зарегистрированы ни в одной школе',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  },
                  Divider(
                    height: 1.0,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 30,
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.check_circle_rounded,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Достижения',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_user.achievements.isNotEmpty) ...<Widget>{
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _user.achievements.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            _user.achievements[index],
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.justify,
                          ),
                        );
                      },
                    ),
                  } else ...<Widget>{
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'На данный момент у вас нет достижений',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  },
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
