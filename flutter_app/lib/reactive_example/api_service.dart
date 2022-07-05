import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ApiRepository with ReactiveServiceMixin{
  String apiUrl = "https://62c2d2a5876c4700f52f84f8.mockapi.io/mahmoud";
  //List<Map<String, String>> apiResults = <Map<String, String>>[];
  final ReactiveValue<List<Map<String, String>>> apiResults = ReactiveValue<List<Map<String, String>>>(<Map<String, String>>[]);
  //get apiResults => _apiResults.value;
  StreamSubscription? streamSubscription;


  ApiRepository(){
    listenToReactiveValues([apiResults,],);
  }

  getDataFromApi(int x,){
    streamSubscription = generateStream(x,).listen(
      (dynamic value,){
        apiResults.value.add(value as Map<String, String>,);
        notifyListeners();
      },
    );
  }

  Stream<Map<String, String>> generateStream(int x,) async*{
    if(x <= 50){
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
  }

  void dispose() async{
    await streamSubscription!.cancel();
  }
}