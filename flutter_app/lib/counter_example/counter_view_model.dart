import 'package:flutter/widgets.dart';

class CounterViewModel extends ChangeNotifier{
  int num = 0;

  void increaseNum(){
    this.num++;
    notifyListeners();
  }

  void decreaseNum(){
    this.num--;
    notifyListeners();
  }
}