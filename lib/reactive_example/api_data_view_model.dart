import 'dart:developer';
import 'package:flutter_app/main.dart';
import 'package:stacked/stacked.dart';
import 'api_service.dart';


class ApiDataViewModel extends ReactiveViewModel{
  final apiRepository = AppRoot.getIt.get<ApiRepository>();
  List<Map<String, String>> get values => apiRepository.apiResultValue;

  ApiDataViewModel();

  void getResults(){
    log('get results is intialized',);
    apiRepository.getDataFromApi(1, notifyListeners,);
    // apiRepository.apiResult.onChange.listen(
    //   (event) {
    //     if(event.neu != null){
    //       values.add(event.neu!);
    //       notifyListeners();
    //     }
    //   }
    // );
  }

  @override
  void dispose() {
    apiRepository.dispose();
    values.clear();
    notifyListeners();
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [apiRepository,];
}