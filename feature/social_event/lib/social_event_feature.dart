import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:social_event/bloc/social_event_bloc.dart';
import 'package:social_event/social_event_screen.dart';

class SocialEventFeature {
  static Page<void> page({required SocialEvent socialEvent}) =>
      SocialEventPage(socialEvent: socialEvent);
}

class SocialEventPage extends Page<void> {
  final SocialEvent socialEvent;

  const SocialEventPage({required this.socialEvent});

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<SocialEventBloc>(
        create: (_) => SocialEventBloc(socialEvent: socialEvent),
        child: SocialEventScreen(),
      ),
    );
  }
}
