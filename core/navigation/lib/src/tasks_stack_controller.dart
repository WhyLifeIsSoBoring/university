import 'dart:async';

import 'package:flutter/material.dart';

///Handles tasks request/response lifecycle
mixin TasksStackController {
  ///Waiting for result subscriptions
  ///They all are disposed if current
  ///navigator will be disposed
  final Map<String, List<Completer<dynamic>>> _tasks =
      <String, List<Completer<dynamic>>>{};

  @visibleForTesting
  Map<String, List<Completer<dynamic>>> get tasks =>
      Map<String, List<Completer<dynamic>>>.unmodifiable(_tasks);

  /// Registers the subscription for the result
  /// It handles relation one to many , so it is
  /// possible to have many subscriptions to the one
  /// result producer (page)
  void registerTask(
      {required String pageName, required Completer<dynamic> subscription}) {
    if (_tasks[pageName] == null) {
      _tasks[pageName] = <Completer<dynamic>>[];
    }
    _tasks[pageName]!.add(subscription);
  }

  /// Checks if there are subscriptions for the current page result
  /// if found router will trigger completers with result and remove the
  /// subscriptions
  void completeAndUnregisterTask(
      {required String resultProducerName, required dynamic result}) {
    ///Looking if there is anyone waiting for the
    ///result from the producer of the result
    if (_tasks.containsKey(resultProducerName)) {
      _tasks[resultProducerName]!.forEach((Completer<dynamic> subscription) {
        if (subscription.isCompleted) {
          throw Exception('The subscription provided is already completed and'
              'so it is invalid to be used again. '
              'Please, provide a new completer');
        }
        subscription.complete(result);
      });
      _tasks.remove(resultProducerName);
    }
  }

  void onPopTask(String? resultProducerName) {
    if (resultProducerName != null) {
      completeAndUnregisterTask(
          result: null, resultProducerName: resultProducerName);
    }
  }

  /// Call this method in dispose to
  /// prevent leaks
  void unregisterAllTasks() {
    _tasks.clear();
  }
}
