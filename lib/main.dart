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

bool _isLight = true;

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _isLight ? CustomThemeData.lightTheme : CustomThemeData.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_isLight ? "Light Theme" : " Dark Theme"),
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLight = !_isLight;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  _isLight ? Icons.sunny : Icons.shield_moon,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
             StepperDemo(),

            ],
          ),
        ),
      ),
    );
  }
}
