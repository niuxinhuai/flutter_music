import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UserCenterState>? buildEffect() {
  return combineEffects(<Object, Effect<UserCenterState>>{
    UserCenterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserCenterState> ctx) {}
