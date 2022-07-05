import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'async_view_model.dart';

class AsyncScreen extends StatelessWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AsyncViewModel>.nonReactive(
      viewModelBuilder: () => AsyncViewModel(),
      disposeViewModel: false,
      onModelReady: (AsyncViewModel asyncViewModel,) => asyncViewModel.intialize(1),
      fireOnModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      builder: (BuildContext buildContext, AsyncViewModel asyncViewModel, Widget? childWidget,){
        return Scaffold(
          appBar: AppBar(),
          body: const AsyncScreenListView(),
        );
      },
    );
  }
}

class AsyncScreenListView extends ViewModelWidget<AsyncViewModel> {
  const AsyncScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AsyncViewModel viewModel,) {
    final _scrollController = ScrollController(
      initialScrollOffset: 1.0,
      keepScrollOffset: true,
    );
    const _scrollPhysics = ClampingScrollPhysics();
    if (viewModel.values.isNotEmpty) {
      final listView = ListView.separated(
        reverse: false,
        primary: false,
        shrinkWrap: true,
        controller: _scrollController,
        physics: _scrollPhysics,
        itemCount: viewModel.values.length,
        itemBuilder: (BuildContext listViewBuildContext,int listViewItemIndex,){
          if (listViewItemIndex >= 0) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            });
          }
          return ListTile(
            title: Text(viewModel.values[listViewItemIndex].toString(),),
          );
        },
        separatorBuilder: (BuildContext listViewBuildContext, int listViewItemIndex,){
          return const Divider(thickness: 1.0, height: 8.0, color: Colors.black,);
        },
      );
      return listView;
    }
    else{
      return const ListTile(
        title: Text('No Data',),
      );
    }
  }
}
