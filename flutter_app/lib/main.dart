import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/reactive_example/api_service.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';

main(){
  AppRoot.init();
}


class AppRoot{
  static const _myApp = MyApp();
  static final getIt = GetIt.instance;

  AppRoot.init(){
    HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    getItLocatorSetup();
    runApp(_myApp,);
  }

  void getItLocatorSetup() {
    getIt.registerLazySingleton<ApiRepository>(() => ApiRepository(),);
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context,){
    return super.createHttpClient(context,)
      ..badCertificateCallback = (X509Certificate cert, String host, int port,)=> true;
  }
}

