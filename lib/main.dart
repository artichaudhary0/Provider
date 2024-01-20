import 'package:contact_diary/ThemeProvider/themeProviderScreen.dart';
import 'package:contact_diary/cart/cartProvider.dart';
import 'package:contact_diary/multi_provider/multiProvider.dart';
import 'package:contact_diary/provider/count_provider.dart';
import 'package:contact_diary/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ThemeProvider/themeProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final isDark = sharedPreferences.getBool("isDark") ?? false;
  print(isDark);

  runApp(
    MyApp(isDark: isDark),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({
    super.key,
    required this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MultiProviderSlider()),
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider(isDark)),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChangeProvider = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: themeChangeProvider.currentTheme,
              darkTheme: ThemeData(brightness: Brightness.dark),
              home: const ThemeScreen(),


  }
}
