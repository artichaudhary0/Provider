import 'package:contact_diary/ThemeProvider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChangeProvider =
    Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            themeChangeProvider.toggleTheme();
          },
          child: Text("fiqwv"),
        ),
      ),
    );
  }
}
