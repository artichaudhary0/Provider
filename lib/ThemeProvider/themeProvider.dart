import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeChange = ThemeMode.light;
  ThemeMode get themeChange => _themeChange;

  void setTheme(themeChange) {
    _themeChange = themeChange;
    notifyListeners();
  }

  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  ThemeProvider(bool isDark){
    if(isDark){
      _currentTheme = ThemeData.dark();
    }
    _currentTheme = ThemeData.light();
  }

  toggleTheme()async {
    SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (_currentTheme == ThemeData.light()) {
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool("isDark", true);
      print("dark"+_currentTheme.toString());

    } else {
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool("isDark", false);
      print("cjyde"+_currentTheme.toString());
    }
    notifyListeners();
  }
}
