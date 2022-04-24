library auth;

import 'package:auth/auth_screen.dart';
import 'package:auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class AuthFeature {
  static Page<void> page() {
    return AuthPage();
  }
}

class AuthPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return BlocProvider<AuthBloc>(
          child: AuthScreen(),
          create: (_) => AuthBloc(),
        );
      },
      settings: this,
    );
  }
}
