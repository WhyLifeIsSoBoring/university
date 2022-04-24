import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

mixin LogoutDelegate on PageStackController {
  late Function loginPageCreateCallback;

  void logout() {
    replace(loginPageCreateCallback() as Page<dynamic>);
  }
}