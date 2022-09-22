import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/models/db/db_model.dart';
import 'package:flutter_music/sections/search/models/search_hot.dart';
import 'package:flutter_music/sections/search/models/search_hot_topic.dart';
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
  final Tuple4 tuple4 = action.payload;
  final SearchHotWrap hotWrap = tuple4.i0;
  final SearchRecommendWrap recommendWrap = tuple4.i1;
  final List<UserSearchLog> logs = tuple4.i2;
  final SearchHotTopicWrap topicWrap = tuple4.i3;
  final SearchState newState = state.clone();
  newState.historyState?.logs = logs;

  newState.recommendState?.recommendWrap = recommendWrap;

  newState.hotState?.wrap = hotWrap;

  newState.topicState?.wrap = topicWrap;

  newState.loadingState = LoadingState.success;
  return newState;
}

SearchState _onAction(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState;
}
