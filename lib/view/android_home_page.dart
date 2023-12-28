import 'dart:io';
import 'package:contact_diary/controller/platformController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/login.dart';

class AndroidHomePage extends StatefulWidget {
  AndroidHomePage({super.key});

  @override
  State<AndroidHomePage> createState() => _AndroidHomePageState();
}

class _AndroidHomePageState extends State<AndroidHomePage> {
  bool isAndroid = Platform.isAndroid;
  // false
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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
            /*

             TimeOfDay class
             CupertinoDatePicker widget (display time)
             CupertinoAlertDialog widget
            */
            Text(
              "${selectedTime.hour}h" + "  : ${selectedTime.minute}min",
              style: TextStyle(fontSize: 30),
            ),
            CupertinoButton.filled(
              child: Text("press for time picker android"),
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  initialEntryMode: TimePickerEntryMode.dial,
                  context: context, initialTime: selectedTime,
                );

                if(pickedTime!=null)
                {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }


              },
            ),




            Text("${selectedDate.year} / " +
                "${selectedDate.month} / " +
                "${selectedDate.day}"),
            CupertinoButton(
              child: Text("press for date picker"),
              onPressed: () async {
                var pickedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2022),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }

                print(pickedDate);
              },
            ),
            CupertinoButton.filled(
              child: Text("press for date picker IOS"),
              onPressed: () async {
                var pickedDate = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                          height: 150,
                          decoration: BoxDecoration(color: Colors.black12),
                          child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newSelectedDate) {
                                setState(() {
                                  selectedDate = newSelectedDate;
                                });
                              }));
                    });

                print(pickedDate);
              },
            ),
            CupertinoContextMenu(
              actions: [
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Text("Hello"),
                Text("Hello"),
              ],
              child: Text("arti"),
            ),

            Text("${selectedTime.hour}"),
            Text("${selectedDate.year} / " +
                "${selectedDate.month} / " +
                "${selectedDate.day}"),
            CupertinoButton(
              child: Text("press for date picker"),
              onPressed: () async {
                var pickedDate = await showDatePicker(

                  context: context,
                  firstDate: DateTime(2022),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }

                print(pickedDate);
              },
            ),
            CupertinoButton.filled(
              child: Text("press for date picker IOS"),
              onPressed: () async {
                var pickedDate = await showCupertinoModalPopup(

                    context: context, builder: (context){
                  return Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.black12),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                          use24hFormat: true,
                          onDateTimeChanged: (DateTime newSelectedDate){

                            setState(() {
                              selectedDate = newSelectedDate;
                            });

                          }));
                });


                print(pickedDate);
              },
            ),


            CupertinoContextMenu(
              actions: [
                Container(
                  height: 50,
                  color: Colors.red,
                ),
                Text("Hello"),
                Text("Hello"),
              ],
              child: Text("arti"),
            )
          ],
        ),
      ),
    );
  }
}
