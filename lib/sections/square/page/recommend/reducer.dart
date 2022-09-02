import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'package:flutter_music/widgets/loading_wrap.dart';

import 'action.dart';
import 'state.dart';

Reducer<SquareRecommendState>? buildReducer() {
  return asReducer(
    <Object, Reducer<SquareRecommendState>>{
      SquareRecommendAction.action: _onAction,
      SquareRecommendAction.didFetchData: _didFetchData,
    },
  );
}

SquareRecommendState _didFetchData(SquareRecommendState state, Action action) {
  final Tuple2 tuple2 = action.payload;
  final SquareRecommendState newState = state.clone();
  newState.everyDayRecommendWrap = tuple2.i0;
  newState.recommendWrap = tuple2.i1;
  newState.loadingState = LoadingState.success;
  if (newState.everyDayRecommendWrap?.recommend != null &&
      newState.everyDayRecommendWrap?.recommend?.isNotEmpty == true) {
    newState.everyDayRecommendMode = RecommendSectionModel()
      ..title = "每日推荐歌单"
      ..items = newState.everyDayRecommendWrap!.recommend!;
  }

  if (newState.recommendWrap?.result != null &&
      newState.recommendWrap?.result?.isNotEmpty == true) {
    newState.recommendModel = RecommendSectionModel()
      ..title = "推荐歌单"
      ..items = newState.recommendWrap!.result!;
  }
  return newState;
}

SquareRecommendState _onAction(SquareRecommendState state, Action action) {
  final SquareRecommendState newState = state.clone();
  return newState;
}
