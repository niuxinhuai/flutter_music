import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistState>>{
      PlaylistAction.action: _onAction,
    },
  );
}

PlaylistState _onAction(PlaylistState state, Action action) {
  final PlaylistState newState = state.clone();
  return newState;
}
