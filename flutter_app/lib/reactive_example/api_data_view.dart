import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'api_data_view_model.dart';

class ApiDataView extends ViewModelBuilderWidget{
  const ApiDataView({Key? key,}) : super(key: key,);

  @override
  bool get reactive => true;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady(ChangeNotifier viewModel,) {
    (viewModel as ApiDataViewModel).getResults();
  }

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        reverse: false,
        primary: false,
        shrinkWrap: true,
        itemCount: (viewModel as ApiDataViewModel).values.length,
        itemBuilder: (BuildContext listViewBuildContext,int listViewItemIndex,){
          return ListTile(
            title: Text(viewModel.values[listViewItemIndex].toString(),),
          );
        },
        separatorBuilder: (BuildContext listViewBuildContext, int listViewItemIndex,){
          return const Divider(thickness: 1.0, height: 8.0, color: Colors.black,);
        },
      ),
    );
  }

  @override
  ChangeNotifier viewModelBuilder(BuildContext context,) {
    return ApiDataViewModel();
  }


}