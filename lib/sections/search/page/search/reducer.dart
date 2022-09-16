import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/sections/search/models/search_recommend.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchAction.action: _onAction,
      SearchAction.didFetchData: _didFetchData,
    },
  );
}

SearchState _didFetchData(SearchState state, Action action) {
  final Tuple3 tuple3 = action.payload;
  final SearchHotWrap hotWrap = tuple3.i0;
  final SearchRecommendWrap recommendWrap = tuple3.i1;
  final List<UserSearchLog> logs = tuple3.i2;
  final SearchState newState = state.clone();
  newState.historyState?.logs = logs;

  newState.recommendState?.recommendWrap = recommendWrap;

  newState.hotState?.wrap = hotWrap;

  newState.loadingState = LoadingState.success;
  return newState;
}

SearchState _onAction(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState;
}
