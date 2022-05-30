import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ApiRepository with ReactiveServiceMixin{
  String apiUrl = "https://62c2d2a5876c4700f52f84f8.mockapi.io/mahmoud";
  final ReactiveValue<Map<String, String>?> apiResult = ReactiveValue(null,);
  Map<String, String>? get apiResultValue => apiResult.value;
  StreamSubscription? streamSubscription;


  ApiRepository(){
    listenToReactiveValues([apiResult,],);
  }

  getDataFromApi(int x,){
    streamSubscription = generateStream(x,).listen(
          (dynamic value,){
        apiResult.value = value as Map<String, String>;
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
      log('result: $result',);
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
    apiResult.value = null;
    log('stream was disposed');
    return;
  }
}