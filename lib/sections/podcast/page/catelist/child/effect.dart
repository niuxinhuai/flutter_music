import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';
import 'action.dart';
import 'state.dart';

Effect<CatelistRecommendState>? buildEffect() {
  return combineEffects(<Object, Effect<CatelistRecommendState>>{
    CatelistRecommendAction.action: _onAction,
    Lifecycle.initState: _initState,
    CatelistRecommendAction.onTapError: _onTapError,
  });
}

void _initState(Action action, Context<CatelistRecommendState> ctx) async {
  CatelistRecommendWrap wrap =
      await CommonService.getDJCatelistRecommend(ctx.state.id!).catchError(
          (e) => ctx.dispatch(CatelistRecommendActionCreator.didErrorAction()));
  if (wrap.code != null && wrap.code == 200) {
    ctx.dispatch(CatelistRecommendActionCreator.didFetchDataAction(wrap));
  } else {
    ctx.dispatch(CatelistRecommendActionCreator.didErrorAction());
  }
}

void _onTapError(Action action, Context<CatelistRecommendState> ctx) {
  _initState(action, ctx);
}

void _onAction(Action action, Context<CatelistRecommendState> ctx) {}
