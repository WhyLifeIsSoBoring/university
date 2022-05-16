import 'package:domain/model/social_event.dart';

abstract class EventsEvent {}

class InitEvent extends EventsEvent {}

class UpdateSearchText extends EventsEvent {
  final String? newSearchText;

  UpdateSearchText({required this.newSearchText});
}

class OpenCurrentEvent extends EventsEvent {
  final SocialEvent socialEvent;

  OpenCurrentEvent({required this.socialEvent});
}
