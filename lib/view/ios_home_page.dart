import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosHomePage extends StatelessWidget {
  const IosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            CupertinoActivityIndicator(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
