import 'package:core/core.dart';
import 'package:domain/domain.dart';

class EventsState extends Equatable {
  final String searchText;
  final List<SocialEvent> allEvents;
  final List<SocialEvent> filteredEvents;

  static const List<SocialEvent> _EMPTY_LIST = <SocialEvent>[];

  const EventsState({
    this.searchText = '',
    this.allEvents = _EMPTY_LIST,
    this.filteredEvents = _EMPTY_LIST,
  });

  EventsState copyWith({
    String? searchText,
    List<SocialEvent>? allEvents,
    List<SocialEvent>? filteredEvents,
  }) {
    return EventsState(
      searchText: searchText ?? this.searchText,
      allEvents: allEvents ?? this.allEvents,
      filteredEvents: filteredEvents ?? this.filteredEvents,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        searchText,
        allEvents,
        filteredEvents,
      ];
}
