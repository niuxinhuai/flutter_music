import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'package:flutter_music/helper/router_helper.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState>? buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.onLeading: _onLeading,
    LoginAction.onTapLogin: _onTapLogin,
  });
}

void _onLeading(Action action, Context<LoginState> ctx) {
  ARouter.close(ctx.context);
}

void _onTapLogin(Action action, Context<LoginState> ctx) {
  ARouter.close(ctx.context);
  ARouter.open(ctx.context, RouterKeys.photo_login);
}

void _onAction(Action action, Context<LoginState> ctx) {}
