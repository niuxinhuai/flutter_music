import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<CatelistRecommendState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CatelistRecommendState>>{
      CatelistRecommendAction.action: _onAction,
      CatelistRecommendAction.didError: _didError,
      CatelistRecommendAction.didFetchData: _didFetchData,
    },
  );
}

CatelistRecommendState _didError(CatelistRecommendState state, Action action) {
  final CatelistRecommendState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

CatelistRecommendState _didFetchData(
    CatelistRecommendState state, Action action) {
  final CatelistRecommendState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = action.payload;
  if (newState.wrap?.djRadios != null &&
      newState.wrap?.djRadios?.isNotEmpty == true) {
    newState.items = newState.wrap!.djRadios!;
  }
  return newState;
}

CatelistRecommendState _onAction(CatelistRecommendState state, Action action) {
  final CatelistRecommendState newState = state.clone();
  return newState;
}
