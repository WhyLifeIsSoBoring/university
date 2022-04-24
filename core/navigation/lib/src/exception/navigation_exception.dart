import 'dart:core';

class NavigationException implements Exception {
  final String msg;
  const NavigationException({required this.msg});
  @override
  String toString() => 'NavigationException: $msg';
}
