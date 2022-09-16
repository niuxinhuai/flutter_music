import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_music/helper/router.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchDetailState>? buildEffect() {
  return combineEffects(<Object, Effect<SearchDetailState>>{
    SearchDetailAction.action: _onAction,
    SearchDetailAction.onTapClean: _onTapClean,
  });
}

void _onTapClean(Action action, Context<SearchDetailState> ctx) {
  ARouter.pop(ctx.context);
}

void _onAction(Action action, Context<SearchDetailState> ctx) {}
