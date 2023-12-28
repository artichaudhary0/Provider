import 'package:contact_diary/cart/cartProvider.dart';
import 'package:contact_diary/controller/platformController.dart';
import 'package:contact_diary/multi_provider/multiProvider.dart';
import 'package:contact_diary/pageview/pageView.dart';
import 'package:contact_diary/provider/count_provider.dart';
import 'package:contact_diary/screens/main_screen.dart';
import 'package:contact_diary/view/android_home_page.dart';
import 'package:contact_diary/view/ios_home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
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
    DevicePreview(
      builder: (context) => MyApp(isDark: isDark),
    ),
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
        ChangeNotifierProvider(create: (_) => PlatformController()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangeProvider = Provider.of<ThemeProvider>(context);
          return  Provider.of<PlatformController>(context).isAndroid?


            MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeChangeProvider.currentTheme,
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: PageViewDemo(),
          ) : CupertinoApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

            home: IosHomePage(),
          )


          ;
        },
      ),
    );
  }
}
