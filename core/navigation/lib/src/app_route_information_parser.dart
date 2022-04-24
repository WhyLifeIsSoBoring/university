import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  final Page<dynamic> _defaultPage;
  static const String _DEFAULT_EMPTY_VALUE = '';

  AppRouteInformationParser({required Page<dynamic> defaultPage})
      : _defaultPage = defaultPage;

  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    // We take the RouteInformation data and go through the registered factories
    // of features to create the configuration our application can work with
    // it means that it maybe even several pages in case of deeplink
    // to show on the current stack
    // So we need a contract for the location and current state to produce
    // a correct stack
    // final data = _featuresService.generateFrom(location, state);
    return SynchronousFuture<RouteConfiguration>(
        RouteConfiguration(page: _defaultPage));
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfiguration configuration) =>
      RouteInformation(
          location: _DEFAULT_EMPTY_VALUE, state: _DEFAULT_EMPTY_VALUE);
}

///The model of route configuration that is used
///to configure the stack of navigation
class RouteConfiguration {
  final Page<dynamic> page;

  RouteConfiguration({required this.page});

  @override
  String toString() {
    return 'RouteConfiguration for ${page.name}';
  }
}
