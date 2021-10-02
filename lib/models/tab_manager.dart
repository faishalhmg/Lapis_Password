import 'dart:async';

import 'package:flutter/material.dart';

class PasswordTab {
  static const int dashboard = 0;
  static const int addPassword = 1;
  static const int searchPassword = 2;
}

class TabManager extends ChangeNotifier {
  bool _initialized = false;
  bool _onboardingComplete = false;
  int _selectedTab = PasswordTab.dashboard;
  bool get isInitialized => _initialized;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    // 7
    Timer(
      const Duration(milliseconds: 2000),
      () {
        // 8
        _initialized = true;
        // 9
        notifyListeners();
      },
    );
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToAddPassword() {
    _selectedTab = PasswordTab.addPassword;
    notifyListeners();
  }

  void goToDashboard() {
    _selectedTab = PasswordTab.dashboard;
    notifyListeners();
  }

  void goToSearch() {
    _selectedTab = PasswordTab.searchPassword;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }
}
