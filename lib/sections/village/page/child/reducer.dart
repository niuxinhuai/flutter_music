import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoWaterfallState>? buildReducer() {
  return asReducer(
    <Object, Reducer<VideoWaterfallState>>{
      VideoWaterfallAction.action: _onAction,
      VideoWaterfallAction.didFetchData: _didFetchData,
      VideoWaterfallAction.didError: _didError,
      VideoWaterfallAction.didRefresh: _didRefresh,
      VideoWaterfallAction.didLoading: _didLoading,
    },
  );
}

VideoWaterfallState _onAction(VideoWaterfallState state, Action action) {
  final VideoWaterfallState newState = state.clone();
  return newState;
}

VideoWaterfallState _didFetchData(VideoWaterfallState state, Action action) {
  final VideoWaterfallState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = action.payload;
  if (newState.wrap?.code != null && newState.wrap?.code == 200) {
    newState.offset += 1;
    newState.items = [];
    newState.items = newState.wrap?.datas;
  }

  return newState;
}

VideoWaterfallState _didRefresh(VideoWaterfallState state, Action action) {
  final VideoWaterfallState newState = state.clone();
  newState.wrap = action.payload;
  if (newState.wrap?.code != null && newState.wrap?.code == 200) {
    newState.offset += 1;
    newState.items = [];
    newState.items = newState.wrap?.datas;
  }
  newState.refreshController?.refreshCompleted();
  return newState;
}

VideoWaterfallState _didLoading(VideoWaterfallState state, Action action) {
  final VideoWaterfallState newState = state.clone();
  newState.wrap = action.payload;
  if (newState.wrap?.code != null && newState.wrap?.code == 200) {
    newState.offset += 1;
    newState.items!.addAll(newState.wrap!.datas!);
  }
  if (newState.wrap?.hasmore != null && newState.wrap?.hasmore == true) {
    newState.refreshController?.loadComplete();
  } else {
    newState.refreshController?.loadNoData();
  }
  return newState;
}

VideoWaterfallState _didError(VideoWaterfallState state, Action action) {
  final VideoWaterfallState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}
