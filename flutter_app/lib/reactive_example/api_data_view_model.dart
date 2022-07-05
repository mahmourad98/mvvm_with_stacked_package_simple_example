import 'dart:developer';
import 'package:flutter_app/main.dart';
import 'package:stacked/stacked.dart';
import 'api_service.dart';


class ApiDataViewModel extends ReactiveViewModel{
  var apiRepository = AppRoot.getIt.get<ApiRepository>();
  List<Map<String, String>> values = <Map<String, String>>[];

  void getResults(){
    log('get results is intialized',);
    apiRepository.getDataFromApi(1,);
    values = apiRepository.apiResults.value;
  }

  @override
  void dispose() {
    apiRepository.dispose();
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [apiRepository,];
}