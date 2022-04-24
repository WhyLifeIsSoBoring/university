import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_bloc.dart';
import 'package:video/page/video_screen.dart';

class VideoFeature {
  static Page<dynamic> page() => VideoPage();
}

class VideoPage extends Page<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => BlocProvider<VideoBloc>(
        create: (BuildContext context) =>
            VideoBloc(appRouter: appDependencies.get<AppRouter>())
              ..add(InitEvent()),
        child: VideoScreen(),
      ),
      settings: this,
    );
  }
}
