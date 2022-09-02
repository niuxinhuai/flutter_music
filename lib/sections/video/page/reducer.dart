import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<VideoDetailState>? buildReducer() {
  return asReducer(
    <Object, Reducer<VideoDetailState>>{
      VideoDetailAction.action: _onAction,
      VideoDetailAction.didError: _didError,
      VideoDetailAction.didFetchData: _didFetchData,
      VideoDetailAction.didPlayerProgress: _didPlayerProgress,
    },
  );
}

VideoDetailState _didFetchData(VideoDetailState state, Action action) {
  Tuple3 tuple3 = action.payload;
  final VideoDetailState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.detailWrap = tuple3.i0;
  newState.urlWrap = tuple3.i1;
  newState.infoWrap = tuple3.i2;
  String? url = newState.urlWrap?.urls?.first.url;

  ///url被转义的特殊字符处理
  if (url != null && url.contains("amp;")) {
    url = url.replaceAll("amp;", "");
  }
  newState.url = url;
  return newState;
}

VideoDetailState _didPlayerProgress(VideoDetailState state, Action action) {
  Tuple2 tuple2 = action.payload;
  final VideoDetailState newState = state.clone();
  newState.progress = tuple2.i0;
  newState.position = tuple2.i1;
  return newState;
}

VideoDetailState _didError(VideoDetailState state, Action action) {
  final VideoDetailState newState = state.clone();
  newState.loadingState = LoadingState.error;
  return newState;
}

VideoDetailState _onAction(VideoDetailState state, Action action) {
  final VideoDetailState newState = state.clone();
  return newState;
}
