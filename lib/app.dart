import 'package:flutter/material.dart';
import 'home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? getState(BuildContext buildContext,) {
    final _MyAppState? myAppState = buildContext.findAncestorStateOfType<_MyAppState>();
    return myAppState;
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}