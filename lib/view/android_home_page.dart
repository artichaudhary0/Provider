import 'dart:io';
import 'package:contact_diary/controller/platformController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login.dart';

class AndroidHomePage extends StatelessWidget {
  AndroidHomePage({super.key});

  bool isAndroid = Platform.isAndroid; // false
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text(isAndroid ? "Android" : "Ios"),
        actions: [
          Consumer<PlatformController>(
            builder: (context, provider, child) {
              return Switch(
                  value: provider.isAndroid,
                  onChanged: (val) {
                    provider.changePlatform(val: val);
                  });
            },
          ),
          IconButton(
            onPressed: () {
              final popUpMenu = PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    24,
                  ),
                ),
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Text("Rating"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("⭐⭐⭐⭐⭐"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Text("Rating"),
                        const SizedBox(
                          width: 10,
                        ),
                        Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Text("Rating"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("⭐⭐⭐⭐⭐"),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Text("Rating"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("⭐⭐⭐⭐⭐"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.logout),
                        Text("Sign out"),
                      ],
                    ),
                  ),
                ],
              );

              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(1000, 1000, 1000, 1000),
                  items: popUpMenu.itemBuilder(context));
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                scaffoldState.currentState!.showBottomSheet(
                    enableDrag: true,
                    (context) => Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ));
              },
              child: Text("Open sheet"),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ));
              },
              child: Text("Open model sheet"),
            ),
          ],
        ),
      ),
    );
  }
}
