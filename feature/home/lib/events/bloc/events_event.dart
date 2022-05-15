abstract class EventsEvent {}

class InitEvent extends EventsEvent {}

class UpdateSearchText extends EventsEvent {
  final String? newSearchText;

  UpdateSearchText({required this.newSearchText});
}