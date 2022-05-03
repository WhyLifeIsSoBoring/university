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
  TextEditingController(text: 'maksim.stankevich.2001@gmail.com');
  final TextEditingController passwordTextController =
  TextEditingController(text: 'qwert12345');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppText.AUTH),
          centerTitle: true,
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
      return 'Неправильная почта';
    } else if (error is EmailInUse) {
      return 'Почта занята';
    } else {
      return null;
    }
  }

  String? _mapAuthToPasswordError(
    BuildContext context, {
    required AuthError? error,
  }) {
    if (error is WrongCredentials) {
      return 'Неправильный пароль';
    } else {
      return null;
    }
  }
}
