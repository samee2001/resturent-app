import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // Initialize ThemeMode with a default value (light mode)
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for ThemeMode
  ThemeMode get themeMode => _themeMode;

  // Getter to check if the current mode is dark mode
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Getter for ThemeData based on ThemeMode
  ThemeData get themeData {
    return _themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
  }

  // Setter for ThemeMode with listener notification
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  // Toggle between light and dark themes
  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
