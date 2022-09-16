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
  final SearchResultTotalState newState = state.clone();
  newState.loadingState = LoadingState.success;
  newState.wrap = action.payload;
  newState.songState?.item = newState.wrap?.result?.song;
  newState.playListState?.item = newState.wrap?.result?.playList;
  newState.artistState?.item = newState.wrap?.result?.artist;
  newState.albumState?.item = newState.wrap?.result?.album;
  newState.simQueryState?.item = newState.wrap?.result?.sim_query;
  newState.userState?.item = newState.wrap?.result?.user;
  return newState;
}

SearchResultTotalState _onAction(SearchResultTotalState state, Action action) {
  final SearchResultTotalState newState = state.clone();
  return newState;
}
