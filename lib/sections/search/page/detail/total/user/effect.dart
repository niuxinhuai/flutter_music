import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UserState>? buildEffect() {
  return combineEffects(<Object, Effect<UserState>>{
    UserAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserState> ctx) {}
