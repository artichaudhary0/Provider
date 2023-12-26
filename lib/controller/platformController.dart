import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformController with ChangeNotifier{

  bool isAndroid = Platform.isAndroid;

  void changePlatform({required bool val})
  {
    isAndroid = val;
    notifyListeners();
  }



}