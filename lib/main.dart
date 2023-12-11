import 'package:contact_diary/cart/cartProvider.dart';
import 'package:contact_diary/multi_provider/multiProvider.dart';
import 'package:contact_diary/multi_provider/multiScreen.dart';
import 'package:contact_diary/provider/count_provider.dart';
import 'package:contact_diary/provider/count_provider_widget.dart';
import 'package:contact_diary/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart/cartScreen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MultiProviderSlider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_)=> CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: isLight ? CustomThemeData.lightTheme : CustomThemeData.darkTheme,
        home: CartScreen(),
      ),
    );

    // return ChangeNotifierProvider(
    //   create: (context) => MultiProviderSlider(),
    //   child:
    // );
  }
}
