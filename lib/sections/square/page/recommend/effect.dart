import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/square/models/recommend.dart';
import 'action.dart';
import 'state.dart';

Effect<SquareRecommendState>? buildEffect() {
  return combineEffects(<Object, Effect<SquareRecommendState>>{
    SquareRecommendAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SquareRecommendState> ctx) async {
  SquareEveryDayRecommendWrap everyDayRecommendWrap =
      await CommonService.getRecommendResource();

  SquareRecommendWrap recommendWrap =
      await CommonService.getRecommendPersonalized();

  ctx.dispatch(SquareRecommendActionCreator.didFetchDataAction(
      everyDayRecommendWrap, recommendWrap));
}

void _onAction(Action action, Context<SquareRecommendState> ctx) {}
