import 'package:domain/domain.dart';
import 'package:home/events/bloc/events_event.dart';
import 'package:home/events/bloc/events_state.dart';
import 'package:presentation/presentation.dart';

export 'events_event.dart';
export 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final SocialEventRepository _socialEventRepository =
      appDependencies.get<SocialEventRepository>();

  EventsBloc() : super(EventsState());

  @override
  Stream<EventsState> mapEventToState(EventsEvent event) async* {
    if (event is InitEvent) {
      final List<SocialEvent> events = await _socialEventRepository.getAll();
      yield state.copyWith(
        allEvents: events,
        filteredEvents: events,
      );
    } else if (event is UpdateSearchText) {
      yield state.copyWith(searchText: event.newSearchText);

      final List<SocialEvent> _filteredEvents = state.allEvents
          .where((SocialEvent event) => event.title
              .toLowerCase()
              .contains(state.searchText.toLowerCase()))
          .toList();
      yield state.copyWith(filteredEvents: _filteredEvents);
    }
  }
}
