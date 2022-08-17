import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<LeaderboardState>? buildReducer() {
  return asReducer(
    <Object, Reducer<LeaderboardState>>{
      LeaderboardAction.action: _onAction,
      LeaderboardAction.didFetchData: _didFetchData,
      LeaderboardAction.didError: _didError,
    },
  );
}

LeaderboardState _didFetchData(LeaderboardState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final LeaderboardState newState = state.clone();
  newState.wrap = tuple2.i0;
  newState.sections = tuple2.i1;
  newState.loadingState = LoadingState.success;
  return newState;
}

LeaderboardState _didError(LeaderboardState state, Action action) {
  final LeaderboardState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

LeaderboardState _onAction(LeaderboardState state, Action action) {
  final LeaderboardState newState = state.clone();
  return newState;
}
