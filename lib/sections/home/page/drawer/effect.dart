import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'package:flutter_music/helper/user.dart';
import 'package:flutter_music/repository/services/common_service.dart';
import 'package:flutter_music/widgets/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeDrawerState>? buildEffect() {
  return combineEffects(<Object, Effect<HomeDrawerState>>{
    Lifecycle.initState: _initState,
    HomeDrawerAction.action: _onAction,
    HomeDrawerAction.onTapSegment: _onTapSegment,
    HomeDrawerAction.onTapLogin: _onTapLoginAction,
    HomeDrawerAction.onTapQRCode: _onTapQRCode,
  });
}

void _onAction(Action action, Context<HomeDrawerState> ctx) {}

void _initState(Action action, Context<HomeDrawerState> ctx) async {
  ctx.state.isLogin = UserDefault.isLogin();
  ctx.state.nickname = ctx.state.isLogin ? "已登录" : "立即登录";
}

void _onTapSegment(Action action, Context<HomeDrawerState> ctx) async {
  String value = action.payload;
  _close(ctx.context);
}

void _close(P.BuildContext context) {
  P.Navigator.pop(context);
}

///点击了登录
void _onTapLoginAction(Action action, Context<HomeDrawerState> ctx) {
  if (ctx.state.isLogin == false) {
    ///去登录
    _close(ctx.context);
    ARouter.open(ctx.context, RouterKeys.login);
  }
}

///点击了二维码
void _onTapQRCode(Action action, Context<HomeDrawerState> ctx) {
  UserDefault.visitorLogin();
  print(">>>>>>>>>走了开始加载");
  CommonService.getRecommendSong();
}
