import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/podcast/models/catelist.dart';
import 'action.dart';
import 'state.dart';

Effect<CatelistState>? buildEffect() {
  return combineEffects(<Object, Effect<CatelistState>>{
    CatelistAction.action: _onAction,
    Lifecycle.initState: _initState,
    CatelistAction.onTapError: _onTapError,
  });
}

void _initState(Action action, Context<CatelistState> ctx) async {
  CatelistWrap wrap = await CommonService.getDJCatelist()
      .catchError((e) => ctx.dispatch(CatelistActionCreator.didErrorAction()));
  if (wrap.code != null && wrap.code == 200) {
    ctx.dispatch(CatelistActionCreator.didFetchDataAction(wrap));
  } else {
    ctx.dispatch(CatelistActionCreator.didErrorAction());
  }
}

void _onTapError(Action action, Context<CatelistState> ctx) {
  _initState(action, ctx);
}

void _onAction(Action action, Context<CatelistState> ctx) {}
