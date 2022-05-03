import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:registration/bloc/registration_bloc.dart';
import 'package:registration/registration_widget.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailTextController =
      TextEditingController();
  final TextEditingController passwordTextController =
      TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (BuildContext context, RegistrationState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(AppText.REGISTRATION),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  BlocProvider.of<RegistrationBloc>(context).add(Pop());
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegistrationWidget(
                    emailError: _mapAuthToEmailError(
                      context,
                      error: state.error,
                    ),
                    passwordError: _mapAuthToPasswordError(
                      context,
                      error: state.error,
                    ),
                    onSignUp: (String email, String password, String firstName,
                        String lastName, Role role) {
                      context.read<RegistrationBloc>().add(SignUp(
                              registerParams: RegisterParams(
                            email: email,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            role: role,
                          )));
                    },
                    emailTextController: emailTextController,
                    passwordTextController: passwordTextController,
                    firstNameTextController: firstNameTextController,
                    lastNameTextController: lastNameTextController,
                    role: state.selectedRole,
                    onRoleChanged: (Role? selectedRole) {
                      context
                          .read<RegistrationBloc>()
                          .add(SelectRole(role: selectedRole));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? _mapAuthToEmailError(
    BuildContext context, {
    required RegistrationError? error,
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
    required RegistrationError? error,
  }) {
    if (error is WrongCredentials) {
      return 'Неправильный пароль';
    } else {
      return null;
    }
  }
}
