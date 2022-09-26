import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchResultTotalState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SearchResultTotalState>>{
      SearchResultTotalAction.action: _onAction,
      SearchResultTotalAction.didFetchData: _didFetchData,
    },
  );
}

SearchResultTotalState _didFetchData(
    SearchResultTotalState state, Action action) {
  final Tuple2 tuple2 = action.payload;
  final SearchResultTotalState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = tuple2.i0;
  newState.multimatchWrap = tuple2.i1;

  newState.songState?.item = newState.wrap?.result?.song;
  newState.songState?.searchkey = newState.text;

  newState.playListState?.item = newState.wrap?.result?.playList;
  newState.playListState?.searchKey = newState.text;

  newState.artistState?.item = newState.wrap?.result?.artist;

  newState.albumState?.item = newState.wrap?.result?.album;
  newState.albumState?.searchKey = newState.text;

  newState.simQueryState?.item = newState.wrap?.result?.sim_query;

  newState.userState?.item = newState.wrap?.result?.user;
  newState.userState?.searchKey = newState.text;

  return newState;
}

SearchResultTotalState _onAction(SearchResultTotalState state, Action action) {
  final SearchResultTotalState newState = state.clone();
  return newState;
}
