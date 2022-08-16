import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistDetailState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistDetailState>>{
      PlaylistDetailAction.action: _onAction,
      PlaylistDetailAction.didError: _didError,
      PlaylistDetailAction.didFetchData: _didFetchData,
    },
  );
}

PlaylistDetailState _didError(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

PlaylistDetailState _didFetchData(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  newState.squareWrap = action.payload;
  newState.loadingState = LoadingState.success;
  return newState;
}

PlaylistDetailState _onAction(PlaylistDetailState state, Action action) {
  final PlaylistDetailState newState = state.clone();
  return newState;
}
