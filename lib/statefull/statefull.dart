import 'dart:async';

import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int count = 0;
  void setCount() {
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("chaudhary");
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Arti");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateTime.now().hour.toString() +
                " : " +
                DateTime.now().minute.toString() +
                " : " +
                DateTime.now().second.toString()),

            Text("Count"),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setCount();

          print(count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
