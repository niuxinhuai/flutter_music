import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchHistoryState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchHistoryState>>{
      SearchHistoryAction.action: _onAction,
      SearchHistoryAction.didFetchData: _didFetchData,
    },
  );
}

SearchHistoryState _didFetchData(SearchHistoryState state, Action action) {
//  print(">>>>>>>>>>走了成功了");
  final SearchHistoryState newState = state.clone();
  newState.logs = action.payload;
  return newState;
}

SearchHistoryState _onAction(SearchHistoryState state, Action action) {
  final SearchHistoryState newState = state.clone();
  return newState;
}
