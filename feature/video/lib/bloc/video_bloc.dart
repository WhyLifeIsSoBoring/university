import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_event.dart';
import 'package:video/bloc/video_state.dart';

export 'video_event.dart';
export 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final UserRepository _userRepository = appDependencies.get<UserRepository>();

  VideoBloc() : super(VideoState());

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is InitEvent) {
      final User? currentUser = await _userRepository.getCurrent();

      yield VideoState(user: currentUser);
    }
  }
}
