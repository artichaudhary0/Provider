import 'package:contact_diary/provider/count_provider.dart';
import 'package:contact_diary/provider/count_provider_widget.dart';
import 'package:contact_diary/statefull/statefull.dart';
import 'package:contact_diary/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child:  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: isLight ? CustomThemeData.lightTheme : CustomThemeData.darkTheme,
      home:  CountProviderWidget(),
    ),
    );
  }
}
