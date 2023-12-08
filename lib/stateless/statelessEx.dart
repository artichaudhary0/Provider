import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
   StatelessExample({super.key});

  int count = 10;
  void setCount(){
    count++;

  }

  @override
  Widget build(BuildContext context) {
    print("Arti");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Count"),
            Text(count.toString(),style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setCount();
          count++;
          print(count);


        },
        child: Icon(Icons.add),
      ),
    );
  }
}
