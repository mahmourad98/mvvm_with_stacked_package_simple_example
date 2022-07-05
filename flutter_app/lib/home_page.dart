import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext buildContext,) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: (){

                },
                child: const Text('To Counter Page',),
              ),
              TextButton(
                onPressed: (){

                },
                child: const Text('To Async Page',),
              ),
              TextButton(
                onPressed: (){

                },
                child: const Text('To Api Page',),
              ),
            ],
          )
      ),
    );
  }
}