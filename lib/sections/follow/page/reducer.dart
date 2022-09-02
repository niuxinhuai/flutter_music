import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyFocusState>? buildReducer() {
  return asReducer(
    <Object, Reducer<MyFocusState>>{
      MyFocusAction.action: _onAction,
      MyFocusAction.didRefresh: _didRefresh,
      MyFocusAction.didRefreshImage: _didRefreshImage,
    },
  );
}

MyFocusState _didRefresh(MyFocusState state, Action action) {
  final MyFocusState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.pdfFilePath = action.payload;
  return newState;
}

MyFocusState _didRefreshImage(MyFocusState state, Action action) {
  final MyFocusState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.page++;
  List<int> list = List.generate(10 * newState.page, (index) => index + 1);
  if (list.length > newState.max) {
    list = list.sublist(0, newState.max);
  }
  newState.list = list;
  return newState;
}

MyFocusState _onAction(MyFocusState state, Action action) {
  final MyFocusState newState = state.clone();
  return newState;
}
