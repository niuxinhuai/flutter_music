import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/catlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlaylistSquareState>? buildReducer() {
  return asReducer(
    <Object, Reducer<PlaylistSquareState>>{
      PlaylistSquareAction.action: _onAction,
      PlaylistSquareAction.didFeatchData: _didFeatchData,
    },
  );
}

PlaylistSquareState _didFeatchData(PlaylistSquareState state, Action action) {
  final List<CatlistSubItem> items = action.payload;
  final PlaylistSquareState newState = state.clone();
  newState.items?.clear();
  newState.items = items;
  newState.loadingState = LoadingState.success;
  return newState;
}

PlaylistSquareState _onAction(PlaylistSquareState state, Action action) {
  final PlaylistSquareState newState = state.clone();
  return newState;
}
