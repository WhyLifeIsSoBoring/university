import 'package:auth/auth.dart';
import 'package:domain/domain.dart';
import 'package:home/more/bloc/more_event.dart';
import 'package:home/more/bloc/more_state.dart';
import 'package:presentation/presentation.dart';
import 'package:url_launcher/url_launcher.dart';

export 'more_event.dart';
export 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final AppRouter _appRouter = appDependencies.get<AppRouter>();
  final AuthRepository _authRepository = appDependencies.get<AuthRepository>();

  MoreBloc() : super(MoreState());

  static const String _LIBRARY_URL = 'https://elib.bsu.by/';
  static const String _TESTS_URL = 'https://obrazovaka.ru/testy';

  @override
  Stream<MoreState> mapEventToState(MoreEvent event) async* {
    if (event is SignOut) {
      await _authRepository.signOut();
      _appRouter.resetTo(AuthFeature.page());
    } else if (event is OpenLibrary) {
      await _launchUrl(Uri.parse(_LIBRARY_URL));
    } else if (event is OpenTests) {
      await _launchUrl(Uri.parse(_TESTS_URL));
    } else if (event is OpenUserCabinet) {}
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
