import 'package:data/di/di.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final DataDi dataDi = DataDi(serviceLocator: appDependencies);
  await dataDi.init();

  runApp(UniversityApp());
}

class UniversityApp extends StatefulWidget {
  @override
  _UniversityAppState createState() => _UniversityAppState();
}

class _UniversityAppState extends State<UniversityApp> {
  @override
  void initState() {
    super.initState();
    appDependencies.registerSingleton(AppRouter());
    appDependencies.registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(
        defaultPage: SplashFeature.page(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appDependencies.get<AppRouteInformationParser>(),
      routerDelegate: appDependencies.get<AppRouter>(),
    );
  }
}
