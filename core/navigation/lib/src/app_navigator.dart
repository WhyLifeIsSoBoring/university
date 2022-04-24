import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation/src/logout_delegate.dart';
import 'package:navigation/src/navigator_observer.dart';
import 'package:navigation/src/page_stack_controller.dart';
import 'package:rxdart/rxdart.dart';

import 'app_route_information_parser.dart';
import 'tasks_stack_controller.dart';

enum NavigationLoginEvent { willLogin, didLogin, willLogout, didLogout }

/// This is the RouterDelegate that handles navigation
/// logic of the main screen that is fullscreen and
/// contains all the app in it
class AppRouter extends RouterDelegate<RouteConfiguration>
    with
        // ignore: prefer_mixin
        ChangeNotifier,
        PageStackController,
        TasksStackController,
        LogoutDelegate {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  RouteConfiguration? get currentConfiguration =>
      pages.isNotEmpty ? RouteConfiguration(page: pages.last) : null;

  late MainNavigatorObserver _navigatorObserver;

  set navigatorObserver(MainNavigatorObserver appNavigatorObserver) =>
      _navigatorObserver = appNavigatorObserver;

  late Function _onPostLoginZoneStart;
  late Function _onLogoutZoneStart;

  Stream<NavigationLoginEvent> get loginEventStream =>
      _loginEventBehaviorSubject.stream;

  final BehaviorSubject<NavigationLoginEvent> _loginEventBehaviorSubject =
      BehaviorSubject<NavigationLoginEvent>(sync: true);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: pages,
      // observers: <NavigatorObserver>[_navigatorObserver],
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) {
    resetTo(configuration.page);
    return SynchronousFuture<void>(null);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final bool didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    pop();
    return true;
  }

  Future<dynamic> startForResult(
      Page<dynamic> page, Completer<dynamic> subscription) {
    assert(page.name != null);
    registerTask(pageName: page.name!, subscription: subscription);
    push(page);
    return subscription.future;
  }

  /// Checks if there are subscriptions for the current page result
  /// if found router will trigger completers with result and remove the
  /// subscriptions
  /// [result] - result from the page
  /// [closeCurrentPage] - whether the page that return the result should
  /// be closed and removed from navigation stack
  void returnWithResult(dynamic result, [bool closeCurrentPage = true]) {
    assert(pages.last.name != null);
    final String resultProducerName = pages.last.name!;
    completeAndUnregisterTask(
        result: result, resultProducerName: resultProducerName);
    if (closeCurrentPage) {
      pop();
    }
  }

  @override
  void dispose() {
    unregisterAllTasks();
    super.dispose();
  }

  ///This listener is triggered when the application
  ///enters the post login section of the application
  ///this is used to provide the post login section
  ///di to be initialized
  void addOnLoggedInListener(Function callback) {
    _onPostLoginZoneStart = callback;
  }

  ///This event is triggered when the application
  ///enters the post login section of the application
  void onLoggedInSectionEntering() {
    _onPostLoginZoneStart.call();
  }

  ///This listener is triggered when the application
  ///exits the post login section of the application
  ///this is used to provide the post login section
  ///di to be deinitialized
  void addOnLogOutListener(Function callback) {
    _onLogoutZoneStart = callback;
  }

  Future<void> onLogIn({Function? logInAction}) async {
    _loginEventBehaviorSubject.add(NavigationLoginEvent.willLogin);
    onLoggedInSectionEntering();
    await logInAction?.call();
    _loginEventBehaviorSubject.add(NavigationLoginEvent.didLogin);
  }

  /// This event is triggered when the application
  /// exits the post login section of the application.
  ///
  /// Router sends stream event `NavigationLoginEvent.willLogout`,
  /// then calls `logoutAction` and after that it sends
  /// stream event `NavigationLoginEvent.didLogout`
  Future<void> onLogOut({Function? logoutAction}) async {
    _loginEventBehaviorSubject.add(NavigationLoginEvent.willLogout);
    await logoutAction?.call();
    _onLogoutZoneStart.call();
    _loginEventBehaviorSubject.add(NavigationLoginEvent.didLogout);
  }

  @override
  Future<bool> popRoute() async {
    if (pages.length > 1) {
      onPopTask(pages.last.name);
      pop();
      return true;
    }
    return false;
  }
}
