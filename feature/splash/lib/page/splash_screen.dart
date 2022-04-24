import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:splash/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (BuildContext context, SplashState state) {
        return Scaffold(
          body: Container(
            color: AppColorTheme.white,
          ),
        );
      },
    );
  }
}
