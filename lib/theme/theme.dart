import 'package:flutter/material.dart';

bool isLight = true;


class CustomThemeData {
  CustomThemeData._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(centerTitle: true),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(centerTitle: true),
  );
}
