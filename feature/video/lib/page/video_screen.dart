import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "559c2a611c1f4345a4fd489c48aed484",
      tempToken:
          "006559c2a611c1f4345a4fd489c48aed484IAD/9dE/V9t3R+UgOlkmetOkSOIX9FV0ahVE/JkjacL280oMZAwAAAAAEAC1xaJwyVrAYQEAAQDJWsBh",
      channelName: "test room",
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Видео конференция',
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              floatingLayoutMainViewPadding: const EdgeInsets.all(0),
              floatingLayoutSubViewPadding: const EdgeInsets.all(0),
              disabledVideoWidget: Container(
                color: Colors.black,
                child: Center(
                  child: const Text(
                    'Максим Станкевич',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
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
}
