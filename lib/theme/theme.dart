import 'package:flutter/material.dart';

bool isLight = true;


class CustomThemeData {
  CustomThemeData._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.red.shade50,
    appBarTheme: AppBarTheme(centerTitle: true),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: AppBarTheme(centerTitle: true),
  );
}
