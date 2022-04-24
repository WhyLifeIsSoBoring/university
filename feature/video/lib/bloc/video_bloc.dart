import 'package:presentation/presentation.dart';
import 'package:video/bloc/video_event.dart';
import 'package:video/bloc/video_state.dart';

export 'video_event.dart';
export 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final AppRouter appRouter;

  VideoBloc({required this.appRouter}) : super(VideoState());

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {}
}
