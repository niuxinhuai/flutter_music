import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AudioPlayerState>? buildReducer() {
  return asReducer(
    <Object, Reducer<AudioPlayerState>>{
      AudioPlayerAction.action: _onAction,
      AudioPlayerAction.didFetchData: _didFetchData,
      AudioPlayerAction.didTapShowLyric: _didTapShowLyric,
    },
  );
}

AudioPlayerState _didFetchData(AudioPlayerState state, Action action) {
  final Tuple2 tuple2 = action.payload;
  final AudioPlayerState newState = state.clone();
  newState.songWrap = tuple2.i0;
  newState.songLyric = tuple2.i1;
  if (newState.songWrap?.data?.isNotEmpty == true) {
    newState.url = newState.songWrap?.data?.first.url;
  }
  return newState;
}

AudioPlayerState _didTapShowLyric(AudioPlayerState state, Action action) {
  final AudioPlayerState newState = state.clone();
  newState.showLyric = !newState.showLyric!;
  return newState;
}

AudioPlayerState _onAction(AudioPlayerState state, Action action) {
  final AudioPlayerState newState = state.clone();
  return newState;
}
