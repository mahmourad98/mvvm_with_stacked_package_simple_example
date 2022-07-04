import 'package:flutter/material.dart';
import 'app.dart';

main(){
  AppRoot.init();
}


class AppRoot{
  static const _myApp = MyApp();

  AppRoot.init(){
    WidgetsFlutterBinding.ensureInitialized();
    runApp(_myApp,);
  }
}