import 'package:domain/model/role.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class RegistrationWidget extends StatefulWidget {
  final void Function(String email, String password, String firstName,
      String lastName, String phoneNumber, Role role) onSignUp;
  final void Function(Role? role) onRoleChanged;

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController firstNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController phoneNumberTextController;

  final Role? role;

  final String? emailError;
  final String? passwordError;

  const RegistrationWidget({
    required this.onSignUp,
    required this.onRoleChanged,
    required this.emailTextController,
    required this.passwordTextController,
    required this.firstNameTextController,
    required this.lastNameTextController,
    required this.phoneNumberTextController,
    this.role,
    this.emailError,
    this.passwordError,
  });

  @override
  State<StatefulWidget> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: TextFormField(
              controller: widget.emailTextController,
              decoration: InputDecoration(
                errorText: widget.emailError,
                border: OutlineInputBorder(),
                label: Text(AppText.EMAIL),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.SPACE_10),
          SizedBox(
            height: 80,
            child: TextFormField(
              obscureText: obscureText,
              controller: widget.passwordTextController,
              decoration: InputDecoration(
                errorText: widget.passwordError,
                border: OutlineInputBorder(),
                label: Text(AppText.PASSWORD),
                suffixIcon: GestureDetector(
                  child: Icon(
                    obscureText
                        ? Icons.visibility_rounded
                        : Icons.visibility_outlined,
                  ),
                  onTap: _changePasswordVisibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.SPACE_10),
          SizedBox(
            height: 80,
            child: TextFormField(
              controller: widget.firstNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(AppText.FIRST_NAME),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.SPACE_10),
          SizedBox(
            height: 80,
            child: TextFormField(
              controller: widget.lastNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(AppText.LAST_NAME),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.SPACE_10),
          SizedBox(
            height: 80,
            child: TextFormField(
              controller: widget.phoneNumberTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(AppText.PHONE_NUMBER),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.SPACE_10),
          SizedBox(
            height: 60,
            child: DropdownButton<Role>(
              value: widget.role,
              items: Role.values.map((Role role) {
                return DropdownMenuItem<Role>(
                  value: role,
                  child: Text(role.toView()),
                );
              }).toList(),
              onChanged: widget.onRoleChanged,
              hint: Text(
                'Выберите роль',
              ),
            ),
          ),
          const SizedBox(height: Dimensions.PADDING_8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => widget.onSignUp(
                    widget.emailTextController.text,
                    widget.passwordTextController.text,
                    widget.firstNameTextController.text,
                    widget.lastNameTextController.text,
                    widget.phoneNumberTextController.text,
                    //TODO
                    widget.role ?? Role.STUDENT,
                  ),
                  child: Text(
                    AppText.SIGN_UP,
                    style: AppTextTheme.primaryLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
