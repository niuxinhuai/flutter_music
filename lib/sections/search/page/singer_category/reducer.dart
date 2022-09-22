import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SingerCategoryState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SingerCategoryState>>{
      SingerCategoryAction.action: _onAction,
      SingerCategoryAction.didFetchData: _didFetchData,
      SingerCategoryAction.didError: _didError,
      SingerCategoryAction.didRefresh: _didRefresh,
    },
  );
}

SingerCategoryState _didFetchData(SingerCategoryState state, Action action) {
  final Tuple3 tuple3 = action.payload;
  final SingerCategoryState newState = state.clone();
  newState.areaModels = tuple3.i0;
  newState.typeModels = tuple3.i1;
  newState.wrap = tuple3.i2;
  newState.loadingState = LoadingState.success;
  return newState;
}

SingerCategoryState _didError(SingerCategoryState state, Action action) {
  final SingerCategoryState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

SingerCategoryState _didRefresh(SingerCategoryState state, Action action) {
  final SingerCategoryState newState = state.clone();
  return newState;
}

SingerCategoryState _onAction(SingerCategoryState state, Action action) {
  final SingerCategoryState newState = state.clone();
  return newState;
}
