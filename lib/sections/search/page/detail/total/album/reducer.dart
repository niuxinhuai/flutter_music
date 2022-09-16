import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AlbumState>? buildReducer() {
  return asReducer(
    <Object, Reducer<AlbumState>>{
      AlbumAction.action: _onAction,
    },
  );
}

AlbumState _onAction(AlbumState state, Action action) {
  final AlbumState newState = state.clone();
  return newState;
}
