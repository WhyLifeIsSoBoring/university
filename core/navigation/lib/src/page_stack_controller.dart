import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'exception/navigation_exception.dart';

///Handles pages navigation stack lifecycle
mixin PageStackController on ChangeNotifier {
  final List<Page<dynamic>> _pages = <Page<dynamic>>[];

  List<Page<dynamic>> get pages => List<Page<dynamic>>.unmodifiable(_pages);

  /// This provides the events for the
  /// listeners of the current page
  /// being on the top of the stack
  @visibleForTesting
  Function? currentPageListener;

  void push(Page<dynamic> page) {
    _pages.add(page);
    notifyListeners();
  }

  void pushAll(List<Page<dynamic>> pages) {
    _pages.addAll(pages);
    notifyListeners();
  }

  void removeOfType<T>() {
    final int index = _pages.indexWhere((Page<dynamic> page) => page is T);
    if (index != -1) {
      _pages.removeAt(index);
      notifyListeners();
    }
  }

  bool containsOfType<T>() {
    final int index = _pages.indexWhere((Page<dynamic> page) => page is T);
    return index != -1;
  }

  void remove(Page<dynamic> page) {
    _pages.remove(page);
    notifyListeners();
  }

  void insertAfterType<T>(Page<dynamic> page) {
    final int index = _pages.indexWhere((Page<dynamic> page) => page is T);
    if (index != -1) {
      _pages.insert(index + 1, page);
      notifyListeners();
    }
  }

  void insertBeforeType<T>(Page<dynamic> page) {
    final int index = _pages.indexWhere((Page<dynamic> page) => page is T);
    if (index != -1) {
      _pages.insert(index, page);
      notifyListeners();
    }
  }

  void replace(Page<dynamic> page) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      push(page);
    } else {
      push(page);
    }
  }

  void replaceLastWith(List<Page<dynamic>> pages) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      pushAll(pages);
    } else {
      pushAll(pages);
    }
  }

  void resetTo(Page<dynamic> page) {
    _pages
      ..clear()
      ..add(page);
    notifyListeners();
  }

  void returnToOrPush<T>(Page<dynamic> page) {
    final int index = _pages.indexWhere((Page<dynamic> page) => page is T);
    if (index != -1) {
      _pages.removeRange(index + 1, pages.length);
      notifyListeners();
    } else {
      push(page);
    }
  }


  void popUntil(String pageName) {
    final int index =
        _pages.indexWhere((Page<dynamic> page) => page.name == pageName);
    switch (index) {
      case -1:
        throw NavigationException(
            msg: 'PageName $pageName is not found'
                ' on the stack of $runtimeType');
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void popUntilPage(Page<dynamic> untilPage) {
    final int index =
        _pages.indexWhere((Page<dynamic> page) => page.name == untilPage.name);
    switch (index) {
      case -1:
        throw NavigationException(
            msg: 'PageName ${untilPage.name} is not found'
                ' on the stack of $runtimeType');
    }
    _pages.removeRange(index + 1, _pages.length);
    notifyListeners();
  }

  void pop() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
    }
  }

  void resetToFirst() {
    _pages.removeRange(1, _pages.length);
    notifyListeners();
  }

  ///At the moment of implementation only one
  ///listener was needed Maybe eventually there will be
  ///needed more, so feel free to refactor :-)
  void addCurrentPageListener(Function callback) {
    currentPageListener = callback;
  }

  void removeCurrentPageListener() {
    currentPageListener = null;
  }

  @override
  void notifyListeners() {
    _notifyCurrentPageListener();
    super.notifyListeners();
  }

  bool canPop() {
    return pages.isNotEmpty && pages.length > 1;
  }

  void _notifyCurrentPageListener() {
    if (pages.isNotEmpty) {
      currentPageListener?.call(pages.last);
    }
  }
}
