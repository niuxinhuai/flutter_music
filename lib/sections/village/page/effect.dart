import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' as P;
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/sections/village/models/category.dart';
import 'action.dart';
import 'state.dart';

Effect<VillageState>? buildEffect() {
  return combineEffects(<Object, Effect<VillageState>>{
    VillageAction.action: _onAction,
    Lifecycle.initState: _initState,
    VillageAction.onTapError: _onTapError,
    VillageAction.onTapLeading: _onTapLeading,
    VillageAction.onTapNav: _onTapNav,
  });
}

void _initState(Action action, Context<VillageState> ctx) async {
  VideoCategoryWrap categoryWrap = await CommonService.getVideoCategoryList()
      .catchError((e) => ctx.dispatch(VillageActionCreator.didErrorAction()));

  ctx.dispatch(VillageActionCreator.didRefreshAction(categoryWrap));
}

void _onTapError(Action action, Context<VillageState> ctx) {
  _initState(action, ctx);
}

void _onTapLeading(Action action, Context<VillageState> ctx) {
  ctx.state.globalKey.currentState?.openDrawer();
}

void _onTapNav(Action action, Context<VillageState> ctx) {}

void _onAction(Action action, Context<VillageState> ctx) {}
