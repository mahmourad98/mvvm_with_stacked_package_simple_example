import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled03/user_bloc/user_bloc.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var values = [];
  var searchValues = [];

  @override
  Widget build(BuildContext buildContext,) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48,),
        child: AppBar(
          title: const Text('Flutter Demo Project 03',),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, currentState){
                  if(currentState is UserLoadingState){
                    return Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(color: Theme.of(buildContext).primaryColor,),
                    );
                  }
                  else if(currentState is UserLoadedState){
                    return Text(
                      currentState.user.toString(),
                    );
                  }
                  else if(currentState is UserLoadedFailureState){
                    return Text(
                      currentState.errorMessage,
                    );
                  }
                  else{
                    return Text('no user till now\n${(currentState as UserInitialState).user.toString()}');
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              BlocProvider.of<UserBloc>(buildContext,).add(const LoadUserEvent(1),);
            },
            child: const Text('Push Me'),
          ),
        ],
      ),
    );
  }

}