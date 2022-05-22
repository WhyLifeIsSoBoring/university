import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_bloc.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (BuildContext context, VideoState state) {
        if (state is EmptyState) {
          return Loader();
        } else if (state is VideoStateWithContent) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Видео конференция',
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  AgoraVideoViewer(
                    client: state.agoraClient,
                    layoutType: Layout.floating,
                    floatingLayoutMainViewPadding: const EdgeInsets.all(0),
                    floatingLayoutSubViewPadding: const EdgeInsets.all(0),
                    disabledVideoWidget: Container(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          '${state.user.firstName} ${state.user.lastName}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    showAVState: true,
                    showNumberOfUsers: false,
                  ),
                  AgoraVideoButtons(
                    client: state.agoraClient,
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
