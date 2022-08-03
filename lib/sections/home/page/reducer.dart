import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/home/models/home.dart';
import 'package:flutter_music/utils/typeUtils.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeMusicState>? buildReducer() {
  return asReducer(
    <Object, Reducer<HomeMusicState>>{
      HomeMusicAction.action: _onAction,
      HomeMusicAction.didFetchData: _didFetchData,
      HomeMusicAction.didRefresh: _didRefresh,
    },
  );
}

HomeMusicState _onAction(HomeMusicState state, Action action) {
  final HomeMusicState newState = state.clone();
  return newState;
}

HomeMusicState _didFetchData(HomeMusicState state, Action action) {
  final HomeMusicWrap? wrap = action.payload;
  final HomeMusicState newState = state.clone();
  newState.musicWrap = wrap;
  _resetDataSource(newState);
  newState.loadingState = LoadingState.success;
  return newState;
}

HomeMusicState _didRefresh(HomeMusicState state, Action action) {
  final HomeMusicWrap? wrap = action.payload;
  final HomeMusicState newState = state.clone();
  newState.musicWrap = wrap;
  newState.refreshController!.refreshCompleted();
  _resetDataSource(newState);
  return newState;
}

void _resetDataSource(HomeMusicState state) {
  if (state.musicWrap?.data?.blocks != null &&
      state.musicWrap?.data?.blocks?.isNotEmpty == true) {
    MusicItem customItem = MusicItem();
    customItem.blockCode = HomeBlockCodeUtils.custom;
    customItem.dislikeShowType = 0;
    state.musicWrap!.data!.blocks!.insert(1, customItem);
    for (int i = 0; i < state.musicWrap!.data!.blocks!.length; ++i) {
      MusicItem item = state.musicWrap!.data!.blocks![i];
      if (item.dislikeShowType == 1) {
        state.musicWrap!.data!.blocks!.remove(item);
        i--;
      }
    }
  }
}
