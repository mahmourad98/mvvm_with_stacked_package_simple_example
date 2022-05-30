import 'dart:developer';
import 'package:stacked/stacked.dart';
import '../main.dart';
import 'api_service.dart';


class ApiDataViewModel extends ReactiveViewModel{
  final apiRepository = AppRoot.getIt.get<ApiRepository>();
  final List<Map<String, String>> values = <Map<String, String>>[];

  ApiDataViewModel();

  void getResults(){
    log('get results is intialized',);
    apiRepository.getDataFromApi(1,);
    apiRepository.apiResult.onChange.listen(
            (event) {
          if(event.neu != null){
            values.add(event.neu!);
            notifyListeners();
          }
        }
    );
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