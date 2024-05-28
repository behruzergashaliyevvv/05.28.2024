import 'package:dars/views/models/settrings.dart';
import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  final Settings settings = Settings(themeMode: ThemeMode.system);

  void toggle(bool isDarkMode) {
    if (isDarkMode) {
      settings.themeMode = ThemeMode.dark;
    } else {
      settings.themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}



