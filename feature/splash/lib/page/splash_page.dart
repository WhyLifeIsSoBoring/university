import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:splash/bloc/splash_screen_bloc.dart';
import 'package:splash/page/splash_screen.dart';

class SplashFeature {
  static Page<dynamic> page() => SplashPage();
}

class SplashPage extends Page<void> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<SplashBloc>(
        create: (_) => SplashBloc(
          appRouter: appDependencies.get<AppRouter>(),
        )..add(InitEvent()),
        child: SplashScreen(),
      ),
    );
  }
}
