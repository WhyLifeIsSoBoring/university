import 'package:auth/bloc/auth_bloc.dart';
import 'package:auth/bloc/auth_event.dart';
import 'package:auth/bloc/auth_state.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/sign_in_params.dart';

import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

import 'auth_widget.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController emailTextController =
      TextEditingController(text: 'korotkmax@gmail.com');
  final TextEditingController passwordTextController =
      TextEditingController(text: 'parolparol');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Auth'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (BuildContext context, AuthState state) {
                      return AuthWidget(
                        emailError: _mapAuthToEmailError(
                          context,
                          error: state.error,
                        ),
                        passwordError: _mapAuthToPasswordError(
                          context,
                          error: state.error,
                        ),
                        onSignUp: (String email, String password) {
                          context.read<AuthBloc>().add(SignUp());
                        },
                        emailTextController: emailTextController,
                        passwordTextController: passwordTextController,
                        onSignIn: (String email, String password) {
                          context.read<AuthBloc>().add(
                                SignIn(
                                  signInParams: SignInParams(
                                    email: email,
                                    password: password,
                                  ),
                                ),
                              );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _mapAuthToEmailError(
    BuildContext context, {
    required AuthError? error,
  }) {
    if (error is WrongCredentials) {
      return 'Wrong credentials';
    } else if (error is EmailInUse) {
      return 'Email in use';
    } else {
      return null;
    }
  }

  String? _mapAuthToPasswordError(
    BuildContext context, {
    required AuthError? error,
  }) {
    if (error is WrongCredentials) {
      return 'Wrong credentials';
    } else {
      return null;
    }
  }
}
