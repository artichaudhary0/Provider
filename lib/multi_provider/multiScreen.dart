import 'dart:developer';

import 'package:contact_diary/multi_provider/multiProvider.dart';
import 'package:contact_diary/provider/count_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class SecondScreenProvider extends StatefulWidget {
  const SecondScreenProvider({super.key});

  @override
  State<SecondScreenProvider> createState() => _SecondScreenProviderState();
}

class _SecondScreenProviderState extends State<SecondScreenProvider> {
  @override
  Widget build(BuildContext context) {
    final multiProviderSlider = Provider.of<MultiProviderSlider>(context,listen: false);

    log("arti");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<MultiProviderSlider>(builder: (context,v,child){
              return Slider(
                  min: 0,
                  max: 1,
                  value: v.value,
                  onChanged: (val){
                    multiProviderSlider.setValue(val);
                  }
              );
            }),
            Consumer<MultiProviderSlider>(builder: (context,v,child){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(
                          v.value,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(
                          v.value,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CountProviderWidget()));
        },
      ),
    );
  }
}
