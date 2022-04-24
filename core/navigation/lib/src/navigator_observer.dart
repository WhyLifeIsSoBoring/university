import 'package:flutter/widgets.dart';

class MainNavigatorObserver extends NavigatorObserver {
  final BackButtonDispatcher _backButtonDispatcher;

  MainNavigatorObserver(this._backButtonDispatcher);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didStopUserGesture() {
    _backButtonDispatcher.takePriority();
  }
}

class ChildNavigatorObserver extends NavigatorObserver {
  final ChildBackButtonDispatcher _backButtonDispatcher;

  ChildNavigatorObserver(this._backButtonDispatcher);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    _backButtonDispatcher.takePriority();
  }

  @override
  void didStopUserGesture() {
    _backButtonDispatcher.takePriority();
  }
}
