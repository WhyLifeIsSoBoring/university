import 'package:flutter/material.dart';
import 'package:home/home_screen.dart';

class HomeFeature {
  static Page<void> page() => HomePage();
}

class HomePage extends Page<void> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => HomeScreen(),
      settings: this,
    );
  }
}
