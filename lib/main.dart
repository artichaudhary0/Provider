import 'package:contact_diary/home_screen/home_screen.dart';
import 'package:contact_diary/stepper/stepper.dart';
import 'package:contact_diary/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: isLight ? CustomThemeData.lightTheme : CustomThemeData.darkTheme,
      home: HomeScreen(),
    );
  }
}
