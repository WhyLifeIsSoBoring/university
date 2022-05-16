import 'package:domain/domain.dart';
import 'package:home/schools/bloc/schools_event.dart';
import 'package:home/schools/bloc/schools_state.dart';
import 'package:presentation/presentation.dart';

export 'schools_event.dart';
export 'schools_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolsState> {
  final SchoolRepository _schoolRepository =
      appDependencies.get<SchoolRepository>();
  final AppRouter _appRouter = appDependencies.get<AppRouter>();

  SchoolBloc() : super(SchoolsState());

  @override
  Stream<SchoolsState> mapEventToState(SchoolEvent event) async* {
    try {
      if (event is InitEvent) {
        final List<School> schools = await _schoolRepository.getAll();
        yield state.copyWith(
          allSchools: schools,
          filteredSchools: schools,
        );
      } else if (event is UpdateSearchText) {
        yield state.copyWith(searchText: event.newSearchText);

        final List<School> _filteredSchools = state.allSchools
            .where((School school) => school.title
                .toLowerCase()
                .contains(state.searchText.toLowerCase()))
            .toList();
        yield state.copyWith(filteredSchools: _filteredSchools);
      } else if (event is OpenCurrentSchool) {
        // _appRouter.push(SocialEventFeature.page(socialEvent: event.socialEvent));
      }
    } catch (e) {
      yield state.copyWith(
        errorMessage: 'Что-то пошло не так при загрузке данных',
      );
    }
  }
}
