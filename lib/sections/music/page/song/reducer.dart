import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AudioPlayerState>? buildReducer() {
  return asReducer(
    <Object, Reducer<AudioPlayerState>>{
      AudioPlayerAction.action: _onAction,
    },
  );
}

AudioPlayerState _onAction(AudioPlayerState state, Action action) {
  final AudioPlayerState newState = state.clone();
  return newState;
}
