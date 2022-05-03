import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:registration/bloc/registration_bloc.dart';
import 'package:registration/registration_screen.dart';

class RegistrationFeature {
  static Page<void> page() {
    return RegistrationPage();
  }
}

class RegistrationPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return BlocProvider<RegistrationBloc>(
          child: RegistrationScreen(),
          create: (_) => RegistrationBloc(),
        );
      },
      settings: this,
    );
  }
}
