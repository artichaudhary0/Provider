import 'package:flutter/foundation.dart';


class MultiProviderSlider with ChangeNotifier{
  double _value = 1;
  double get value => _value;


  void setValue(val){
    _value = val;


    notifyListeners();
  }

}