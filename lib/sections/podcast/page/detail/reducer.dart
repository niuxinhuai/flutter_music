import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<PodcastDetailState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PodcastDetailState>>{
      PodcastDetailAction.action: _onAction,
      PodcastDetailAction.didError: _didError,
      PodcastDetailAction.didFetchData: _didFetchData,
    },
  );
}

PodcastDetailState _didFetchData(PodcastDetailState state, Action action) {
  final Tuple2 tuple2 = action.payload;
  final PodcastDetailState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.detailWrap = tuple2.i0;
  newState.items = tuple2.i1;
  return newState;
}

PodcastDetailState _didError(PodcastDetailState state, Action action) {
  final PodcastDetailState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

PodcastDetailState _onAction(PodcastDetailState state, Action action) {
  final PodcastDetailState newState = state.clone();
  return newState;
}
