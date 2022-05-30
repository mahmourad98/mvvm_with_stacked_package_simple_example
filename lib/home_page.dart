import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled03/api_list/api_data_view.dart';
import 'async/async_view.dart';
import 'counter/counter_view.dart';

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
                  Navigator.of(context,).push(
                    CupertinoPageRoute(
                      builder: (_) => const CounterScreen(),
                    ),
                  );
                },
                child: const Text('To Counter Page',),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context,).push(
                    CupertinoPageRoute(
                      builder: (_) => const AsyncScreen(),
                    ),
                  );
                },
                child: const Text('To Async Page',),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context,).push(
                    CupertinoPageRoute(
                      builder: (_) => const ApiDataView(),
                    ),
                  );
                },
                child: const Text('To Api Page',),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context,).push(
                    CupertinoPageRoute(
                      builder: (_) => const ApiDataView(),
                    ),
                  );
                },
                child: const Text('To Reusable Components Page',),
              ),
            ],
          )
      ),
    );
  }
}