import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AudioPlayerState>? buildReducer() {
  return asReducer(<Object, Reducer<AudioPlayerState>>{
    AudioPlayerAction.action: _onAction,
    AudioPlayerAction.didFetchData: _didFetchData,
    AudioPlayerAction.didTapShowLyric: _didTapShowLyric,
    AudioPlayerAction.didUpdatePlaybackUrl: _didUpdatePlaybackUrl,
  });
}

AudioPlayerState _didFetchData(AudioPlayerState state, Action action) {
  final Tuple3 tuple3 = action.payload;
  final AudioPlayerState newState = state.clone();
  newState.songWrap = tuple3.i0;
  newState.songLyric = tuple3.i1;
  if (newState.songWrap?.data?.isNotEmpty == true) {
    newState.sourceUrl = newState.songWrap?.data?.first.url;
    newState.url = tuple3.i2 ?? newState.sourceUrl;
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

AudioPlayerState _didUpdatePlaybackUrl(AudioPlayerState state, Action action) {
  final AudioPlayerState newState = state.clone();
  newState.url = action.payload;
  return newState;
}
