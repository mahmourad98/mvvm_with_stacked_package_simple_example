import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AsyncViewModel extends BaseViewModel{
  List<int> values = <int>[];

  final StreamController _streamController = StreamController();

  Stream<int> generateStream(int x,) async*{
    var result = await Future<int>.delayed(const Duration(seconds: 1,), () { return x*2;},);
    log('result = $result');
    yield result;
    yield* generateStream(result,);
  }

  void intialize(int x,){
    _streamController.addStream(generateStream(x,),).asStream();
    _streamController.stream.listen(
      (dynamic value,){
        values.add(value as int);
        notifyListeners();
      }
    );
  }
}