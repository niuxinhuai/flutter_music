import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchSimpleState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchSimpleState>>{
      SearchSimpleAction.action: _onAction,
      SearchSimpleAction.didFetchData: _didFetchData,
      SearchSimpleAction.didFetchVoiceData: _didFetchVoiceData,
    },
  );
}

SearchSimpleState _didFetchData(SearchSimpleState state, Action action) {
  final SearchSimpleState newState = state.clone();
  newState.wrap = action.payload;
  newState.loadingState = LoadingState.success;
  return newState;
}

SearchSimpleState _didFetchVoiceData(SearchSimpleState state, Action action) {
  final SearchSimpleState newState = state.clone();
  newState.voiceWrap = action.payload;
  newState.loadingState = LoadingState.success;
  return newState;
}

SearchSimpleState _onAction(SearchSimpleState state, Action action) {
  final SearchSimpleState newState = state.clone();
  return newState;
}
