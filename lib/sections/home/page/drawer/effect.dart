import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/widgets/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeDrawerState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeDrawerState>>{
    Lifecycle.initState: _initState,
    HomeDrawerAction.action: _onAction,
    HomeDrawerAction.onTapSegment: _onTapSegment,
  });
}

void _onAction(Action action, Context<HomeDrawerState> ctx) {}

void _initState(Action action, Context<HomeDrawerState> ctx) async {
//  ctx.state.isLogin = UserDefault.isLogin();
  ctx.state.titles.last = ctx.state.isLogin ? "退出登录" : "登录";
}

void _onTapSegment(Action action, Context<HomeDrawerState> ctx) async {
  String value = action.payload;
  P.Navigator.pop(ctx.context);
}
