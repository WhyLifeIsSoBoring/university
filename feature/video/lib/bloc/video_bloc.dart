import 'package:agora_uikit/agora_uikit.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_event.dart';
import 'package:video/bloc/video_state.dart';

export 'video_event.dart';
export 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final UserRepository _userRepository = appDependencies.get<UserRepository>();

  VideoBloc({
    required String roomName,
    required String roomToken,
  }) : super(EmptyState(
          roomName: roomName,
          roomToken: roomToken,
        ));

  static const String _appId = '559c2a611c1f4345a4fd489c48aed484';

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is InitEvent) {
      final User? currentUser = _userRepository.getCurrent();

      final AgoraClient client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: _appId,
          tempToken: state.roomToken,
          channelName: state.roomName,
        ),
        enabledPermission: <Permission>[
          Permission.camera,
          Permission.microphone,
        ],
      );

      await client.initialize();

      if (currentUser != null) {
        yield VideoStateWithContent(
          roomName: state.roomName,
          roomToken: state.roomToken,
          user: currentUser,
          agoraClient: client,
        );
      }
    }
  }
}
