import 'package:agora_uikit/agora_uikit.dart';
import 'package:domain/domain.dart';

abstract class VideoState {
  final String roomName;
  final String roomToken;

  VideoState({
    required this.roomName,
    required this.roomToken,
  });
}

class EmptyState extends VideoState {
  EmptyState({
    required String roomName,
    required String roomToken,
  }) : super(
          roomName: roomName,
          roomToken: roomToken,
        );
}

class VideoStateWithContent extends VideoState {
  final User user;
  final AgoraClient agoraClient;

  VideoStateWithContent({
    required String roomName,
    required String roomToken,
    required this.user,
    required this.agoraClient,
  }) : super(
          roomName: roomName,
          roomToken: roomToken,
        );
}
