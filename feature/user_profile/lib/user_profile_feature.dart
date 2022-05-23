import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:user_profile/bloc/user_profile_bloc.dart';
import 'package:user_profile/user_profile_screen.dart';

class UserProfileFeature {
  static Page<void> page() => UserProfilePage();
}

class UserProfilePage extends Page<void> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<UserProfileBloc>(
        create: (_) => UserProfileBloc()..add(InitEvent()),
        child: UserProfileScreen(),
      ),
    );
  }
}
