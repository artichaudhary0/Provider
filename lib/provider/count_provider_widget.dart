import 'package:contact_diary/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountProviderWidget extends StatelessWidget {
  const CountProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);

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
            Consumer<CountProvider>(builder: (BuildContext context, value, child) {
              return Text(value.count.toString(),style: TextStyle(fontSize: 30),);
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
          print(countProvider.count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
