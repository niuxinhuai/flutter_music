import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/podcast/page/catelist/child/page.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<CatelistState>? buildReducer() {
  return asReducer(
    <Object, Reducer<CatelistState>>{
      CatelistAction.action: _onAction,
      CatelistAction.didError: _didError,
      CatelistAction.didFetchData: _didFetchData,
    },
  );
}

CatelistState _didError(CatelistState state, Action action) {
  final CatelistState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

CatelistState _didFetchData(CatelistState state, Action action) {
  final CatelistState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = action.payload;
  if (newState.wrap?.categories != null &&
      newState.wrap?.categories?.isNotEmpty == true) {
    newState.titles = newState.wrap!.categories!.map((e) => e.name!).toList();
    newState.widgets = newState.wrap!.categories!
        .map((e) =>
            CatelistRecommendPage().buildPage({"id": e.id, "name": e.name}))
        .toList();

    newState.initialIndex = newState.wrap!.categories!
        .indexWhere((element) => element.id == newState.id);
  }
  return newState;
}

CatelistState _onAction(CatelistState state, Action action) {
  final CatelistState newState = state.clone();
  return newState;
}
