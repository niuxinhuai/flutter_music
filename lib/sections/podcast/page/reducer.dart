import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PodcastState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PodcastState>>{
      PodcastAction.action: _onAction,
    },
  );
}

PodcastState _onAction(PodcastState state, Action action) {
  final PodcastState newState = state.clone();
  return newState;
}
