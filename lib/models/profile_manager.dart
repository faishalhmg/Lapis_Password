import 'package:flutter/material.dart';
import 'package:save_password/models/user.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
        darkMode: _darkMode,
      );
  bool get darkMode => _darkMode;

  var _darkMode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }
}
