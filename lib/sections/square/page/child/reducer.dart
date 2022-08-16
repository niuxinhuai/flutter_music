import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/playlist.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SquareChildState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SquareChildState>>{
      SquareChildAction.action: _onAction,
      SquareChildAction.didError: _didError,
      SquareChildAction.didFetchData: _didFetchData,
      SquareChildAction.didLoading: _didLoading,
      SquareChildAction.didFilterAndRefresh: _didFilterAndRefresh,
    },
  );
}

SquareChildState _didError(SquareChildState state, Action action) {
  final SquareChildState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

SquareChildState _didFetchData(SquareChildState state, Action action) {
  final PlaylistSquareWrap squareWrap = action.payload;
  final SquareChildState newState = state.clone();

  newState.squareWrap = squareWrap;
  newState.loadingState = LoadingState.success;
  if (newState.squareWrap?.playlists != null &&
      newState.squareWrap?.playlists?.isNotEmpty == true) {
    newState.stages!.addAll(newState.squareWrap!.playlists!);
  }
  newState.offset += newState.limit!;
  return newState;
}

SquareChildState _didLoading(SquareChildState state, Action action) {
  final PlaylistSquareWrap wrap = action.payload;
  final SquareChildState newState = state.clone();
  if (wrap.playlists != null && wrap.playlists?.isNotEmpty == true) {
    newState.stages!.addAll(wrap.playlists!);
    newState.refreshController!.loadComplete();
    newState.offset += newState.limit!;
  } else {
    newState.refreshController!.loadNoData();
    newState.loadNoMoreData = true;
  }
  return newState;
}

SquareChildState _didFilterAndRefresh(SquareChildState state, Action action) {
  final SquareChildState newState = state.clone();

  ///初始化所有状态
  newState.stages?.clear();
  newState.loadingState = LoadingState.isLoading;
  newState.offset = 0;
  return newState;
}

SquareChildState _onAction(SquareChildState state, Action action) {
  final SquareChildState newState = state.clone();
  return newState;
}
