import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ApiRepository with ReactiveServiceMixin{
  String apiUrl = "https://62c2d2a5876c4700f52f84f8.mockapi.io/mahmoud";
  final ReactiveValue<List<Map<String, String>>> _apiResult = ReactiveValue([],);
  List<Map<String, String>> get apiResultValue => _apiResult.value;
  StreamSubscription? streamSubscription;


  ApiRepository(){
    listenToReactiveValues([_apiResult,],);
  }

  getDataFromApi(int x, onChange,){
    streamSubscription = generateStream(x,).listen(
      (dynamic value,){
        final list = _apiResult.value;
        list.add(value,);
        _apiResult.value = list;
        onChange();
      },
    );
  }

  Stream<Map<String, String>> generateStream(int x,) async*{
    if(!streamSubscription!.isPaused && x <= 50){
      var response = await http.get(
        Uri.parse(apiUrl + "/" + "$x",),
      );
      //log('response: $response',);
      var decodedResponse = jsonDecode(response.body,) as Map;
      //log('decoded response: $decodedResponse',);
      Map<String, String> result = {
        'id' : decodedResponse['id'].toString(),
        'name' : decodedResponse['name'].toString(),
        'avatar' : decodedResponse['avatar'].toString(),
      };
      //log('result: $result',);
      await Future.delayed(const Duration(seconds: 1),);
      yield result;
      yield* generateStream((x + 1),);
    }
    else{
      dispose();
    }
  }

  void dispose() async{
    await streamSubscription!.cancel();
    _apiResult.value = [];
    log('stream was disposed');
    return;
  }
}