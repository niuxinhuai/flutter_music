import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<PodcastState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PodcastState>>{
      PodcastAction.action: _onAction,
      PodcastAction.didError: _didError,
      PodcastAction.didFeatchData: _didFeatchData,
    },
  );
}

PodcastState _onAction(PodcastState state, Action action) {
  final PodcastState newState = state.clone();
  return newState;
}

PodcastState _didError(PodcastState state, Action action) {
  final PodcastState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

PodcastState _didFeatchData(PodcastState state, Action action) {
  Tuple3 tuple3 = action.payload;
  final PodcastState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.podcastWrap = tuple3.i0;
  newState.bannerWrap = tuple3.i1;
  newState.personalizeWrap = tuple3.i2;
  return newState;
}
