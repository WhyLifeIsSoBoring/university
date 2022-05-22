import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_bloc.dart';

class VideoScreen extends StatefulWidget {
  final String roomName;
  final String roomToken;

  const VideoScreen({
    required this.roomName,
    required this.roomToken,
  });

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  static const String _appId = '559c2a611c1f4345a4fd489c48aed484';
  late final AgoraClient client;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: _appId,
        tempToken: widget.roomToken,
        channelName: widget.roomName,
      ),
      enabledPermission: <Permission>[
        Permission.camera,
        Permission.microphone,
      ],
    );

    _initAgoraClient();
  }

  void _initAgoraClient() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (BuildContext context, VideoState state) {
        if (state.user == null) {
          return Loader();
        } else {
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
                    client: client,
                    layoutType: Layout.floating,
                    floatingLayoutMainViewPadding: const EdgeInsets.all(0),
                    floatingLayoutSubViewPadding: const EdgeInsets.all(0),
                    disabledVideoWidget: Container(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          '${state.user!.firstName} ${state.user!.lastName}',
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
                    client: client,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
