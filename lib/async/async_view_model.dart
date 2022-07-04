import 'package:stacked/stacked.dart';

class AsyncViewModel extends StreamViewModel<int>{
  List<int> values = <int>[];

  @override
  Stream<int> get stream => generateStream(1,);

  Stream<int> generateStream(int x,) async*{
    var result = await Future<int>.delayed(const Duration(seconds: 1,), () { return x*2;},);
    yield result;
    yield* generateStream(result,);
  }

  @override
  void onData(int? data) {
    values.add(data ?? 0);
  }
}