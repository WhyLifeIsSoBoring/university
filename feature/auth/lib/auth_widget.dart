import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class AuthWidget extends StatefulWidget {
  final void Function(String email, String password) onSignUp;
  final void Function(String email, String password) onSignIn;

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  final String? emailError;
  final String? passwordError;

  const AuthWidget({
    required this.onSignUp,
    required this.onSignIn,
    required this.emailTextController,
    required this.passwordTextController,
    this.emailError,
    this.passwordError,
  });

  @override
  State<StatefulWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
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
          const SizedBox(height: Dimensions.SPACE_20),
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
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onTap: _changePasswordVisibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.PADDING_8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => widget.onSignIn(
                    widget.emailTextController.text,
                    widget.passwordTextController.text,
                  ),
                  child: Text(
                    AppText.SIGN_IN,
                    style: AppTextTheme.primaryLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.PADDING_8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => widget.onSignUp(
                    widget.emailTextController.text,
                    widget.passwordTextController.text,
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
