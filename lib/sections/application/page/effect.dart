import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as P;
import 'package:flutter_music/helper/user.dart';
//import 'package:flutter_wanandroid/helper/user.dart';
import 'action.dart';
import 'state.dart';

Effect<ApplicationState>? buildEffect() {
  return combineEffects(<Object, Effect<ApplicationState>>{
    ApplicationAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    ApplicationAction.onTap: _onTap,
    ApplicationAction.onPageChanged: _onPageChanged,
  });
}

void _initState(Action action, Context<ApplicationState> ctx) {
//  ///每次登录刷新一下当前状态
  UserDefault.refresh();
  int initialPage = 0;
  P.PageController pageController = P.PageController(initialPage: initialPage);
  ctx.dispatch(
      ApplicationActionCreator.didFetchAction(initialPage, pageController));
}

void _onTap(Action action, Context<ApplicationState> ctx) {
  int index = action.payload;
  ctx.state.pageController?.animateToPage(index,
      duration: const Duration(milliseconds: 300), curve: P.Curves.ease);
}

void _onPageChanged(Action action, Context<ApplicationState> ctx) {
  int index = action.payload;
  ctx.dispatch(ApplicationActionCreator.didPageChangedAction(index));
}

void _dispose(Action action, Context<ApplicationState> ctx) {
  ctx.state.pageController?.dispose();
}

void _onAction(Action action, Context<ApplicationState> ctx) {}
