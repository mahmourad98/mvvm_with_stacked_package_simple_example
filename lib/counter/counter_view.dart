import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'counter_view_model.dart';

class CounterScreen extends StatelessWidget{
  const CounterScreen({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          CounterView(),
          CounterViewSecond(),
        ],
      ),
    );
  }
}

class CounterView extends ViewModelBuilderWidget<CounterViewModel> {
  const CounterView({Key? key}) : super(key: key);

  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => false;

  @override
  bool get disposeViewModel => true;

  @override
  Widget builder(BuildContext context, CounterViewModel viewModel, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            viewModel.num.toString(),
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            DecreaseButtonWidget(),
            IncreaseButtonWidget(),
          ],
        ),
      ],
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) {
    return CounterViewModel();
  }
}

class CounterViewSecond extends ViewModelBuilderWidget<CounterViewModel> {
  const CounterViewSecond({Key? key,}) : super(key: key,);

  @override
  bool get reactive => true;

  @override
  bool get createNewModelOnInsert => false;

  @override
  bool get disposeViewModel => true;

  @override
  Widget builder(BuildContext context, CounterViewModel viewModel, Widget? child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            viewModel.num.toString(),
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            DecreaseButtonWidget(),
            IncreaseButtonWidget(),
          ],
        ),
      ],
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) {
    return CounterViewModel();
  }
}

class IncreaseButtonWidget extends ViewModelWidget<CounterViewModel>{
  const IncreaseButtonWidget({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context, CounterViewModel viewModel,) {
    return IconButton(onPressed: (){viewModel.increaseNum();}, icon: const Icon(Icons.add,),);
  }
}

class DecreaseButtonWidget extends ViewModelWidget<CounterViewModel>{
  const DecreaseButtonWidget({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context, CounterViewModel viewModel,) {
    return IconButton(onPressed: (){viewModel.decreaseNum();}, icon: const Icon(Icons.remove,),);
  }
}
