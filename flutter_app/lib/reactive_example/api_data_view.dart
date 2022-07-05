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
    final _scrollController = ScrollController(
      initialScrollOffset: 1.0,
      keepScrollOffset: true,
    );
    const _scrollPhysics = ClampingScrollPhysics();
    return Scaffold(
      appBar: AppBar(),
      body:  ((viewModel as ApiDataViewModel).values.isNotEmpty)
      ? ListView.separated(
        reverse: false,
        primary: false,
        shrinkWrap: true,
        controller: _scrollController,
        physics: _scrollPhysics,
        itemCount: viewModel.values.length,
        itemBuilder: (BuildContext listViewBuildContext,int listViewItemIndex,){
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent,);
          });
          return ListTile(
            title: Text(viewModel.values[listViewItemIndex].toString(),),
          );
        },
        separatorBuilder: (BuildContext listViewBuildContext, int listViewItemIndex,){
          return const Divider(thickness: 1.0, height: 8.0, color: Colors.black,);
        },
      )
      : const ListTile(
        title: Text('No Data',),
      )
    );
  }

  @override
  ChangeNotifier viewModelBuilder(BuildContext context,) {
    return ApiDataViewModel();
  }


}