import 'package:flutter/cupertino.dart';

class IosHomePage extends StatelessWidget {
  const IosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Ios"),
      ),
    );
  }
}
