import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_bloc.dart';
import 'package:video/page/video_screen.dart';

class VideoFeature {
  static Page<dynamic> page({
    required String roomName,
    required String roomToken,
  }) =>
      VideoPage(
        roomName: roomName,
        roomToken: roomToken,
      );
}

class VideoPage extends Page<dynamic> {
  final String roomName;
  final String roomToken;

  const VideoPage({
    required this.roomName,
    required this.roomToken,
  });

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => BlocProvider<VideoBloc>(
        create: (BuildContext context) => VideoBloc()..add(InitEvent()),
        child: VideoScreen(
          roomName: roomName,
          roomToken: roomToken,
        ),
      ),
      settings: this,
    );
  }
}
