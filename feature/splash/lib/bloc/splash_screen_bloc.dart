import 'package:auth/auth.dart';
import 'package:presentation/presentation.dart';
import 'package:splash/bloc/splash_screen_event.dart';
import 'package:splash/bloc/splash_screen_state.dart';

export 'splash_screen_event.dart';
export 'splash_screen_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter appRouter;

  SplashBloc({required this.appRouter})
      : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is InitEvent) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      appRouter.replace(AuthFeature.page());
    }
  }
}
