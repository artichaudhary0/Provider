import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
   ThemeMode _themeChange = ThemeMode.light;

   ThemeMode get themeChange => _themeChange;

   void setTheme(themeChange){
     _themeChange = themeChange;
     notifyListeners();
   }





}