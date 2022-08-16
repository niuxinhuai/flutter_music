import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecommendListState>? buildReducer() {
  return asReducer(
    <Object, Reducer<RecommendListState>>{
      RecommendListAction.action: _onAction,
      RecommendListAction.didFetchData: _didFetchData,
    },
  );
}

RecommendListState _didFetchData(RecommendListState state, Action action) {
  final RecommendListState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = action.payload;
  return newState;
}

RecommendListState _onAction(RecommendListState state, Action action) {
  final RecommendListState newState = state.clone();
  return newState;
}
