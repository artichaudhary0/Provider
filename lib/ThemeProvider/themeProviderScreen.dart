import 'package:contact_diary/ThemeProvider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChangeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("Light theme"),
            value: ThemeMode.light,
            groupValue: themeChangeProvider.themeChange,
            onChanged: themeChangeProvider.setTheme,
          )
          ,
          RadioListTile<ThemeMode>(
            title: Text("Dark theme"),
            value: ThemeMode.dark,
            groupValue: themeChangeProvider.themeChange,
            onChanged: themeChangeProvider.setTheme,
          )
          ,
          RadioListTile<ThemeMode>(
            title: Text("System theme"),
            value: ThemeMode.system,
            groupValue: themeChangeProvider.themeChange,
            onChanged: themeChangeProvider.setTheme,
          )
        ],
      ),
    );
  }
}
