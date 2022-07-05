import 'package:flutter/material.dart';
import 'package:flutter_app/reactive_example/api_data_view.dart';
import 'async_example/async_view.dart';
import 'counter_example/counter_view.dart';

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
                    MaterialPageRoute(
                      builder: (_) => const CounterScreen(),
                    ),
                  );
                },
                child: const Text('To Counter Page',),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context,).push(
                    MaterialPageRoute(
                      builder: (_) => const AsyncScreen(),
                    ),
                  );
                },
                child: const Text('To Async Page',),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context,).push(
                    MaterialPageRoute(
                      builder: (_) => const ApiDataView(),
                    ),
                  );
                },
                child: const Text('To Api Page',),
              ),
            ],
          )
      ),
    );
  }
}