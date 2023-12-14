import 'package:contact_diary/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../stepper/stepper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLight ? "Light Theme" : " Dark Theme"),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isLight = !isLight;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isLight ? Icons.sunny : Icons.shield_moon,
                color: Colors.amber,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              SharedPreferences sharedPref =
                  await SharedPreferences.getInstance();

              sharedPref.remove("email").whenComplete(() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.remove,
              ),
            ),
          ),
        ],
      ),
      body: StepperDemo(),
    );
  }
}
